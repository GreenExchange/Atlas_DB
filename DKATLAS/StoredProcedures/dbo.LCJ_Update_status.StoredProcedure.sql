USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_Update_status]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_Update_status]--[LCJ_Update_status] 'FH13-161296','SUMMONS-PRINTED ','tech'
(
	@case_id VARCHAR(100),
	@Status VARCHAR(100),
	@UserId VARCHAR(100)
)
AS
Declare @Old_Status AS NVARCHAR(100)
SET @Old_Status =(select status from tblcase where Case_Id =@case_id)
BEGIN
	IF(@Status <>  @Old_Status)
	BEGIN
		
		update tblcase set status=@Status where case_id=@case_id
		
		insert into tblnotes values ('Status changed from '+@Old_Status+' to '+@Status,'Activity',1,@case_id,GETDATE(),@UserId)

	END
      
   IF(LTRIM(RTRIM(@Status)) = 'SUMMONS-PRINTED')
   BEGIN
		update tblcase 
		set date_summons_printed = getdate()
		where date_summons_printed is null and case_id = @case_id
   END
 
END
GO
