USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_FPartner_Report]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_FPartner_Report]  --F_FPartner_Report 'fh07-42372',''
																	 --F_FPartner_Report 'fh07-42372','',0,'0',0,'0','','','','','','','','',''
(
	@Case_Id VARCHAR(200),
	@InjuredParty_Name VARCHAR(MAX),
	@Provider INT,
	@ProviderGrp VARCHAR(200),
	@Insurance INT,
	@Court INT,
	@IndexAAANo VARCHAR(100),
	@DateOpened VARCHAR(100),
	@FeeSBalance numeric(18,2) =NULL,
	@FreezeDtStatus VARCHAR(100),
	@FhkpSplitPer numeric(18,2) =NULL,
	@FilingFeeCollected numeric(18,2) =NULL,
	@FilingFeeBilled numeric(18,2) =NULL,
	@ProviderBilling VARCHAR(100),
	@ProviderFF VARCHAR(100)
)
AS
BEGIN
	SET NOCOUNT ON;
		SELECT C.Case_Id AS [Case_Id],
			ISNULL(C.InjuredParty_FirstName, N'') + N'  ' + ISNULL(C.InjuredParty_LastName, N'') AS [Patient_name],
            P.Provider_Name AS [Provider_name],
            P.Provider_GroupName AS [Provider_Group],
            I.InsuranceCompany_Name AS [Insurance_name],
            CONVERT(VARCHAR(10),C.Date_Opened,101) AS [Date_Opened],
            IndexOrAAA_Number AS [Index/AAA],
            Court_Name AS [Court_Name],
            isnull(Fee_Schedule -Paid_Amount,0) AS [Fee_Schedule_Balance],
            fhkp_status  AS [Freeze_Date_Status],
            isnull(firm_split_percent,0)  AS [Fhkp_Split_Percent],
            Case When p.Provider_FF = '0' 
            THEN (SELECT sum(transactions_Amount) from tbltransactions where case_id = c.case_id and transactions_type in ('ffb','ffbf') and ff_paid_by = 'fhkp')
            ELSE '0' END AS [Laid_out]
									-- (select sum(transactions_Amount) from tbltransactions t
									--inner join tblprovider p on t.provider_id=p.provider_id 
									--where t.case_id = c.case_id and transactions_type in ('ffb','ffbf') and ff_paid_by = 'fhkp' and  ISNULL(provider_ff,'')='0') AS [Laid_out],

		FROM tblCase C
			INNER JOIN TblProvider P ON P.Provider_Id = C.Provider_Id
			INNER JOIN tblInsuranceCompany I ON I.InsuranceCompany_Id = C.InsuranceCompany_Id
			LEFT OUTER JOIN tblCourt Court ON Court.Court_Id = C.Court_Id
		WHERE 1=1 AND  firm_split_percent is not null 
				AND (@Case_Id='' OR C.Case_Id=@Case_Id) 
				AND (@InjuredParty_Name='' OR C.InjuredParty_FirstName LIKE '%'+@InjuredParty_Name+'%'  OR C.InjuredParty_LastName LIKE '%'+@InjuredParty_Name+'%' )
				AND (@Provider=0 OR P.Provider_Id =@Provider)
				AND (@ProviderGrp='0' OR P.Provider_GroupName LIKE '%'+@ProviderGrp+'%')
				AND (@Insurance=0 OR I.InsuranceCompany_Id =@Insurance)
				AND (@Court=0 OR C.Court_Id=@Court)
				AND (@IndexAAANo='' OR IndexOrAAA_Number=@IndexAAANo)
				AND (@DateOpened='' OR C.Date_Opened =@DateOpened)
				AND (@FeeSBalance is null OR @FeeSBalance =0.00 OR (Fee_Schedule -Paid_Amount) = @FeeSBalance)
				AND (@FreezeDtStatus='' OR fhkp_status=@FreezeDtStatus)
				AND (@FhkpSplitPer is null OR firm_split_percent =@FhkpSplitPer)
				AND (@FilingFeeCollected is null OR @FilingFeeCollected=0.00 OR (SELECT SUM(Transactions_Amount) FROM tblTransactions WHERE Case_Id =C.Case_Id AND Transactions_Type IN ('FFC')) = @FilingFeeCollected)
				AND (@FilingFeeBilled is null OR @FilingFeeBilled=0.00 OR (SELECT SUM(Transactions_Amount) FROM tblTransactions WHERE Case_Id =C.Case_Id AND Transactions_Type IN ('FFB','EXP')) = @FilingFeeBilled )
				AND (@ProviderBilling='' OR Provider_Billing = @ProviderBilling)
				AND (@ProviderFF='' OR Provider_FF =@ProviderFF )
END

GO
