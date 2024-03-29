USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[GETPROVIDER_NOTESCASES]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GETPROVIDER_NOTESCASES]  --[GETPROVIDER_NOTESCASES] '40499',0,'yingyangharm'
	@PROVIDER_ID INT=NULL,
	@BIT_NOTES_CASES INT,
	@UserName varchar(100)
AS
BEGIN
	IF @BIT_NOTES_CASES = 0
	BEGIN
		DECLARE @strsql as varchar(8000)
		set @strsql='select distinct TBLCASE.CASE_ID,
		(select top 1 isnull(account_number,'''') from tbltreatment where Case_Id=tblcase.Case_ID) as account_number,
		Convert(varchar,settlement_date,101) as  settlement_date,
		(select MAX(convert(varchar,Event_Date,101)) from tblEvent E
		inner join tblEventType T on E.EventTypeId = T.EventTypeId
		inner join tblEventStatus S on E.EventStatusId = S.EventStatusId
		WHERE EventStatusName in(''AAA HEARING SET'',''MOTION'') and Case_id =tblcase.Case_Id) AS [HEARING_SET/MOTION],
		(select convert(decimal(38,2),isnull(sum(transactions_amount),0)) from tbltransactions where Transactions_type=''C'' and Case_Id=tblcase.Case_ID) as Principal_Received,
		(select convert(decimal(38,2),isnull(sum(transactions_amount),0)) from tbltransactions where Transactions_type=''I'' and Case_Id=tblcase.Case_ID) as Interest_Received,
		ISNULL(DBO.TBLCASE.INJUREDPARTY_FIRSTNAME, N'''') + N''  '' + ISNULL(DBO.TBLCASE.INJUREDPARTY_LASTNAME, N'''') AS INJUREDPARTY_NAME,
			TBLPROVIDER.Provider_Name,
			INSURANCECOMPANY_NAME,
			POLICY_NUMBER,
			INS_CLAIM_NUMBER,
			ISNULL(convert(varchar, tblCase.DateOfService_Start,101),'''') as DateOfService_Start,
			ISNULL(convert(varchar, tblCase.DateOfService_End,101),'''') as DateOfService_End,
			
			convert(nvarchar(12),tblcase.Accident_Date,101) as Accident_Date,
			convert(decimal(38,2),isnull(tblcase.CLAIM_AMOUNT,0)) as CLAIM_AMOUNT,
			CONVERT(FLOAT, ISNULL(DBO.TBLCASE.CLAIM_AMOUNT,0)) - CONVERT(FLOAT,ISNULL(DBO.TBLCASE.PAID_AMOUNT,0)) AS BALANCE_AMOUNT,
			tblcase.Status,convert (varchar(10),date_opened,101) as date_opened ,
			--[dbo].[fncGetAccountNumber](tblcase.Case_Id) as account_number,
			
			DATEDIFF(DD,DATE_STATUS_CHANGED,GETDATE()) AS STATUSAGE,
			[dbo].[fncGetNotesDesc](TBLCASE.CASE_ID) AS NOTESDESCDATE,
			tblcase.Fee_Schedule as Fee_Schedule,
			convert(decimal(38,2),ISNULL(TBLSETTLEMENTS.SETTLEMENT_AMOUNT,0.00)) AS SETTLEMENT_AMOUNT
		FROM
			TBLCASE INNER JOIN TBLPROVIDER ON TBLCASE.PROVIDER_ID = TBLPROVIDER.Provider_Id 
			INNER JOIN TBLINSURANCECOMPANY ON TBLCASE.INSURANCECOMPANY_ID = TBLINSURANCECOMPANY.INSURANCECOMPANY_ID
			--INNER JOIN tbltreatment ON TBLCASE.case_id = tbltreatment.case_id
			--left outer join tblTransactions trans on tblcase.Case_Id=trans.Case_Id
			left outer join tblsettlements on tblcase.Case_Id=tblsettlements.Case_Id
			 --left outer join tblEvent on tblcase.Case_Id=tblEvent.Case_id
		WHERE TBLPROVIDER.PROVIDER_ID in(select provider_id from TXN_PROVIDER_LOGIN where user_id in
		(select userid from issuetracker_users where username='''+ @UserName +''')) 
		--group by TBLCASE.CASE_ID,TBLPROVIDER.Provider_Name,INJUREDPARTY_FIRSTNAME,INJUREDPARTY_LASTNAME,InsuranceCompany_Name,
		--Accident_Date,Policy_Number,Ins_Claim_Number,TBLCASE.Claim_Amount,TBLCASE.Paid_Amount,TBLCASE.Status,TBLCASE.Date_Opened,DATE_STATUS_CHANGED,
		--account_number,settlement_date,transactions_amount,tblcase.DateOfService_Start,tblcase.DateOfService_End,
		--tblcase.Fee_Schedule
		ORDER BY Provider_Name,Case_Id'
			print(@strsql)
		exec (@strsql)
	END
	ELSE IF @BIT_NOTES_CASES = 1
	BEGIN
		SELECT TBLCASE.CASE_ID,
			NOTES_DESC,
			CONVERT(NVARCHAR(12),NOTES_DATE,101) AS NOTES_DATE
		FROM
			TBLCASE INNER JOIN TBLNOTES ON TBLCASE.CASE_ID = TBLNOTES.CASE_ID
		WHERE TBLCASE.PROVIDER_ID = @PROVIDER_ID
		AND NOTES_TYPE='PROVIDER'
	END
END
GO
