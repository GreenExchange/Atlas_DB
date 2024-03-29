USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[GETPROVIDER_NOTESCASES]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GETPROVIDER_NOTESCASES]  --[GETPROVIDER_NOTESCASES] '40499',0,'yingyangharm'
	@DomainId nvarchar(50),
	@PROVIDER_ID INT=NULL,
	@BIT_NOTES_CASES INT,
	@UserName varchar(100)
AS
BEGIN
	IF @BIT_NOTES_CASES = 0
	BEGIN
		select distinct TBLCASE.CASE_ID,
			(select top 1 isnull(account_number,'') from tbltreatment where Case_Id=tblcase.Case_ID) as account_number,
			Convert(varchar,settlement_date,101) as  settlement_date,
			(select MAX(convert(varchar,Event_Date,101)) from tblEvent E (NOLOCK)
			inner join tblEventType T (NOLOCK) on E.EventTypeId = T.EventTypeId
			inner join tblEventStatus S (NOLOCK) on E.EventStatusId = S.EventStatusId
			WHERE EventStatusName in('AAA HEARING SET','MOTION') and Case_id =tblcase.Case_Id) AS [HEARING_SET/MOTION],
			(select convert(decimal(38,2),isnull(sum(transactions_amount),0)) from tbltransactions (NOLOCK) where Transactions_type IN ('PriC','C') and Case_Id=tblcase.Case_ID and DomainId= tblcase.DomainId ) as Principal_Received,
			(select convert(decimal(38,2),isnull(sum(transactions_amount),0)) from tbltransactions (NOLOCK) where Transactions_type='I' and Case_Id=tblcase.Case_ID and DomainId= tblcase.DomainId ) as Interest_Received,
			ISNULL(DBO.TBLCASE.INJUREDPARTY_FIRSTNAME, N'') + N'  ' + ISNULL(DBO.TBLCASE.INJUREDPARTY_LASTNAME, N'') AS INJUREDPARTY_NAME,
			TBLPROVIDER.Provider_Name,
			INSURANCECOMPANY_NAME,
			POLICY_NUMBER,
			INS_CLAIM_NUMBER,
			ISNULL(convert(varchar, tblCase.DateOfService_Start,101),'') as DateOfService_Start,
			ISNULL(convert(varchar, tblCase.DateOfService_End,101),'') as DateOfService_End,			
			convert(nvarchar(12),tblcase.Accident_Date,101) as Accident_Date,
			convert(decimal(38,2),isnull(tblcase.CLAIM_AMOUNT,0)) as CLAIM_AMOUNT,
			CONVERT(FLOAT, ISNULL(DBO.TBLCASE.CLAIM_AMOUNT,0)) - CONVERT(FLOAT,ISNULL(DBO.TBLCASE.PAID_AMOUNT,0)) AS BALANCE_AMOUNT,
			tblcase.Status,
			tblcase.initial_status,
			convert (varchar(10),date_opened,101) as date_opened ,
			DATEDIFF(DD,DATE_STATUS_CHANGED,GETDATE()) AS STATUSAGE,
			[dbo].[fncGetNotesDesc](TBLCASE.CASE_ID) AS NOTESDESCDATE,
			tblcase.Fee_Schedule as Fee_Schedule,
			convert(decimal(38,2),ISNULL(TBLSETTLEMENTS.SETTLEMENT_AMOUNT,0.00)) AS SETTLEMENT_AMOUNT
		FROM
			TBLCASE (NOLOCK)
		INNER JOIN TBLPROVIDER (NOLOCK) AS TBLPROVIDER ON TBLCASE.PROVIDER_ID = TBLPROVIDER.Provider_Id and TBLCASE.DomainId=TBLPROVIDER.DomainId
		INNER JOIN TBLINSURANCECOMPANY (NOLOCK) as TBLINSURANCECOMPANY ON TBLCASE.INSURANCECOMPANY_ID = TBLINSURANCECOMPANY.INSURANCECOMPANY_ID and TBLCASE.DomainId=TBLINSURANCECOMPANY.DomainId
		LEFT OUTER JOIN tblsettlements (NOLOCK) on tblcase.Case_Id=tblsettlements.Case_Id
		WHERE TBLPROVIDER.PROVIDER_ID in(select provider_id from TXN_PROVIDER_LOGIN (NOLOCK) where DomainId=''+ @DomainId + '' and user_id in
		(select userid from IssueTracker_Users  where username= @UserName  and DomainId=@DomainId  )) and tblcase.DomainId= @DomainId
		and status <> 'IN ARB OR LIT'
		ORDER BY Provider_Name,Case_Id
	END
	ELSE IF @BIT_NOTES_CASES = 1
	BEGIN
		SELECT TBLCASE.CASE_ID,
			NOTES_DESC,
			CONVERT(NVARCHAR(12),NOTES_DATE,101) AS NOTES_DATE
		FROM
			tblcase  as tblcase (NOLOCK) 
			INNER JOIN tblNotes  TBLNOTES (NOLOCK)  ON TBLCASE.CASE_ID = TBLNOTES.CASE_ID and tblcase.DomainId = tblNotes.DomainId
		WHERE TBLCASE.PROVIDER_ID = @PROVIDER_ID
		AND tblcase.DomainId=@DomainId
		AND NOTES_TYPE='PROVIDER'
	END
END

GO
