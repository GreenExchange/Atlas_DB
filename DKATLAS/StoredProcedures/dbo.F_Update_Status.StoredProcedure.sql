USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_Update_Status]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[F_Update_Status]
	
AS
BEGIN
	
	SET NOCOUNT ON;
		
	INSERT INTO tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id)
	SELECT 'Status Changed from OPEN VERIFICATION-RESPONSE SENT (1) to OPEN VERIFICATION-CARRIER UNRESPONSIVE (1)','Activity','1',case_id ,GETDATE(),'System' FROM tblcase
	WHERE Date_Open_Verification_Response_Sent1 is not null and
	Status='OPEN VERIFICATION-RESPONSE SENT (1)' AND DATEDIFF(DD,Date_Open_Verification_Response_Sent1,GETDATE()) > 40
	
	UPDATE tblCase
	SET Status ='OPEN VERIFICATION-CARRIER UNRESPONSIVE (1)'
	WHERE Date_Open_Verification_Response_Sent1 is not null and
	Status='OPEN VERIFICATION-RESPONSE SENT (1)' AND DATEDIFF(DD,Date_Open_Verification_Response_Sent1,GETDATE()) > 40
	
	INSERT INTO tblNotes(Notes_Desc,Notes_Type,Notes_Priority,Case_Id,Notes_Date,User_Id)
	SELECT 'Status Changed from OPEN VERIFICATION-RESPONSE SENT (2) to OPEN VERIFICATION-CARRIER UNRESPONSIVE (2)','Activity','1',case_id ,GETDATE(),'System' FROM tblcase
	WHERE Date_Open_Verification_Response_Sent2 is not null and
	Status='OPEN VERIFICATION-RESPONSE SENT (2)' AND DATEDIFF(DD,Date_Open_Verification_Response_Sent2,GETDATE()) > 40
	
	UPDATE tblCase
	SET Status ='OPEN VERIFICATION-CARRIER UNRESPONSIVE (2)'
	WHERE Date_Open_Verification_Response_Sent2 is not null and
	Status='OPEN VERIFICATION-RESPONSE SENT (2)' AND DATEDIFF(DD,Date_Open_Verification_Response_Sent2,GETDATE()) > 40
					
END
GO
