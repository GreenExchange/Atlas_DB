USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Report_Payment]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Report_Payment]
	
	@s_a_Transactions_Date_From	VARCHAR(20)=''	,
	@s_a_Transactions_Date_To	VARCHAR(20)='',
	@s_a_InjuredName	VARCHAR(100)	=	'',
	@s_a_Transactions_Type VARCHAR(10) ='0',
	@s_a_ProviderName varchar(100)='0',
	@s_a_ProviderGroup varchar(100)='',
	@s_a_InitialStatus varchar(100)='',
	@s_a_CheckNo varchar(100)='',
	@s_a_BatchNo varchar(100)='',
	@s_a_Report_Type varchar(100)=''

AS
BEGIN
		
	
	 SELECT distinct
			trans.Transactions_Id, 
			max(trans.Case_Id) AS Case_Id,
			max(tre.BILL_NUMBER) AS BILL_NUMBER,
			CONVERT(VARCHAR(10),max(tre.DateOfService_Start),101) AS DateOfService_Start,
			CONVERT(VARCHAR(10),max(tre.DateOfService_End),101) AS DateOfService_End,
			max(pro.Provider_Name) AS Provider_Name,
			max(cas.InjuredParty_LastName + ', ' + cas.InjuredParty_FirstName) as InjuredParty_Name,
			max(ins.InsuranceCompany_Name) AS InsuranceCompany_Name, 
			max(pro.Provider_Local_Address) AS Provider_Local_Address,
			trans.ChequeNo,
			trans.CheckDate,
			convert(decimal(38,2),trans.Transactions_Amount) AS Transactions_Amount,
			CONVERT(VARCHAR(10),max(tre.Date_BillSent), 101) AS BillDate_submitted,   -- POMGenerated
			CONVERT(VARCHAR(10), trans.Transactions_Date, 101) AS Payment_date,
			trans.Transactions_Type,
			transtype.Report_Type,
			max(tre.SERVICE_TYPE) AS SERVICE_TYPE,
			trans.BatchNo,
			trans.Transactions_Description,
			trans.User_Id,
			--Provider_Name + ISNULL(' [ ' + pro.Provider_Groupname + ' ]','') as Provider_Name,  
			convert(decimal(38,2),(convert(money,convert(float,max(cas.Claim_Amount))))) as Claim_Amount,
			convert(decimal(38,2),(convert(money,convert(float,max(cas.Paid_Amount))))) as Paid_Amount,
			convert(decimal(38,2),(convert(money,convert(float,max(cas.Claim_Amount)) - convert(float,max(cas.Paid_Amount))))) as Claim_Balance,
			convert(decimal(38,2),(convert(money,convert(float,max(cas.Fee_Schedule))))) as Fee_Schedule,
			convert(decimal(38,2),(convert(money,convert(float,max(cas.Fee_Schedule)) - convert(float,max(cas.Paid_Amount))))) as FS_Balance,
			max(cas.Initial_Status) AS Initial_Status,
			max(pro.Provider_GroupName) AS Provider_GroupName,
			max(doc.DOCTOR_NAME) AS DOCTOR_NAME, 
			convert(decimal(38,2),(select sum(Transactions_Amount) from tblTransactions where case_id = cas.Case_Id and Transactions_Type IN ('C','PreC','ProCToP'))) AS Paid_Principal ,
			convert(decimal(38,2),(convert(money,convert(float,max(cas.Claim_Amount)) - convert(float,(select sum(Transactions_Amount) from tblTransactions where case_id = cas.Case_Id and Transactions_Type IN ('C','PreC','ProCToP')))))) as Calim_Pricipal_Balance
		FROM  dbo.tblCase cas
		INNER JOIN dbo.tblprovider pro on cas.provider_id=pro.provider_id 
		INNER JOIN dbo.tblinsurancecompany ins on cas.insurancecompany_id=ins.insurancecompany_id
		LEFT OUTER JOIN dbo.tblTreatment tre on tre.Case_Id= cas.Case_Id
		INNER JOIN tblTransactions trans on cas.case_id = trans.Case_Id
		LEFT JOIN tblOperatingDoctor doc on  doc.Doctor_Id =tre.Doctor_Id 
	    INNER JOIN tblTransactionType transtype on trans.Transactions_Type=transtype.payment_value

		WHERE	
			 (@s_a_Transactions_Date_From='' OR (trans.Transactions_Date Between CONVERT(datetime,@s_a_Transactions_Date_From) And CONVERT(datetime,@s_a_Transactions_Date_To)+1))		
			AND (@s_a_InjuredName ='' OR ISNULL(cas.InjuredParty_FirstName,'')+ISNULL(cas.InjuredParty_LastName,'') like '%'+ @s_a_InjuredName + '%'  OR  ISNULL(cas.InjuredParty_LastName,'') + ISNULL(cas.InjuredParty_FirstName,'') like '%'+ @s_a_InjuredName + '%'  OR ISNULL(cas.InjuredParty_LastName,'') like '%'+ @s_a_InjuredName + '%'  OR ISNULL(cas.InjuredParty_FirstName,'') like '%'+ @s_a_InjuredName + '%')
			AND (@s_a_ProviderName = '0' OR cas.Provider_Id = @s_a_ProviderName)
			AND (@s_a_ProviderGroup = '' OR Provider_GroupName = @s_a_ProviderGroup)
			AND (@s_a_InitialStatus= '' OR Initial_Status = @s_a_InitialStatus)
			AND (@s_a_CheckNo ='' OR trans.ChequeNo like '%'+ @s_a_CheckNo + '%')
			AND (@s_a_BatchNo ='' OR trans.BatchNo like '%'+ @s_a_BatchNo + '%')
			AND (@s_a_Transactions_Type = '0' OR trans.Transactions_Type = @s_a_Transactions_Type)
			AND (@s_a_Report_Type='' OR transtype.Report_Type=@s_a_Report_Type)
		Group by 
			trans.Transactions_Id
			, trans.ChequeNo
			, trans.CheckDate
			, trans.Transactions_Amount
			, trans.Transactions_Date
			, trans.Transactions_Type
			, trans.BatchNo
			, trans.Transactions_Description
			, trans.User_Id
			, cas.Case_Id
			, transtype.Report_Type
END



GO
