USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Billing_Packet_DeleteCase]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Billing_Packet_DeleteCase] 
	-- Add the parameters for the stored procedure here
	--@DomainID VARCHAR(50),
	@s_a_Caption NVARCHAR(MAX),
	@s_a_MultipleCase_ID VARCHAR(MAX),	
	@s_a_UserName NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @i_l_result INT
	DECLARE @s_l_message VARCHAR(500)
	DECLARE @s_l_Existing_Packet_IDS VARCHAR(1000) = ''

	SELECT @s_l_Existing_Packet_IDS=tblCase.Case_ID + COALESCE(','+@s_l_Existing_Packet_IDS ,'')   FROM tblCase 
	INNER JOIN Billing_Packet ON tblCase.Case_Id = Billing_Packet.Packeted_Case_ID-- and tblcase.DomainId = Billing_Packet.DomainID 
	WHERE --tblCase.DomainID = @DomainID AND 
	Billing_Packet.Case_ID IN (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,','))

	IF (ISNuLL(@s_l_Existing_Packet_IDS,'') != '')
	BEGIN

		BEGIN TRAN
		-- Delete case from tbltreatment
			Delete from tblTreatment where  Case_ID IN (SELECT s FROM dbo.SplitString(@s_l_Existing_Packet_IDS,',')) 
			AND ACT_CASE_ID IN (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,',')) --------
			--AND DomainId=@DomainID  
	
		-- Unpacket the packded cases

			DECLARE @tblDateStatusChagne TABLE
			(
				CASE_ID VARCHAR(100),
				--DomainID VARCHAR(100),
				Date_Status_Changed DATETIME
			)

			INSERT INTO @tblDateStatusChagne
			SELECT case_id, --DomainID, 
			Date_Status_Changed  FROM tblcase 
			WHERE --DomainID =@DomainID AND 
			Case_Id IN (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,','))

			UPDATE tblCase 
				SET Status =Old_Status
				WHERE-- DomainID =@DomainID AND 
				
				Case_Id IN (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,','))

			UPDATE CAS
			SET Date_Status_Changed = DT.Date_Status_Changed
			FROM TBLCASE CAS 
			INNER JOIN @tblDateStatusChagne DT ON CAS.Case_Id = DT.CASE_ID



			-- // DELETE Documents ---------------------
			DECLARE @tblTagIdDelete TABLE (ImageID INT)
			INSERT INTO @tblTagIdDelete 

			SELECT ImageID FROM TBLDOCIMAGES
			INNER JOIN (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,',')) act_case_id on FilePath like  '%' + act_case_id.s + '%'
			where imageID in
						(
						 SELECT imageID FROM  tblImageTag WHERE TagID IN 
						(SELECT NodeID FROM  dbo.tblTags WHERE CaseId IN  (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,',')))
						)
			DELETE FROM TBLDOCIMAGES where imageID IN (select ImageID from @tblTagIdDelete)

		    DELETE FROM  tblImageTag WHERE TagID IN (select ImageID from @tblTagIdDelete)


		   INSERT INTO tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id--,DomainID
		   )
	       SELECT 'Cases '+ Case_ID + ' unpacketed', 'Activity', 1, Packeted_Case_ID, getdate(),@s_a_UserName--, @DomainID
		   FROM Billing_Packet WHERE Case_ID IN (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,',')) 

			-- Delete case from billin packet
			Delete from Billing_Packet where  Case_ID IN (SELECT s FROM dbo.SplitString(@s_a_MultipleCase_ID,',')) --AND DomainId=@DomainID  
	

		   --Update Auto_Billing_Packet and Auto_Billing_Packet_Info table
		   -- EXEC Auto_Billing_Packet_Insert
			--RUN--
			EXEC Auto_Billing_Case_Insert @s_a_MultipleCase_ID
       

	        SET @s_l_message	= 'Cases deleted successfully from Packets. PacketIDs - '+ @s_l_Existing_Packet_IDS + ' CaseIDs - '+@s_a_MultipleCase_ID
			SET @i_l_result		=  0 

		COMMIT TRAN
	END
	ELSE
	BEGIN
	    SET @s_l_message	= 'Packet not found. No data available for '+ + ' => '+ @s_a_MultipleCase_ID 
		SET @i_l_result		=  0
	END
	SELECT @s_l_message AS [Message], @i_l_result AS [RESULT]
END
	



GO
