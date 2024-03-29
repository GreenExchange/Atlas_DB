USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SERVICE_SEARCH_ALT]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 1/28/09
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SERVICE_SEARCH_ALT] 
@CASE_ID VARCHAR(50) =NULL,@FILENUMBER VARCHAR(50)=NULL,@PATIENT VARCHAR(100)=NULL,@INSURED VARCHAR(100)=NULL,@PROVIDER VARCHAR(200)=NULL,
@FACILITY VARCHAR(100)=NULL ,@INSURANCE VARCHAR(200)=NULL,@POLICY VARCHAR(50)=NULL,@CLAIM VARCHAR(50)=NULL,@DOA VARCHAR(50)=NULL,
@RESULT VARCHAR(10)	,@DOS VARCHAR(20)=NULL,@DATE_SENT VARCHAR(20)=NULL, @PHYSICIAN VARCHAR(100)=NULL,@STATUS VARCHAR(50)=NULL,@COMPLETE VARCHAR(4)=NULL,
@LITIGATED VARCHAR(4)=NULL,@AGING INT , @AGING_TYPE varchar(20),@REFERENCE VARCHAR(20)=NULL,@TYPE VARCHAR(50)=NULL,@BATCH VARCHAR(20)=NULL
	
AS
BEGIN
DECLARE @QUERY_STRING NVARCHAR(MAX),@FILTER_STRING NVARCHAR(MAX),@GROUP_BY_STRING NVARCHAR(MAX)
	
	SET NOCOUNT ON;

IF @COMPLETE = '-1' SET @COMPLETE='1'
IF @LITIGATED = '-1' SET @LITIGATED = '1'

SET @PROVIDER= REPLACE(REPLACE(@PROVIDER,'[','{'),']','}')


SET @FILTER_STRING=' WHERE (BX_CASE.DELETED = 0) AND '
IF @CASE_ID IS NOT NULL AND @CASE_ID <> 'NULL' SET @FILTER_STRING = @FILTER_STRING + ' (BX_CASE.CASE_ID = ' + @CASE_ID + ') AND '
IF @FILENUMBER IS NOT NULL AND @FILENUMBER <> 'NULL' SET @FILTER_STRING = @FILTER_STRING+' (BX_CASE.PROVIDER_FILENUMBER LIKE ''%' + @FILENUMBER + '%'') AND '
IF @PATIENT IS NOT NULL  AND @PATIENT <> 'NULL' SET @FILTER_STRING=@FILTER_STRING +' ((BX_CASE.PATIENT_LASTNAME + '', '' + BX_CASE.PATIENT_FIRSTNAME) LIKE ''%' + @PATIENT  + '%'') AND '
IF @INSURED IS NOT NULL  AND @INSURED <> 'NULL' SET @FILTER_STRING=@FILTER_STRING + ' ((BX_CASE.INSURED_LASTNAME + '', '' + BX_CASE.INSURED_FIRSTNAME) LIKE ''%' + @INSURED + '%'') AND '
IF @PROVIDER IS NOT NULL  AND @PROVIDER <> 'NULL' SET @FILTER_STRING = @FILTER_STRING + ' (tblProvider.Provider_Name + ISNULL('' { '' + tblProvider.Provider_GroupName + '' } '', '''')  = ''' + @PROVIDER + ''') AND '
IF @FACILITY IS NOT NULL  AND @FACILITY <> 'NULL' SET @FILTER_STRING = @FILTER_STRING + ' (BX_FACILITY.SHORT_NAME = ''' + @FACILITY + ''') AND '
IF @INSURANCE IS NOT NULL  AND @INSURANCE <> 'NULL' SET @FILTER_STRING = @FILTER_STRING + ' (tblInsuranceCompany.InsuranceCompany_Name = ''' + @INSURANCE + ''') AND '
IF @POLICY IS NOT NULL  AND @POLICY <> 'NULL' SET @FILTER_STRING = @FILTER_STRING +  ' (BX_CASE.POLICY_NUMBER LIKE ''%' + @POLICY + '%'') AND '
IF @CLAIM IS NOT NULL  AND @CLAIM <> 'NULL' SET @FILTER_STRING = @FILTER_STRING + ' (BX_CASE.BX_CASE.CLAIM_NUMBER LIKE ''%' + @CLAIM + '%'') AND '
IF @DOA IS NOT NULL AND @DOA <> 'NULL'  SET @FILTER_STRING = @FILTER_STRING + ' (CONVERT(VARCHAR(10),BX_CASE.ACCIDENT_DATE,101) = ''' + @DOA + ''') AND '
IF @TYPE IS NOT NULL  AND @TYPE <> 'NULL' SET @FILTER_STRING = @FILTER_STRING + ' (BX_CASE_TYPE.DESCRIPTION = ''' + @TYPE + ''') AND '
IF @DOS IS NOT NULL AND @DOS <> 'NULL'  SET @FILTER_STRING = @FILTER_STRING +  ' ((CONVERT(VARCHAR(20), BX_SERVICES.DOS_START, 101) LIKE ''%' + @DOS  + '%'') OR (CONVERT(VARCHAR(20), BX_SERVICES.DOS_END, 101) LIKE ''%' + @DOS + '%'')) AND '
IF @DATE_SENT IS NOT NULL  AND @DATE_SENT <> 'NULL' SET @FILTER_STRING = @FILTER_STRING + ' (CONVERT(VARCHAR(10),BX_SERVICES.DATE_SENT,101) = ''' + @DATE_SENT + ''') AND '
IF @PHYSICIAN IS NOT NULL  AND @PHYSICIAN <> 'NULL' SET @FILTER_STRING = @FILTER_STRING + ' (BX_PHYSICIANS.NAME = ''' + @PHYSICIAN + ''') AND '
IF @STATUS IS NOT NULL  AND @STATUS <> 'NULL' SET @FILTER_STRING = @FILTER_STRING + ' (BX_SERVICE_STATUS.NAME = ''' + @STATUS + ''') AND '
IF @COMPLETE IS NOT NULL  AND @COMPLETE <> 'NULL' SET @FILTER_STRING = @FILTER_STRING + ' (BX_SERVICES.COMPLETE = ''' + @COMPLETE + ''') AND '
IF @LITIGATED IS NOT NULL  AND @LITIGATED <> 'NULL' SET @FILTER_STRING = @FILTER_STRING + ' (BX_SERVICES.LITIGATED = ''' + @LITIGATED + ''') AND '
IF @BATCH IS NOT NULL  AND @BATCH <> 'NULL' SET @FILTER_STRING = @FILTER_STRING + ' (BX_SERVICES.BATCH_ID = ''' + @BATCH + ''') AND '
IF @REFERENCE IS NOT NULL  AND @REFERENCE <> 'NULL' SET @FILTER_STRING = @FILTER_STRING+' (BX_SERVICES.REFERENCE LIKE ''%' + @REFERENCE + '%'') AND '



IF @RESULT = 'ALL'
  BEGIN
	IF @AGING_TYPE='Equal to'
		BEGIN
		SET @FILTER_STRING = @FILTER_STRING + ' (CASE WHEN BX_SERVICES.COMPLETE = 0 THEN DATEDIFF(D, dbo.BX_SERVICES.DOS_START, GETDATE())  END = ' + CONVERT(VARCHAR(10),@AGING) +')'

		
SET @QUERY_STRING=	'	SELECT     BX_CASE.CASE_ID, BX_CASE.CASE_ID_LONG, tblProvider.Provider_Name + ISNULL('' [ '' + tblProvider.Provider_GroupName + '' ]'', '''') 
                      AS Provider_name, BX_CASE.PATIENT_LASTNAME + '', '' + BX_CASE.PATIENT_FIRSTNAME AS PATIENT, 
                      tblInsuranceCompany.InsuranceCompany_Name, BX_SERVICES.ID, BX_SERVICES.AMOUNT, CONVERT(VARCHAR(20), BX_SERVICES.DOS_START, 1) 
                      + '' - '' + CONVERT(VARCHAR(20), BX_SERVICES.DOS_END, 1) AS DOS, BX_SERVICES.LITIGATED, BX_SERVICES.COMPLETE, 
                      CASE WHEN BX_SERVICES.COMPLETE = 0 THEN ISNULL(DATEDIFF(D, dbo.BX_SERVICES.DOS_START, GETDATE()), 0) ELSE ''0'' END AS AGING, 
                      BX_PHYSICIANS.NAME, BX_SERVICE_STATUS.NAME AS STATUS_NAME, BX_SERVICES.REFERENCE, BX_SERVICES.DATE_SENT, 
                      BX_CASE.CLAIM_NUMBER, BX_CASE_TYPE.DESCRIPTION AS CASE_TYPE, BX_SERVICES.BATCH_ID,SUM(ISNULL(BX_PAYMENTS.AMOUNT, 0)) AS PAYMENTS , ISNULL(BX_SERVICES.AMOUNT, 0) - SUM(ISNULL(BX_PAYMENTS.AMOUNT, 0)) AS BALANCE
FROM         BX_PAYMENTS RIGHT OUTER JOIN
                      BX_PHYSICIANS INNER JOIN
                      BX_SERVICE_STATUS INNER JOIN
                      BX_SERVICES ON BX_SERVICE_STATUS.ID = BX_SERVICES.STATUS ON BX_PHYSICIANS.ID = BX_SERVICES.RENDERED_BY ON 
                      BX_PAYMENTS.SERVICE_ID = BX_SERVICES.ID RIGHT OUTER JOIN
                      BX_CASE INNER JOIN
                      BX_CASE_TYPE ON BX_CASE.TYPE = BX_CASE_TYPE.ID LEFT OUTER JOIN
                      BX_FACILITY ON BX_CASE.FACILITY = BX_FACILITY.ID LEFT OUTER JOIN
                      tblProvider ON BX_CASE.PROVIDER = tblProvider.Provider_Id ON BX_SERVICES.CASE_ID = BX_CASE.CASE_ID LEFT OUTER JOIN
                      tblInsuranceCompany ON BX_CASE.INSURANCE = tblInsuranceCompany.InsuranceCompany_Id    
                      '
			
SET @GROUP_BY_STRING = ' GROUP BY BX_CASE.CASE_ID, BX_CASE.CASE_ID_LONG, tblProvider.Provider_Name +Isnull('' [ ''+Provider_GroupName + '' ]'',''''), BX_CASE.PATIENT_LASTNAME + '', '' +  BX_CASE.PATIENT_FIRSTNAME, 
                      tblInsuranceCompany.InsuranceCompany_Name, BX_SERVICES.ID, CONVERT(VARCHAR(20), BX_SERVICES.DOS_START, 1) + '' - '' + CONVERT(VARCHAR(20), 
                      BX_SERVICES.DOS_END, 1), 
                      BX_SERVICES.AMOUNT, BX_SERVICES.LITIGATED, BX_SERVICES.COMPLETE, BX_SERVICES.DATE_SENT, BX_PHYSICIANS.NAME,BX_SERVICES.DOS_END,BX_SERVICES.DOS_START,BX_SERVICES.STATUS,
					  BX_SERVICE_STATUS.NAME,BX_SERVICES.REFERENCE,BX_CASE.CLAIM_NUMBER, BX_CASE_TYPE.DESCRIPTION,Provider_GroupName, BX_SERVICES.BATCH_ID
					   

				ORDER BY BX_CASE.CASE_ID DESC
'

SET @QUERY_STRING = @QUERY_STRING + @FILTER_STRING + @GROUP_BY_STRING

EXEC SP_EXECUTESQL @QUERY_STRING


	GOTO FINISH
	END
	
	
IF @AGING_TYPE='More than'
		BEGIN
		SET @FILTER_STRING = @FILTER_STRING + ' (ISNULL((CASE WHEN BX_SERVICES.COMPLETE = 0 THEN DATEDIFF(D, dbo.BX_SERVICES.DOS_START, GETDATE()) ELSE ''0'' END),''0'') >= CONVERT(VARCHAR(5),' + CONVERT(VARCHAR(10),@AGING) +')) '
		SET @REFERENCE ='CDS'
		
SET @QUERY_STRING= '  SELECT     BX_CASE.CASE_ID, BX_CASE.CASE_ID_LONG, tblProvider.Provider_Name +Isnull('' [ ''+Provider_GroupName + '' ]'','''') as Provider_name, 
                      BX_CASE.PATIENT_LASTNAME + '', '' +  BX_CASE.PATIENT_FIRSTNAME AS PATIENT, tblInsuranceCompany.InsuranceCompany_Name, 
                      BX_SERVICES.ID, BX_SERVICES.AMOUNT, CONVERT(VARCHAR(20), BX_SERVICES.DOS_START, 1) + '' - '' + CONVERT(VARCHAR(20), 
                      BX_SERVICES.DOS_END, 1) AS DOS, BX_SERVICES.LITIGATED, BX_SERVICES.COMPLETE, 
                      CASE WHEN BX_SERVICES.COMPLETE = 0 THEN ISNULL(DATEDIFF(D, dbo.BX_SERVICES.DOS_START, GETDATE()), 0) ELSE ''0'' END AS AGING, 
                      BX_PHYSICIANS.NAME, BX_SERVICE_STATUS.NAME AS STATUS_NAME, BX_SERVICES.REFERENCE, BX_SERVICES.DATE_SENT, 
                      BX_CASE.CLAIM_NUMBER, BX_CASE_TYPE.DESCRIPTION AS CASE_TYPE, BX_SERVICES.BATCH_ID,SUM(ISNULL(BX_PAYMENTS.AMOUNT, 0)) AS PAYMENTS , ISNULL(BX_SERVICES.AMOUNT, 0) - SUM(ISNULL(BX_PAYMENTS.AMOUNT, 0)) AS BALANCE
FROM         BX_PAYMENTS RIGHT OUTER JOIN
                      BX_PHYSICIANS INNER JOIN
                      BX_SERVICE_STATUS INNER JOIN
                      BX_SERVICES ON BX_SERVICE_STATUS.ID = BX_SERVICES.STATUS ON BX_PHYSICIANS.ID = BX_SERVICES.RENDERED_BY ON 
                      BX_PAYMENTS.SERVICE_ID = BX_SERVICES.ID RIGHT OUTER JOIN
                      BX_CASE INNER JOIN
                      BX_CASE_TYPE ON BX_CASE.TYPE = BX_CASE_TYPE.ID LEFT OUTER JOIN
                      BX_FACILITY ON BX_CASE.FACILITY = BX_FACILITY.ID LEFT OUTER JOIN
                      tblProvider ON BX_CASE.PROVIDER = tblProvider.Provider_Id ON BX_SERVICES.CASE_ID = BX_CASE.CASE_ID LEFT OUTER JOIN
                      tblInsuranceCompany ON BX_CASE.INSURANCE = tblInsuranceCompany.InsuranceCompany_Id
  '



			
	SET @GROUP_BY_STRING=' GROUP BY BX_CASE.CASE_ID, BX_CASE.CASE_ID_LONG, tblProvider.Provider_Name +Isnull('' [ ''+Provider_GroupName + '' ]'',''''), BX_CASE.PATIENT_LASTNAME + '', '' +  BX_CASE.PATIENT_FIRSTNAME, 
                      tblInsuranceCompany.InsuranceCompany_Name, BX_SERVICES.ID, CONVERT(VARCHAR(20), BX_SERVICES.DOS_START, 1) + '' - '' + CONVERT(VARCHAR(20), 
                      BX_SERVICES.DOS_END, 1), 
                      BX_SERVICES.AMOUNT, BX_SERVICES.LITIGATED, BX_SERVICES.COMPLETE, BX_SERVICES.DATE_SENT, BX_PHYSICIANS.NAME,BX_SERVICES.DOS_END,BX_SERVICES.DOS_START,BX_SERVICES.STATUS,
					  BX_SERVICE_STATUS.NAME,BX_SERVICES.REFERENCE,BX_CASE.CLAIM_NUMBER, BX_CASE_TYPE.DESCRIPTION,Provider_GroupName, BX_SERVICES.BATCH_ID
					   
				ORDER BY BX_CASE.CASE_ID DESC
'
SET @QUERY_STRING = @QUERY_STRING + @FILTER_STRING + @GROUP_BY_STRING

EXEC SP_EXECUTESQL @QUERY_STRING


	GOTO FINISH
	END


IF @AGING_TYPE='Less than'
		BEGIN
		
SET @FILTER_STRING = @FILTER_STRING + 'ISNULL((CASE WHEN BX_SERVICES.COMPLETE = 0 THEN DATEDIFF(D, dbo.BX_SERVICES.DOS_START, GETDATE()) ELSE ''0'' END),''0'') <= CONVERT(VARCHAR(5),' + CONVERT(VARCHAR(10),@AGING) +')'

		
		
SET @QUERY_STRING= '  SELECT     BX_CASE.CASE_ID, BX_CASE.CASE_ID_LONG, tblProvider.Provider_Name +Isnull('' [ ''+Provider_GroupName + '' ]'','''') as Provider_name, 
                      BX_CASE.PATIENT_LASTNAME + '', '' +  BX_CASE.PATIENT_FIRSTNAME AS PATIENT, tblInsuranceCompany.InsuranceCompany_Name, 
                      BX_SERVICES.ID, BX_SERVICES.AMOUNT, CONVERT(VARCHAR(20), BX_SERVICES.DOS_START, 1) + '' - '' + CONVERT(VARCHAR(20), 
                      BX_SERVICES.DOS_END, 1) AS DOS, BX_SERVICES.LITIGATED, BX_SERVICES.COMPLETE, 
                      CASE WHEN BX_SERVICES.COMPLETE = 0 THEN ISNULL(DATEDIFF(D, dbo.BX_SERVICES.DOS_START, GETDATE()), 0) ELSE ''0'' END AS AGING, 
                      BX_PHYSICIANS.NAME, BX_SERVICE_STATUS.NAME AS STATUS_NAME, BX_SERVICES.REFERENCE, BX_SERVICES.DATE_SENT, 
                      BX_CASE.CLAIM_NUMBER, BX_CASE_TYPE.DESCRIPTION AS CASE_TYPE, BX_SERVICES.BATCH_ID,SUM(ISNULL(BX_PAYMENTS.AMOUNT, 0)) AS PAYMENTS , ISNULL(BX_SERVICES.AMOUNT, 0) - SUM(ISNULL(BX_PAYMENTS.AMOUNT, 0)) AS BALANCE
FROM         BX_PAYMENTS RIGHT OUTER JOIN
                      BX_PHYSICIANS INNER JOIN
                      BX_SERVICE_STATUS INNER JOIN
                      BX_SERVICES ON BX_SERVICE_STATUS.ID = BX_SERVICES.STATUS ON BX_PHYSICIANS.ID = BX_SERVICES.RENDERED_BY ON 
                      BX_PAYMENTS.SERVICE_ID = BX_SERVICES.ID RIGHT OUTER JOIN
                      BX_CASE INNER JOIN
                      BX_CASE_TYPE ON BX_CASE.TYPE = BX_CASE_TYPE.ID LEFT OUTER JOIN
                      BX_FACILITY ON BX_CASE.FACILITY = BX_FACILITY.ID LEFT OUTER JOIN
                      tblProvider ON BX_CASE.PROVIDER = tblProvider.Provider_Id ON BX_SERVICES.CASE_ID = BX_CASE.CASE_ID LEFT OUTER JOIN
                      tblInsuranceCompany ON BX_CASE.INSURANCE = tblInsuranceCompany.InsuranceCompany_Id
  '



			
	SET @GROUP_BY_STRING=' GROUP BY BX_CASE.CASE_ID, BX_CASE.CASE_ID_LONG, tblProvider.Provider_Name +Isnull('' [ ''+Provider_GroupName + '' ]'',''''), BX_CASE.PATIENT_LASTNAME + '', '' +  BX_CASE.PATIENT_FIRSTNAME, 
                      tblInsuranceCompany.InsuranceCompany_Name, BX_SERVICES.ID, CONVERT(VARCHAR(20), BX_SERVICES.DOS_START, 1) + '' - '' + CONVERT(VARCHAR(20), 
                      BX_SERVICES.DOS_END, 1), 
                      BX_SERVICES.AMOUNT, BX_SERVICES.LITIGATED, BX_SERVICES.COMPLETE, BX_SERVICES.DATE_SENT, BX_PHYSICIANS.NAME,BX_SERVICES.DOS_END,BX_SERVICES.DOS_START,BX_SERVICES.STATUS,
					  BX_SERVICE_STATUS.NAME,BX_SERVICES.REFERENCE,BX_CASE.CLAIM_NUMBER, BX_CASE_TYPE.DESCRIPTION,Provider_GroupName, BX_SERVICES.BATCH_ID
					   
				ORDER BY BX_CASE.CASE_ID DESC
'
SET @QUERY_STRING = @QUERY_STRING + @FILTER_STRING + @GROUP_BY_STRING

EXEC SP_EXECUTESQL @QUERY_STRING


	GOTO FINISH
	END
	
END 

-------- RESULT SET
--SET @RESULTSET=CONVERT(INT,@RESULT)

IF @AGING_TYPE='Equal to'
		BEGIN
		
				SET @FILTER_STRING = @FILTER_STRING + '(CASE WHEN BX_SERVICES.COMPLETE = 0 THEN DATEDIFF(D, dbo.BX_SERVICES.DOS_START, GETDATE())  END = ' + CONVERT(VARCHAR(10),@AGING) +')'

			SET @QUERY_STRING=	'	SELECT TOP('+ @RESULT +')  BX_CASE.CASE_ID, BX_CASE.CASE_ID_LONG, tblProvider.Provider_Name + ISNULL('' [ '' + tblProvider.Provider_GroupName + '' ]'', '''') 
                      AS Provider_name, BX_CASE.PATIENT_LASTNAME + '', '' + BX_CASE.PATIENT_FIRSTNAME AS PATIENT, 
                      tblInsuranceCompany.InsuranceCompany_Name, BX_SERVICES.ID, BX_SERVICES.AMOUNT, CONVERT(VARCHAR(20), BX_SERVICES.DOS_START, 1) 
                      + '' - '' + CONVERT(VARCHAR(20), BX_SERVICES.DOS_END, 1) AS DOS, BX_SERVICES.LITIGATED, BX_SERVICES.COMPLETE, 
                      CASE WHEN BX_SERVICES.COMPLETE = 0 THEN ISNULL(DATEDIFF(D, dbo.BX_SERVICES.DOS_START, GETDATE()), 0) ELSE ''0'' END AS AGING, 
                      BX_PHYSICIANS.NAME, BX_SERVICE_STATUS.NAME AS STATUS_NAME, BX_SERVICES.REFERENCE, BX_SERVICES.DATE_SENT, 
                      BX_CASE.CLAIM_NUMBER, BX_CASE_TYPE.DESCRIPTION AS CASE_TYPE, BX_SERVICES.BATCH_ID,SUM(ISNULL(BX_PAYMENTS.AMOUNT, 0)) AS PAYMENTS , ISNULL(BX_SERVICES.AMOUNT, 0) - SUM(ISNULL(BX_PAYMENTS.AMOUNT, 0)) AS BALANCE
FROM         BX_PAYMENTS RIGHT OUTER JOIN
                      BX_PHYSICIANS INNER JOIN
                      BX_SERVICE_STATUS INNER JOIN
                      BX_SERVICES ON BX_SERVICE_STATUS.ID = BX_SERVICES.STATUS ON BX_PHYSICIANS.ID = BX_SERVICES.RENDERED_BY ON 
                      BX_PAYMENTS.SERVICE_ID = BX_SERVICES.ID RIGHT OUTER JOIN
                      BX_CASE INNER JOIN
                      BX_CASE_TYPE ON BX_CASE.TYPE = BX_CASE_TYPE.ID LEFT OUTER JOIN
                      BX_FACILITY ON BX_CASE.FACILITY = BX_FACILITY.ID LEFT OUTER JOIN
                      tblProvider ON BX_CASE.PROVIDER = tblProvider.Provider_Id ON BX_SERVICES.CASE_ID = BX_CASE.CASE_ID LEFT OUTER JOIN
                      tblInsuranceCompany ON BX_CASE.INSURANCE = tblInsuranceCompany.InsuranceCompany_Id    
                      '
			
SET @GROUP_BY_STRING = ' GROUP BY BX_CASE.CASE_ID, BX_CASE.CASE_ID_LONG, tblProvider.Provider_Name +Isnull('' [ ''+Provider_GroupName + '' ]'',''''), BX_CASE.PATIENT_LASTNAME + '', '' +  BX_CASE.PATIENT_FIRSTNAME, 
                      tblInsuranceCompany.InsuranceCompany_Name, BX_SERVICES.ID, CONVERT(VARCHAR(20), BX_SERVICES.DOS_START, 1) + '' - '' + CONVERT(VARCHAR(20), 
                      BX_SERVICES.DOS_END, 1), 
                      BX_SERVICES.AMOUNT, BX_SERVICES.LITIGATED, BX_SERVICES.COMPLETE, BX_SERVICES.DATE_SENT, BX_PHYSICIANS.NAME,BX_SERVICES.DOS_END,BX_SERVICES.DOS_START,BX_SERVICES.STATUS,
					  BX_SERVICE_STATUS.NAME,BX_SERVICES.REFERENCE,BX_CASE.CLAIM_NUMBER, BX_CASE_TYPE.DESCRIPTION,Provider_GroupName, BX_SERVICES.BATCH_ID
					   

				ORDER BY BX_CASE.CASE_ID DESC
'

SET @QUERY_STRING = @QUERY_STRING + @FILTER_STRING + @GROUP_BY_STRING

EXEC SP_EXECUTESQL @QUERY_STRING

	GOTO FINISH
	END
IF @AGING_TYPE='More than'
		BEGIN
		
SET @FILTER_STRING = @FILTER_STRING + ' (ISNULL((CASE WHEN BX_SERVICES.COMPLETE = 0 THEN DATEDIFF(D, dbo.BX_SERVICES.DOS_START, GETDATE()) ELSE ''0'' END),''0'') >= CONVERT(VARCHAR(5),' + CONVERT(VARCHAR(10),@AGING) +')) '

			SET @QUERY_STRING=	'	SELECT TOP('+ @RESULT +')  BX_CASE.CASE_ID, BX_CASE.CASE_ID_LONG, tblProvider.Provider_Name + ISNULL('' [ '' + tblProvider.Provider_GroupName + '' ]'', '''') 
                      AS Provider_name, BX_CASE.PATIENT_LASTNAME + '', '' + BX_CASE.PATIENT_FIRSTNAME AS PATIENT, 
                      tblInsuranceCompany.InsuranceCompany_Name, BX_SERVICES.ID, BX_SERVICES.AMOUNT, CONVERT(VARCHAR(20), BX_SERVICES.DOS_START, 1) 
                      + '' - '' + CONVERT(VARCHAR(20), BX_SERVICES.DOS_END, 1) AS DOS, BX_SERVICES.LITIGATED, BX_SERVICES.COMPLETE, 
                      CASE WHEN BX_SERVICES.COMPLETE = 0 THEN ISNULL(DATEDIFF(D, dbo.BX_SERVICES.DOS_START, GETDATE()), 0) ELSE ''0'' END AS AGING, 
                      BX_PHYSICIANS.NAME, BX_SERVICE_STATUS.NAME AS STATUS_NAME, BX_SERVICES.REFERENCE, BX_SERVICES.DATE_SENT, 
                      BX_CASE.CLAIM_NUMBER, BX_CASE_TYPE.DESCRIPTION AS CASE_TYPE, BX_SERVICES.BATCH_ID,SUM(ISNULL(BX_PAYMENTS.AMOUNT, 0)) AS PAYMENTS , ISNULL(BX_SERVICES.AMOUNT, 0) - SUM(ISNULL(BX_PAYMENTS.AMOUNT, 0)) AS BALANCE
FROM         BX_PAYMENTS RIGHT OUTER JOIN
                      BX_PHYSICIANS INNER JOIN
                      BX_SERVICE_STATUS INNER JOIN
                      BX_SERVICES ON BX_SERVICE_STATUS.ID = BX_SERVICES.STATUS ON BX_PHYSICIANS.ID = BX_SERVICES.RENDERED_BY ON 
                      BX_PAYMENTS.SERVICE_ID = BX_SERVICES.ID RIGHT OUTER JOIN
                      BX_CASE INNER JOIN
                      BX_CASE_TYPE ON BX_CASE.TYPE = BX_CASE_TYPE.ID LEFT OUTER JOIN
                      BX_FACILITY ON BX_CASE.FACILITY = BX_FACILITY.ID LEFT OUTER JOIN
                      tblProvider ON BX_CASE.PROVIDER = tblProvider.Provider_Id ON BX_SERVICES.CASE_ID = BX_CASE.CASE_ID LEFT OUTER JOIN
                      tblInsuranceCompany ON BX_CASE.INSURANCE = tblInsuranceCompany.InsuranceCompany_Id    
                      '
			
SET @GROUP_BY_STRING = ' GROUP BY BX_CASE.CASE_ID, BX_CASE.CASE_ID_LONG, tblProvider.Provider_Name +Isnull('' [ ''+Provider_GroupName + '' ]'',''''), BX_CASE.PATIENT_LASTNAME + '', '' +  BX_CASE.PATIENT_FIRSTNAME, 
                      tblInsuranceCompany.InsuranceCompany_Name, BX_SERVICES.ID, CONVERT(VARCHAR(20), BX_SERVICES.DOS_START, 1) + '' - '' + CONVERT(VARCHAR(20), 
                      BX_SERVICES.DOS_END, 1), 
                      BX_SERVICES.AMOUNT, BX_SERVICES.LITIGATED, BX_SERVICES.COMPLETE, BX_SERVICES.DATE_SENT, BX_PHYSICIANS.NAME,BX_SERVICES.DOS_END,BX_SERVICES.DOS_START,BX_SERVICES.STATUS,
					  BX_SERVICE_STATUS.NAME,BX_SERVICES.REFERENCE,BX_CASE.CLAIM_NUMBER, BX_CASE_TYPE.DESCRIPTION,Provider_GroupName, BX_SERVICES.BATCH_ID
					   

				ORDER BY BX_CASE.CASE_ID DESC
'

SET @QUERY_STRING = @QUERY_STRING + @FILTER_STRING + @GROUP_BY_STRING

EXEC SP_EXECUTESQL @QUERY_STRING


	GOTO FINISH
	END


IF @AGING_TYPE='Less than'
		BEGIN
SET @FILTER_STRING = @FILTER_STRING + 'ISNULL((CASE WHEN BX_SERVICES.COMPLETE = 0 THEN DATEDIFF(D, dbo.BX_SERVICES.DOS_START, GETDATE()) ELSE ''0'' END),''0'') <= CONVERT(VARCHAR(5),' + CONVERT(VARCHAR(10),@AGING) +')'
		
		
			SET @QUERY_STRING=	'	SELECT TOP('+ @RESULT +')  BX_CASE.CASE_ID, BX_CASE.CASE_ID_LONG, tblProvider.Provider_Name + ISNULL('' [ '' + tblProvider.Provider_GroupName + '' ]'', '''') 
                      AS Provider_name, BX_CASE.PATIENT_LASTNAME + '', '' + BX_CASE.PATIENT_FIRSTNAME AS PATIENT, 
                      tblInsuranceCompany.InsuranceCompany_Name, BX_SERVICES.ID, BX_SERVICES.AMOUNT, CONVERT(VARCHAR(20), BX_SERVICES.DOS_START, 1) 
                      + '' - '' + CONVERT(VARCHAR(20), BX_SERVICES.DOS_END, 1) AS DOS, BX_SERVICES.LITIGATED, BX_SERVICES.COMPLETE, 
                      CASE WHEN BX_SERVICES.COMPLETE = 0 THEN ISNULL(DATEDIFF(D, dbo.BX_SERVICES.DOS_START, GETDATE()), 0) ELSE ''0'' END AS AGING, 
                      BX_PHYSICIANS.NAME, BX_SERVICE_STATUS.NAME AS STATUS_NAME, BX_SERVICES.REFERENCE, BX_SERVICES.DATE_SENT, 
                      BX_CASE.CLAIM_NUMBER, BX_CASE_TYPE.DESCRIPTION AS CASE_TYPE, BX_SERVICES.BATCH_ID,SUM(ISNULL(BX_PAYMENTS.AMOUNT, 0)) AS PAYMENTS , ISNULL(BX_SERVICES.AMOUNT, 0) - SUM(ISNULL(BX_PAYMENTS.AMOUNT, 0)) AS BALANCE
FROM         BX_PAYMENTS RIGHT OUTER JOIN
                      BX_PHYSICIANS INNER JOIN
                      BX_SERVICE_STATUS INNER JOIN
                      BX_SERVICES ON BX_SERVICE_STATUS.ID = BX_SERVICES.STATUS ON BX_PHYSICIANS.ID = BX_SERVICES.RENDERED_BY ON 
                      BX_PAYMENTS.SERVICE_ID = BX_SERVICES.ID RIGHT OUTER JOIN
                      BX_CASE INNER JOIN
                      BX_CASE_TYPE ON BX_CASE.TYPE = BX_CASE_TYPE.ID LEFT OUTER JOIN
                      BX_FACILITY ON BX_CASE.FACILITY = BX_FACILITY.ID LEFT OUTER JOIN
                      tblProvider ON BX_CASE.PROVIDER = tblProvider.Provider_Id ON BX_SERVICES.CASE_ID = BX_CASE.CASE_ID LEFT OUTER JOIN
                      tblInsuranceCompany ON BX_CASE.INSURANCE = tblInsuranceCompany.InsuranceCompany_Id    
                      '
			
SET @GROUP_BY_STRING = ' GROUP BY BX_CASE.CASE_ID, BX_CASE.CASE_ID_LONG, tblProvider.Provider_Name +Isnull('' [ ''+Provider_GroupName + '' ]'',''''), BX_CASE.PATIENT_LASTNAME + '', '' +  BX_CASE.PATIENT_FIRSTNAME, 
                      tblInsuranceCompany.InsuranceCompany_Name, BX_SERVICES.ID, CONVERT(VARCHAR(20), BX_SERVICES.DOS_START, 1) + '' - '' + CONVERT(VARCHAR(20), 
                      BX_SERVICES.DOS_END, 1), 
                      BX_SERVICES.AMOUNT, BX_SERVICES.LITIGATED, BX_SERVICES.COMPLETE, BX_SERVICES.DATE_SENT, BX_PHYSICIANS.NAME,BX_SERVICES.DOS_END,BX_SERVICES.DOS_START,BX_SERVICES.STATUS,
					  BX_SERVICE_STATUS.NAME,BX_SERVICES.REFERENCE,BX_CASE.CLAIM_NUMBER, BX_CASE_TYPE.DESCRIPTION,Provider_GroupName, BX_SERVICES.BATCH_ID
					   

				ORDER BY BX_CASE.CASE_ID DESC
'

SET @QUERY_STRING = @QUERY_STRING + @FILTER_STRING + @GROUP_BY_STRING

EXEC SP_EXECUTESQL @QUERY_STRING

				
				
				END
FINISH:

--SELECT @AGING_TYPE,@RESULT,@AGING,@FILTER_STRING,@REFERENCE
 END
GO
