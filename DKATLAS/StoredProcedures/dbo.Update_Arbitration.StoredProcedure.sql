USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Update_Arbitration]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Arbitration]
(
	@CASE_ID VARCHAR(100),
	@REPRESENTETIVE NVARCHAR(500),
	@Representative_Contact_Number NVARCHAR (500),
	@INJUREDPARTY_ADDRESS NVARCHAR(255),
	@INJUREDPARTY_CITY NVARCHAR(40),
	@INJUREDPARTY_STATE NVARCHAR(40),
	@INJUREDPARTY_ZIP NVARCHAR(40),
	@INSUREDPARTY_LASTNAME 	NVARCHAR(100),
	@INSUREDPARTY_FIRSTNAME	NVARCHAR(100),
	@INSUREDPARTY_ADDRESS	NVARCHAR(255),
	@INSUREDPARTY_CITY	NVARCHAR(40),
	@INSUREDPARTY_STATE	NVARCHAR(40),
	@INSUREDPARTY_ZIP	NVARCHAR(40),
	@DENIAL_DATE        NVARCHAR(100)=null,	
	@INSURANCECOMPANY_INITIAL_ADDRESS	VARCHAR(250)--,
	--@INSURANCECOMPANY_INITIAL_CITY	VARCHAR(100),
	--@INSURANCECOMPANY_INITIAL_STATE	VARCHAR(100),
	--@INSURANCECOMPANY_INITIAL_ZIP	VARCHAR(100)
)
AS
BEGIN
	BEGIN TRANSACTION;
	
	if @Representetive =''
		set @Representetive =null
	if @Representative_Contact_Number =''
		set @Representative_Contact_Number =null
			
		UPDATE tblcase
		SET 
			tblcase.Representetive =@Representetive,
			tblcase.Representative_Contact_Number = @Representative_Contact_Number,
			tblcase.INSUREDPARTY_LASTNAME = @INSUREDPARTY_LASTNAME,
			tblcase.INSUREDPARTY_FIRSTNAME = @INSUREDPARTY_FIRSTNAME,
			tblcase.InsuredParty_Address =@InsuredParty_Address,
			tblcase.InsuredParty_City = @InsuredParty_City,
			tblcase.InsuredParty_State = @InsuredParty_State,
			tblcase.InsuredParty_Zip = @InsuredParty_Zip,
			tblcase.DENIAL_DATE = @DENIAL_DATE,
			tblcase.INJUREDPARTY_ADDRESS = @INJUREDPARTY_ADDRESS,
			tblcase.INJUREDPARTY_CITY = @INJUREDPARTY_CITY,
			tblcase.INJUREDPARTY_STATE = @INJUREDPARTY_STATE,
			tblcase.INJUREDPARTY_ZIP = @INJUREDPARTY_ZIP,
			tblcase.InsuranceCompany_Initial_Address=@InsuranceCompany_Initial_Address
		FROM  tblcase
		WHERE Case_Id = @Case_ID
			 --AND tblcase.InsuranceCompany_Id = tblInsuranceCompany.InsuranceCompany_Id  
			
		
	COMMIT;

END
GO
