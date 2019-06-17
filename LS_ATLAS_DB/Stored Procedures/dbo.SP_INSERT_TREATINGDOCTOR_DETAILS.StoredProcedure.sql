USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_TREATINGDOCTOR_DETAILS]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERT_TREATINGDOCTOR_DETAILS]
	@DomainID NVARCHAR(50),
	@Treatment_Id int,
	@DOCTOR_ID INT ,
	@DOCTOR_NAME varchar(50)
	--@TreatingDoctor_ID INT
	
AS
BEGIN
	IF EXISTS(SELECT 1 FROM txn_case_treating_doctor WHERE TREATMENT_ID=@Treatment_Id AND DOCTOR_ID=@DOCTOR_ID) 
	BEGIN
		RETURN -2
	END
	ELSE
	BEGIN
		INSERT INTO txn_case_treating_doctor(TREATMENT_ID,DOCTOR_ID,DomainID)
		VALUES(@Treatment_Id,@DOCTOR_ID,@DomainID)
	END
END

GO
