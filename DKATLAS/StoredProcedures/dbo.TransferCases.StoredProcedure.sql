USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[TransferCases]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TransferCases]
(
@CaseDetails [UT_TransferCases] READONLY,
@Gbb_Type VARCHAR(10)
)

AS
BEGIN

		INSERT INTO XN_TEMP_GBB_ALL
		SELECT *, NULL AS AtlasInsuranceId, @Gbb_Type, NULL AS Transferd_Date, '' AS Transferd_Status FROM @CaseDetails 
		WHERE BillNumber NOT IN (SELECT BillNumber FROM XN_TEMP_GBB_ALL)
		
		UPDATE XN_TEMP_GBB_ALL
				SET Transferd_Status = T.Case_Id
				FROM XN_TEMP_GBB_ALL X
				INNER JOIN tblTreatment T ON X.BillNumber = T.BILL_NUMBER
		WHERE ISNULL(Transferd_Status,'') = ''

		UPDATE	XN_TEMP_GBB_ALL
		SET		
			InsuranceName = LTRIM(RTRIM(InsuranceName)),
			PatientFirstName = LTRIM(RTRIM(PatientFirstName)),
			PatientLastName = LTRIM(RTRIM(PatientLastName)),
			ProviderName = LTRIM(RTRIM(ProviderName)),
			ProviderAddress = LTRIM(RTRIM(ProviderAddress))
		WHERE ISNULL(Transferd_Status,'') = ''
	
		UPDATE XN_TEMP_GBB_ALL 
		SET IsDuplicateCase = CASE WHEN CONVERT(MONEY,[FltBillAmount])- CONVERT(MONEY,FltPaid) > 0 THEN 0 ELSE 1 END
		WHERE ISNULL(Transferd_Status,'') = ''
		
		-- INSERT GBB PROVIDER MAPPING IN MASTER
		INSERT INTO GreenBillsProviders (SZ_COMPANY_ID,	SZ_OFFICE_ID, Gbb_Type)
		SELECT DISTINCT  XN.CompanyId, XN.provider_id, XN.GBB_Type  FROM XN_TEMP_GBB_ALL XN
		LEFT OUTER JOIN  GreenBillsProviders GB ON XN.CompanyId = GB.SZ_COMPANY_ID AND XN.provider_id=GB.SZ_OFFICE_ID and GB.Gbb_Type = @Gbb_Type
		WHERE GB.PROVIDER_ID IS NULL AND GB.SZ_COMPANY_ID IS NULL and XN.GBB_Type = @Gbb_Type

		----SELECT DISTINCT  XN.CompanyId, XN.provider_id, @Gbb_Type  FROM XN_TEMP_GBB_ALL XN
		----LEFT OUTER JOIN  GreenBillsProviders GB ON XN.CompanyId = GB.SZ_COMPANY_ID AND XN.provider_id=GB.SZ_OFFICE_ID and GB.Gbb_Type = @Gbb_Type
		----WHERE GB.PROVIDER_ID IS NULL AND GB.SZ_COMPANY_ID IS NOT NULL
		
		--- UPDATE Provider as per RFA data
		UPDATE XN_TEMP_GBB_ALL
		SET AtlasProviderID =  GB.PROVIDER_ID
		FROM XN_TEMP_GBB_ALL XN
		LEFT OUTER JOIN  GreenBillsProviders GB ON XN.CompanyId = GB.SZ_COMPANY_ID AND XN.provider_id=GB.SZ_OFFICE_ID and GB.Gbb_Type = @Gbb_Type
		WHERE ISNULL(AtlasProviderID,'') = '' AND  GB.PROVIDER_ID IS NOT NULL

		-- INSERT GBB Insurance MAPPING IN MASTER
		INSERT INTO GreenBillsInsurance (SZ_COMPANY_ID,	SZ_INSURANCE_ID, Gbb_Type)
		SELECT DISTINCT  XN.CompanyId, XN.insurancecompanyid, XN.Gbb_Type  FROM XN_TEMP_GBB_ALL XN
		LEFT OUTER JOIN  GreenBillsInsurance GB ON XN.CompanyId = GB.SZ_COMPANY_ID AND XN.insurancecompanyid=GB.SZ_INSURANCE_ID and GB.Gbb_Type = @Gbb_Type
		WHERE GB.INSURANCECOMPANY_ID IS NULL AND GB.SZ_COMPANY_ID IS NULL and Xn.GBB_Type = @Gbb_Type

		----SELECT DISTINCT  XN.CompanyId, XN.insurancecompanyid, @Gbb_Type  FROM XN_TEMP_GBB_ALL XN
		----LEFT OUTER JOIN  GreenBillsInsurance GB ON XN.CompanyId = GB.SZ_COMPANY_ID AND XN.insurancecompanyid=GB.SZ_INSURANCE_ID and GB.Gbb_Type = @Gbb_Type
		----WHERE GB.INSURANCECOMPANY_ID IS NULL AND GB.SZ_COMPANY_ID IS NOT NULL 


		--- UPDATE InsuranceCompany as per RFA data
		UPDATE XN_TEMP_GBB_ALL
		SET AtlasInsuranceId =  GB.INSURANCECOMPANY_ID
		FROM XN_TEMP_GBB_ALL XN
		LEFT OUTER JOIN  GreenBillsInsurance GB ON XN.CompanyId = GB.SZ_COMPANY_ID AND XN.insurancecompanyid=GB.SZ_INSURANCE_ID  and GB.Gbb_Type = @Gbb_Type
		WHERE ISNULL(AtlasInsuranceId,'') = '' AND  GB.INSURANCECOMPANY_ID IS NOT NULL


	--EXEC TransferCasesLogic @Gbb_Type
			
		
UPDATE  XN_TEMP_GBB_ALL 
SET DenialReason1 = RFA_DENIAL_REASON
from XN_TEMP_GBB_ALL X
INNER JOIN GreenBillsDenial GD ON GD.GB_DENIAL_REASON = X.DenialReason1 
WHERE DenialReason1 <> RFA_DENIAL_REASON

UPDATE  XN_TEMP_GBB_ALL 
SET DenialReason2 = RFA_DENIAL_REASON
from XN_TEMP_GBB_ALL X
INNER JOIN GreenBillsDenial GD ON GD.GB_DENIAL_REASON = X.DenialReason2
WHERE DenialReason2 <> RFA_DENIAL_REASON

UPDATE  XN_TEMP_GBB_ALL 
SET DenialReason3 = RFA_DENIAL_REASON
from XN_TEMP_GBB_ALL X
INNER JOIN GreenBillsDenial GD ON GD.GB_DENIAL_REASON = X.DenialReason3  
WHERE DenialReason3 <> RFA_DENIAL_REASON

	END










GO
