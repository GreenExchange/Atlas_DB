USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_SETTLED_CASES]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_SETTLED_CASES] --'1993'
@PROVIDER_ID NVARCHAR(100)
AS
BEGIN
		select 
		TC.Case_Id,
		InjuredParty_LastName + ' ' + InjuredParty_FirstName as [InjuredParty_Name] , 
		Provider_Name,
		tblprovider.Provider_Id ,
		InsuranceCompany_Name ,
		Indexoraaa_number,  
		round(convert(money,convert(float,TC.Claim_Amount) - convert(float,TC.Paid_Amount)),2) as Balance,
		ISNULL((SELECT ISNULL(SUM(TBLTREATMENT.CLAIM_AMOUNT),0.00) AS [AMOUNT BILLED]
		FROM TBLCASE 
		INNER JOIN
		TBLTREATMENT ON TBLCASE.CASE_ID = TBLTREATMENT.CASE_ID
		WHERE TBLCASE.CASE_ID=TC.CASE_ID
		GROUP BY TBLCASE.CASE_ID),0.00) as Claim_Amount,
		Status ,
		Ins_Claim_Number ,
		convert(varchar, TC.DateOfService_Start,101)as[DateOfStart],  
		INITIAL_STATUS
		From tblcase TC
		 inner join 
		tblprovider on TC.provider_id=tblprovider.provider_id 
		inner join 
		tblinsurancecompany on TC.insurancecompany_id=tblinsurancecompany.insurancecompany_id  
		inner join 
		tblTreatment on TC.Case_Id=tblTreatment.Case_Id
		WHERE TBLPROVIDER.PROVIDER_ID=@PROVIDER_ID AND TC.STATUS='SETTLED'

END

GO
