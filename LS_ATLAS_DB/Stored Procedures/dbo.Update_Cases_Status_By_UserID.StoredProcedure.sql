USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Update_Cases_Status_By_UserID]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Cases_Status_By_UserID]
(
	@DomainId NVARCHAR(50),
	@status varchar(100),
	@case_id varchar(20),
	@User_Id INT
)
AS
BEGIN
    Declare @NDesc varchar(max),
    --@Description nvarchar(2000),
	@old_stat_hierc int,  
	@new_stat_hierc int,
	@motion_stat_hierc smallint,
	@PROVIDER_ID nvarchar(50) ,
	@provider_ff nchar(10),
	@status_bill money,
	@status_bill_type nvarchar(20),
	@status_bill_notes varchar(200),
	@st varchar(MAX)

	DECLARE @OldValue VARCHAR(100), @newValue VARCHAR(100)
				declare @s_l_user VARCHAR(100)
				DECLARE @oldStatus NVARCHAR(500)
				DECLARE @newStatus NVARCHAR(500)

		SET @newStatus=@status
		SET @s_l_user = (SELECT USERNAME FROM IssueTracker_Users (NOLOCK) WHERE userid = @User_Id)

	   DECLARE @TotalCount INT = 0
       DECLARE @Counter INT = 1
       DECLARE @s_l_CaseID VARCHAR(100) = ''
       DECLARE @tbCaseIds TABLE
              (
                     ID INT IDENTITY(1,1),
                     [CaseId] VARCHAR(100) NOT NULL
              )

       INSERT INTO  @tbCaseIds
       SELECT Case_ID 
		FROM DBO.TBLCASE CAS
		LEFT OUTER JOIN dbo.tblPacket pkt ON cas.FK_Packet_ID = pkt.Packet_Auto_ID 
		WHERE 
			pkt.PacketID = @case_id OR cas.Case_Id = @case_id


       SELECT @TotalCount = COUNT(*) FROM @tbCaseIds
       WHILE(@Counter <= @TotalCount)
       BEGIN
               SELECT @s_l_CaseID = CaseID FROM @tbCaseIds   WHERE ID = @Counter

				
				SET @oldStatus = (select status from tblcase (NOLOCK) where case_id = @s_l_CaseID and DomainId=@DomainId)
				
	
				if(@status<>'')
				begin

					if(@oldStatus <> @newStatus)
					BEGIN
							UPDATE tblcase SET STATUS = @newStatus WHERE CASE_ID = @s_l_CaseID AND DomainId = @DomainId
							set @NDesc = 'Status changed from ' + @oldStatus + ' to ' + @newStatus       
							exec LCJ_AddNotes @DomainId=@DomainId,@case_id=@s_l_CaseID,@Notes_Type='Activity',@Ndesc = @NDesc,@user_Id= @s_l_user,@ApplyToGroup = 0  
					end
				END
              Print @s_l_CaseID
              -- Reight your logic here         
              SET @Counter = @Counter + 1
              SET @s_l_CaseID = NULL
       END
END

GO
