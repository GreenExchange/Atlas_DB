USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Report_GP_Reconcilation]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Report_GP_Reconcilation] -- [GP_Reconcilation_Report] 'AMT'
	@s_a_DomainId nvarchar(50),
	@s_a_status nvarchar(100)='',
	@i_a_PortfolioId int=0,
	@dt_a_invFromDate nvarchar(50)='',
	@dt_a_invToDate nvarchar(50)='',
	@i_a_UserId int
AS
BEGIN

    If @dt_a_invFromDate =''
	 BEGIN
	   Set @dt_a_invFromDate = @dt_a_invToDate
	 END
	 Else If @dt_a_invToDate = ''
	 BEGIN
	  Set @dt_a_invToDate = @dt_a_invFromDate
	 END

	 Declare @s_a_UserType Varchar(50);

	 Select @s_a_UserType = LTRIM(RTRIM(UserType)) from IssueTracker_Users(NOLOCK) where userid = @i_a_UserId


	 CREATE TABLE #TempVol (
		  VCaseId VARCHAR(50)
		, VPay DECIMAL(18,2)		
		, VDate DATETIME		
		, VDedct DECIMAL(18,2)		
		, VIntr DECIMAL(18,2)
		, VCheckDate DATETIME
		, VCheckNo VARCHAR(100)
		, VAttorneyF DECIMAL(18,2)
		, VNetPay DECIMAL(18,2)
		, VTransID INT
		, VAL_PAY_Freeze_Date DATETIME
		, Accounting_Date DATETIME
		, Transaction_Description VARCHAR(500)
		, RowNum INT		
		)

		CREATE TABLE #TempLit (
		  VCaseId VARCHAR(50)
		, VTotCol1 DECIMAL(18,2)	
		, VCortFee1 DECIMAL(18,2)
		, VLitFee1 DECIMAL(18,2)
		, VNetLitCol1 DECIMAL(18,2)	
		, VLitPayDt1 DATETIME
		, VLitPayNo1 VARCHAR(100)	
		, VLitChkDt1 DATETIME		
		, VTransID INT
		, LIT_PAY_Freeze_Date DATETIME
		, Accounting_Date DATETIME
		, Transaction_Description VARCHAR(500)
		, RowNum INT		
		)


		--Query to insert into temp table for Voluntary Payment
INSERT INTO #TempVol (VCaseId, VPay,VDate,VDedct,VIntr,VCheckDate,VCheckNo,VAttorneyF,VNetPay,VTransID,VAL_PAY_Freeze_Date,Accounting_Date,Transaction_Description, RowNum)
		SELECT r.*
		FROM
		(
			SELECT
				VP.Case_Id,ISNULL(cpt.Current_Paid,0.00) AS Total_Collection,
				Transaction_Date,
				ISNULL(cpt.Current_Deductible,0.00) AS Deductible
				,ISNULL(cpt.Current_Interest,0.00) AS Pre_Interest
				,Check_Date
				,Check_No
				,ISNULL(cpt.Current_AttorneyFee,0.00) AS Voluntary_AF
				, ((ISNULL(cpt.Current_Paid,0.00)+ISNULL(cpt.Current_Interest,0.00))-(ISNULL(cpt.Current_Deductible,0.00)+ISNULL(cpt.Current_AttorneyFee,0.00))) as VNetPay
				,Transactions_Id
				,cpt.VAL_PAY_Freeze_Date
				,bc.Purchase_Freeze_Date
				,vp.Transaction_Description
	            ,ROW_NUMBER() OVER(PARTITION BY VP.Case_Id ORDER BY Transactions_Id DESC) rn
		   FROM tblcase Cas (NOLOCK) INNER JOIN tbl_Voluntary_Payment VP (NOLOCK) ON cas.Case_Id=VP.Case_Id
				INNER JOIN tblCase_Date_Details (NOLOCK) ON tblCase_Date_Details.Case_Id= VP.Case_Id
				INNER JOIN tbl_CPT_Payment_Details cpt(NOLOCK) on cpt.Transaction_Id = vp.Voluntary_Pay_Id  
				INNER JOIN BILLS_WITH_PROCEDURE_CODES bc (NOLOCK) on bc.CPT_ATUO_ID=cpt.CPT_ATUO_ID
				WHERE cas.DomainId=@s_a_DomainId 
				--AND Transaction_Date < tblCase_Date_Details.Date_Case_Purchased
				AND VP.Payment_Type = 'V'   
				AND (@dt_a_invToDate = '' or Transaction_Date <= @dt_a_invToDate)
                AND (ISNULL(cpt.Current_Paid,0.00) > 0 or ISNULL(cpt.Current_Deductible,0.00) > 0 or ISNULL(cpt.Current_Interest,0.00) > 0 or ISNULL(cpt.Current_AttorneyFee,0.00) > 0)
		) r
		WHERE r.rn <= 3
		ORDER BY r.[Transactions_Id] DESC

--Query to insert into temp table Ends here


--Query to insert into temp table for Litigated Payment
INSERT INTO #TempLit (VCaseId, VTotCol1,VCortFee1,VLitFee1,VNetLitCol1,VLitPayDt1,VLitPayNo1,VLitChkDt1,VTransID,LIT_PAY_Freeze_Date,Accounting_Date,Transaction_Description, RowNum)
		SELECT r.*
		FROM
		(
			SELECT
				 VP.Case_Id
				,cpt.Current_LIT_Paid as Total_Collection
				,cpt.Current_LIT_CourtFee as Court_Fees
				,cpt.Current_LIT_Paid as Litigated_Collection
				,((cpt.Current_LIT_Paid+cpt.Current_LIT_Interest)-(cpt.Current_LIT_Fees+cpt.Current_LIT_CourtFee)) AS VNetLitCol1
				,Transaction_Date
				,check_no
				,Check_Date
				,Transactions_Id
				,cpt.LIT_PAY_Freeze_Date
				,bc.Purchase_Freeze_Date
				,vp.Transaction_Description
				,ROW_NUMBER() OVER(PARTITION BY VP.Case_Id ORDER BY Transactions_Id DESC) rn
		   FROM tblcase Cas (NOLOCK) INNER JOIN tbl_Voluntary_Payment VP (NOLOCK) ON cas.Case_Id=VP.Case_Id
				INNER JOIN tblCase_Date_Details (NOLOCK) ON tblCase_Date_Details.Case_Id= VP.Case_Id
				INNER JOIN tbl_CPT_Payment_Details cpt(NOLOCK) on cpt.Transaction_Id = vp.Voluntary_Pay_Id  
				INNER JOIN BILLS_WITH_PROCEDURE_CODES bc (NOLOCK) on bc.CPT_ATUO_ID=cpt.CPT_ATUO_ID
				WHERE cas.DomainId=@s_a_DomainId 
				--AND Transaction_Date < tblCase_Date_Details.Date_Case_Purchased
				AND VP.Payment_Type = 'L'   
				AND (@dt_a_invToDate = '' or Transaction_Date <= @dt_a_invToDate)
		        AND (ISNULL(cpt.Current_LIT_Paid,0.00) > 0 or ISNULL(cpt.Current_LIT_Interest,0.00) > 0 or ISNULL(cpt.Current_LIT_Fees,0.00) > 0 or ISNULL(cpt.Current_LIT_CourtFee,0.00) > 0)
		) r
		WHERE r.rn <= 3
		ORDER BY r.[Transactions_Id] DESC

--Query to insert into temp table Ends here

select distinct 
cas.case_id,
UPPER(LTRIM(RTRIM(cas.InjuredParty_FirstName))) AS InjuredParty_FirstName,
UPPER(LTRIM(RTRIM(cas.InjuredParty_LastName))) AS InjuredParty_LastName,
LTRIM(RTRIM(LEFT(ins.InsuranceCompany_Name,15))) AS InsuranceCompany_Name,
CONVERT(VARCHAR(10),CONVERT(DATETIME,cod.DOS), 120) [DOS],
pf.Description [Project_Code],
pro.Provider_Name As Medical_Provider,
cod.Specialty[Specialty],
Tre.Bill_number[Bill_number],
Tre.account_number As Patient_no_Medic,
Convert(varchar(10), cas.Accident_Date, 120) Accident_Date,
(select top 1 Doctor_Name from tblOperatingDoctor o (NOLOCK) left outer join tblTreatment t (NOLOCK) on t.Doctor_Id=o.Doctor_Id where t.Case_Id=cas.Case_Id)[DOCTOR_NAME],
cas.injuredparty_lastname,
cod.code,
cod.amount,
cod.MOD,
cod.UNITS,
cod.ICD10_1,
cod.ICD10_2,
cod.ICD10_3,
--Convert(varchar(10), tre.Date_BillSent, 120) AS billing_date,
'' AS billing_date,
cod.Specialty[bill_type],
(isnull(cast(cod.Amount as float),0))[total_billed_amt],
cod.Bill_Adjustment,
convert(varchar(10), cod.Purchase_Freeze_Date, 120) as Accounting_Date,
(SELECT VPay FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=1) as TT_Vol_1,
(SELECT convert(varchar(10), VDate,120) FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=1) as TD_Vol_1,
(SELECT convert(varchar(10), VCheckDate,120) FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=1) as TD_Vol_Check_1,
(SELECT VCheckNo FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=1) as No_Vol_Check_1,
(SELECT VNetPay FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=1) as Net_Voluntary_1,
(SELECT VDedct FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=1) as Deductible_1,
(SELECT VIntr FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=1) as Interest_1,
(SELECT VAttorneyF FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=1) as Attorney_Fee_1,
(SELECT convert(varchar(10), VDate,120) FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=1) as TD_Vol_Trans_1,
(SELECT VPay FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=1) as Vol_No_1,
(SELECT Transaction_Description FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=1) as Vol_Note_1,
(SELECT  convert(varchar(10), VAL_PAY_Freeze_Date,120) FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=1) as Vol_FreezeDate_1,

(SELECT VPay FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=2) as TT_Vol_2,
(SELECT convert(varchar(10), VDate,120) FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=2) as TD_Vol_2,
(SELECT convert(varchar(10), VCheckDate,120) FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=2) as TD_Vol_Check_2,
(SELECT VCheckNo FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=2) as No_Vol_Check_2,
(SELECT VNetPay FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=2) as Net_Voluntary_2,
(SELECT VDedct FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=2) as Deductible_2,
(SELECT VIntr FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=2) as Interest_2,
(SELECT VAttorneyF FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=2) as Attorney_Fee_2,
(SELECT convert(varchar(10), VDate,120) FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=2) as TD_Vol_Trans_2,
(SELECT VPay FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=2) as Vol_No_2,
(SELECT Transaction_Description FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=2) as Vol_Note_2,
(SELECT  convert(varchar(10), VAL_PAY_Freeze_Date,120) FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=2) as Vol_FreezeDate_2,


(SELECT VPay FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=3) as TT_Vol_3,
(SELECT convert(varchar(10), VDate,120) FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=3) as TD_Vol_3,
(SELECT convert(varchar(10), VCheckDate,120) FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=3) as TD_Vol_Check_3,
(SELECT VCheckNo FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=3) as No_Vol_Check_3,
(SELECT VDedct FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=3) as Deductible_3,
(SELECT VNetPay FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=3) as Net_Voluntary_3,
(SELECT VIntr FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=2) as Interest_3,
(SELECT VAttorneyF FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=1) as Attorney_Fee_3,
(SELECT convert(varchar(10), VDate,120) FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=3) as TD_Vol_Trans_3,
(SELECT VPay FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=3) as Vol_No_3,
(SELECT Transaction_Description FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=3) as Vol_Note_3,
(SELECT  convert(varchar(10), VAL_PAY_Freeze_Date,120) FROM #TempVol tep (NOLOCK) WHERE tep.VCaseId=cas.Case_Id AND RowNum=3) as Vol_FreezeDate_3,

	VDedct AS Deductible,
	VIntr  as Interest,

	(SELECT VTotCol1 FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=1) as Total_Litigation_Collection_1,
	(SELECT VCortFee1 FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=1) as Court_Fees_1,
	(SELECT VLitFee1 FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=1) as Litigation_Fees_1,
	(SELECT VNetLitCol1 FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=1) as Net_Litigation_Collection_1,
	(SELECT convert(varchar(10), VLitPayDt1,120) FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=1) as Lit_Pay_Date_1,
	(SELECT VLitPayNo1 FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=1) as Lit_Payment_no_1,
	(SELECT convert(varchar(10), VLitChkDt1,120) FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=1) as Lit_Cheque_Date_1,
    (SELECT Transaction_Description FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=1) as Lit_Note_1,
	(SELECT convert(varchar(10), LIT_PAY_Freeze_Date,120) FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=1) as Lit_FreezeDate_1,

	(SELECT VTotCol1 FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=2) as Total_Litigation_Collection_2,
	(SELECT VCortFee1 FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=2) as Court_Fees_2,
	(SELECT VLitFee1 FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=2) as Litigation_Fees_2,
	(SELECT VNetLitCol1 FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=2) as Net_Litigation_Collection_2,
	(SELECT convert(varchar(10), VLitPayDt1,120) FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=2) as Lit_Pay_Date_2,
	(SELECT VLitPayNo1 FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=2) as Lit_Payment_no_2,
	(SELECT convert(varchar(10), VLitChkDt1,120) FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=2) as Lit_Cheque_Date_2,
	(SELECT Transaction_Description FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=2) as Lit_Note_2,
	(SELECT convert(varchar(10), LIT_PAY_Freeze_Date,120) FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=1) as Lit_FreezeDate_2,

	(SELECT VTotCol1 FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=3) as Total_Litigation_Collection_3,
	(SELECT VCortFee1 FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=3) as Court_Fees_3,
	(SELECT VLitFee1 FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=3) as Litigation_Fees_3,
	(SELECT VNetLitCol1 FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=3) as Net_Litigation_Collection_3,
	(SELECT convert(varchar(10), VLitPayDt1,120) FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=3) as Lit_Pay_Date_3,
	(SELECT VLitPayNo1 FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=3) as Lit_Payment_no_3,
	(SELECT convert(varchar(10), VLitChkDt1,120) FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=3) as Lit_Cheque_Date_3,
	(SELECT Transaction_Description FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=3) as Lit_Note_3,
	(SELECT convert(varchar(10), LIT_PAY_Freeze_Date,120) FROM #TempLit tepLit (NOLOCK) WHERE tepLit.VCaseId=cas.Case_Id AND RowNum=3) as Lit_FreezeDate_3,

	 cod.Code as CPT,
	 cpt.Transaction_Id as Voluntary_Pay_Id,
	CAST(isnull(Cod.Amount,0) AS FLOAT)- CAST(ISNULL(cod.Bill_Adjustment,0) AS FLOAT) - CAST(ISNULL(VPay,0) AS FLOAT) - CAST(ISNULL(VDedct,0) AS FLOAT) + CAST(ISNULL(VIntr,0) AS FLOAT) AS Purchase_Balance,		
	((CAST(isnull(cod.Amount,0)AS FLOAT)- CAST(ISNULL(cod.Bill_Adjustment,0) AS FLOAT) - CAST(ISNULL(VPay,0) AS FLOAT) - CAST(ISNULL(VDedct,0) AS FLOAT) + CAST(ISNULL(VIntr,0) AS FLOAT))
		  *(CASE WHEN CAST(ISNULL(Advance_Rate,0)AS FLOAT) > 0 then CAST(ISNULL(Advance_Rate,0)AS FLOAT) ELSE 1 END))
		/ 100
		 AS Purchase_Price,
	convert(varchar(10), Tre.Date_BillSent,120) AS Purchase_Date,
	cas.Policy_Number,
	cas.Memo[Note],
	First_Party_Case_Status,
	convert(varchar(10), casDt.CASE_EVALUATION_DATE,120) AS CASE_EVALUATION_DATE,	
	convert(varchar, First_Party_Suit_Filed_Date,101)[First_Party_Suit_Filed_Date],
	crt.Court_Name as court_type,
	crt.Court_Venue as court_county,
	(iif(Attorney_FirstName is null,'', Attorney_FirstName) +' ' + iif(Attorney_LastName is null, '', Attorney_LastName)) as First_Party_Attorney,
	First_Party_LawFirm,
	Attorney_frmBiller_Note,
	Our_Attorney,
	Our_Attorney_Law_Firm,
	Law_Suit_Type,
	convert(varchar(10), cod.Purchase_Freeze_Date,120)[InvDate]

from tblcase cas (NOLOCK)
INNER JOIN tblInsuranceCompany ins (NOLOCK) ON cas.InsuranceCompany_Id = ins.InsuranceCompany_Id
LEFT OUTER JOIN tbl_Voluntary_Payment v_pay (NOLOCK) on v_pay.Case_Id=cas.Case_Id
left join tbl_cpt_payment_details cpt (NOLOCK) on  cpt.Transaction_Id = v_pay.Voluntary_Pay_Id 
left join tbltreatment Tre (NOLOCK) on cas.case_id=Tre.case_id 
left join BILLS_WITH_PROCEDURE_CODES cod (NOLOCK) on cod.CPT_ATUO_ID = cpt.CPT_ATUO_ID
--((ISNULL(cod.BillNumber,'') = ISNULL(Tre.BILL_NUMBER,'') AND ISNULL(Tre.BILL_NUMBER,'') <> '') OR Treatment_id = ISNULL(fk_Treatment_Id,0))
left outer join tblCase_additional_info d (NOLOCK) on d.case_id=cas.Case_Id
LEFT OUTER JOIN tblCase_Date_Details casDt (NOLOCK) ON cas.Case_Id=casDt.Case_Id
left join tblCourt crt (NOLOCK) on crt.Court_Id=cas.Court_Id
left join tblAttorney_Case_Assignment cass (NOLOCK) on cass.Case_Id = cas.Case_Id
left join tblAttorney_Master am (NOLOCK) on cass.Attorney_Id = am.Attorney_Id
LEFT OUTER JOIN tbl_Portfolio pf (NOLOCK) on pf.Id = cas.PortfolioId
LEFT OUTER JOIN tbl_Program tbPr (NOLOCK) ON pf.ProgramId = tbPr.Id
left join tblProvider pro (NOLOCK) on pro.Provider_Id=cas.Provider_Id
LEFT OUTER JOIN #TempVol Tem  ON cas.Case_Id=Tem.VCaseId

WHERE cas.DomainId=@s_a_DomainId 
		AND (@s_a_status = '' OR cas.Status = @s_a_status)
		--	AND ((@dt_a_FromDate='' AND @dt_a_ToDate='') OR (Tre.Date_BillSent BETWEEN CONVERT(datetime,@dt_a_FromDate) AND CONVERT(datetime,@dt_a_ToDate) + 1 ))		
		--  AND ((@dt_a_invFromDate='' AND @dt_a_invToDate='') OR (cas.inv_date BETWEEN CONVERT(datetime,@dt_a_invFromDate) AND CONVERT(datetime,@dt_a_invToDate) + 1 ))		
		AND (
			(@dt_a_invFromDate='' AND @dt_a_invToDate='')
			OR
			(@dt_a_invFromDate<>'' AND @dt_a_invToDate<>'' AND cod.Purchase_Freeze_Date BETWEEN CONVERT(datetime,@dt_a_invFromDate) AND CONVERT(datetime,@dt_a_invToDate))
		)	
		AND (((@i_a_PortfolioId = 0  OR cas.PortfolioId = @i_a_PortfolioId) and @s_a_UserType <> 'I') OR
		      (@i_a_PortfolioId = 0 or cas.PortfolioId = @i_a_PortfolioId) and cas.PortfolioId in (Select PortfolioId from tbl_InvestorPortfolio(NOLOCK) where InvestorId in (select InvestorId from tbl_Investor(NOLOCK) where userid = @i_a_UserId))  and @s_a_UserType = 'I' )
		AND Convert(decimal(18,2), iif(cas.Claim_Amount is null or ltrim(rtrim(cas.Claim_Amount)) ='', '0', cas.Claim_Amount)) > Convert(decimal(18,2),0)
		--AND isnull(cas.Claim_Amount,0) > 0
		
		OPTION	(RECOMPILE)

		DROP TABLE #TempVol

        DROP TABLE #TempLit

END



GO
