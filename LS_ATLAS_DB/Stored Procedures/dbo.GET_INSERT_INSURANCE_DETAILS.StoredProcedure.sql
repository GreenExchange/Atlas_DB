USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[GET_INSERT_INSURANCE_DETAILS]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_INSERT_INSURANCE_DETAILS]
	@SZ_INSURANCE_NAME	VARCHAR(100),
	@SZ_INSURANCE_ADDRESS	VARCHAR(500),
	@SZ_INSURANCE_CITY	VARCHAR(100),
	@SZ_STATE	VARCHAR(100),
	@SZ_INSURANCE_ZIP	VARCHAR(50),
	@SZ_INSURANCE_EMAIL	VARCHAR(100),
	@SZ_COMPANY_ID VARCHAR(200),
	@SZ_INSURANCE_ID VARCHAR(100)
AS
BEGIN
	DECLARE @NEW_INSURANCE AS VARCHAR(100)
	IF EXISTS(SELECT TOP 1 1 FROM TBLINSURANCECOMPANY WHERE InsuranceCompany_Name = @SZ_INSURANCE_NAME)
	BEGIN		
		SET @NEW_INSURANCE = (SELECT top 1 InsuranceCompany_Id FROM TBLINSURANCECOMPANY WHERE InsuranceCompany_Name = @SZ_INSURANCE_NAME)
		IF EXISTS(SELECT TOP 1 1 FROM GREENBILLSINSURANCE WHERE SZ_COMPANY_ID = @SZ_COMPANY_ID AND SZ_INSURANCE_ID = @SZ_INSURANCE_ID AND INSURANCECOMPANY_ID IS NULL)
		BEGIN
			UPDATE GREENBILLSINSURANCE SET INSURANCECOMPANY_ID = @NEW_INSURANCE WHERE SZ_COMPANY_ID = @SZ_COMPANY_ID AND SZ_INSURANCE_ID = @SZ_INSURANCE_ID	AND INSURANCECOMPANY_ID IS NULL
		END		
	END
	ELSE
	BEGIN		
		INSERT INTO TBLINSURANCECOMPANY
		(
			InsuranceCompany_Name,
			InsuranceCompany_Local_Address,
			InsuranceCompany_Local_City,
			InsuranceCompany_Local_State,
			InsuranceCompany_Local_Zip,
			InsuranceCompany_Email
		)
		VALUES
		(
			@SZ_INSURANCE_NAME,
			@SZ_INSURANCE_ADDRESS,
			@SZ_INSURANCE_CITY,
			@SZ_STATE,
			@SZ_INSURANCE_ZIP,
			@SZ_INSURANCE_EMAIL		
		)
		SET @NEW_INSURANCE = (SELECT MAX(InsuranceCompany_Id) as InsuranceCompany_Id FROM TBLINSURANCECOMPANY WHERE InsuranceCompany_Name = @SZ_INSURANCE_NAME)
		UPDATE GREENBILLSINSURANCE SET INSURANCECOMPANY_ID = @NEW_INSURANCE WHERE SZ_COMPANY_ID = @SZ_COMPANY_ID AND SZ_INSURANCE_ID = @SZ_INSURANCE_ID		
	END
	SELECT @NEW_INSURANCE AS InsuranceCompany_Id
END

GO
