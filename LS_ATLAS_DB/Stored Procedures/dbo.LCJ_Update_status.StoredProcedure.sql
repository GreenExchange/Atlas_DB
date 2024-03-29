USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_Update_status]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_Update_status]--[LCJ_Update_status] 'FH13-161296','SUMMONS-PRINTED ','tech'
(
	@DomainID NVARCHAR(50),
	@case_id VARCHAR(100),
	@Status VARCHAR(100),
	@UserId VARCHAR(100)
)
AS
Declare @Old_Status AS NVARCHAR(100)
SET @Old_Status =(select status from tblcase where Case_Id =@case_id and DomainId=@DomainID)
BEGIN
	IF(@Status <>  @Old_Status)
	BEGIN
		
		update tblcase set status=@Status where case_id=@case_id and DomainId=@DomainID
		
		insert into tblnotes (Notes_Desc,	Notes_Type,	Notes_Priority,	Case_Id,	Notes_Date,	User_Id,	DomainId) values ('Status changed from '+@Old_Status+' to '+@Status,'Activity',1,@case_id,GETDATE(),@UserId,@DomainID)

	END
      
   IF(LTRIM(RTRIM(@Status)) = 'SUMMONS-PRINTED')
   BEGIN
		update tblcase 
		set date_summons_printed = getdate()
		where date_summons_printed is null and case_id = @case_id and DomainId=@DomainID
   END
 
END

GO
