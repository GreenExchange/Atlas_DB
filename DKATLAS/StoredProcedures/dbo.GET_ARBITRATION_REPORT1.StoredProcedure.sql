USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[GET_ARBITRATION_REPORT1]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_ARBITRATION_REPORT1]
 --[GET_ARBITRATION_REPORT] '1','qwqw','www,eee,rr','sd,sds,sds','xcxc','dfdf','03/03/2012','07/07/2012','AAA'
 --[GET_ARBITRATION_REPORT1] '1','FH11-87138','','','','','','',''
(
	@type varchar(10),
	@CaseId varchar(Max),
    @InsCo varchar(500),
    @Prov varchar(500),
    @InsGrp varchar(500),
    @ProvGrp varchar(500),
    @StartDate varchar(50),
    @EndDate varchar(50),
    @Status varchar(500)
)
AS
DECLARE @Ins_Co AS NVARCHAR(MAX)
DECLARE @Provider AS NVARCHAR(MAX)
DECLARE @Stat AS NVARCHAR(MAX)
DECLARE @Cases AS NVARCHAR(MAX)
DECLARE @str AS NVARCHAR(MAX)

BEGIN
set @Ins_Co=REPLACE (@InsCo,',',''',''')
set @Provider=REPLACE (@Prov,',',''',''')
set @Stat=REPLACE (@Status,',',''',''')
set @Cases=REPLACE (@CaseId,',',''',''')
--print @Ins_Co

	IF(@type ='0')
	BEGIN
		set @str=('select Convert(varchar(10),ACCIDENT_DATE,101) as ACCIDENT_DATE,
		CASE WHEN Convert(varchar(50),DENIAL_DATE,101)=''01/01/1900'' THEN '''' ELSE Convert(varchar(50),DENIAL_DATE,101) END as  DENIAL_DATE,
		BALANCE_AMOUNT,
		LVC.CASE_ID,
		LVC.CASE_ID AS CASES,
		STATUS,
		CLAIM_AMOUNT,
		DOS_END,
		DOS_START,
		INJUREDPARTY_NAME,
		INJUREDPARTY_ADDRESS,
		INJUREDPARTY_CITY,
		INJUREDPARTY_STATE,
		INJUREDPARTY_ZIP,
		INS_CLAIM_NUMBER,
		INSURANCECOMPANY_LOCAL_CITY,
		INSURANCECOMPANY_LOCAL_STATE,
		INSURANCECOMPANY_LOCAL_ZIP,
		INSURANCECOMPANY_NAME,
		INSUREDPARTY_ADDRESS,
		INSUREDPARTY_CITY,
		INSUREDPARTY_NAME,
		INSUREDPARTY_LASTNAME,
		INSUREDPARTY_FIRSTNAME,
		INSUREDPARTY_STATE,
		INSUREDPARTY_ZIP,
		PAID_AMOUNT,
		POLICY_NUMBER,
		PROVIDER_LOCAL_ADDRESS,
		PROVIDER_LOCAL_CITY,
		PROVIDER_LOCAL_STATE,
		PROVIDER_LOCAL_ZIP,
		PROVIDER_SUITNAME,
		TODAY_DATE,
		TODAYDATE,
		FIRSTCAP_INSCOMPANY_LOCAL_ADDRESS,
		FIRSTCAP_INSCOMPANY_LOCAL_CITY,
		InsuranceCompany_Initial_Address,
		Representetive,
		Representative_Contact_Number		
		from LCJ_VW_CaseSearchDetails LVC
		WHERE Case_Id in (select case_id from tblArbitrationCases)')
	END
	Else
	BEGIN
		set @str=('select Convert(varchar(10),ACCIDENT_DATE,101) as ACCIDENT_DATE,
		CASE WHEN Convert(varchar(50),DENIAL_DATE,101)=''01/01/1900'' THEN '''' ELSE Convert(varchar(50),DENIAL_DATE,101) END as  DENIAL_DATE,
		BALANCE_AMOUNT,
		LVC.CASE_ID,
		LVC.CASE_ID AS CASES,
		STATUS,
		CLAIM_AMOUNT,
		DOS_END,
		DOS_START,
		INJUREDPARTY_NAME,
		INJUREDPARTY_ADDRESS,
		INJUREDPARTY_CITY,
		INJUREDPARTY_STATE,
		INJUREDPARTY_ZIP,
		INS_CLAIM_NUMBER,
		INSURANCECOMPANY_LOCAL_CITY,
		INSURANCECOMPANY_LOCAL_STATE,
		INSURANCECOMPANY_LOCAL_ZIP,
		INSURANCECOMPANY_NAME,
		INSUREDPARTY_ADDRESS,
		INSUREDPARTY_CITY,
		INSUREDPARTY_NAME,
		INSUREDPARTY_LASTNAME,
		INSUREDPARTY_FIRSTNAME,
		INSUREDPARTY_STATE,
		INSUREDPARTY_ZIP,
		PAID_AMOUNT,
		POLICY_NUMBER,
		PROVIDER_LOCAL_ADDRESS,
		PROVIDER_LOCAL_CITY,
		PROVIDER_LOCAL_STATE,
		PROVIDER_LOCAL_ZIP,
		PROVIDER_SUITNAME,
		TODAY_DATE,
		TODAYDATE,
		FIRSTCAP_INSCOMPANY_LOCAL_ADDRESS,
		FIRSTCAP_INSCOMPANY_LOCAL_CITY,
		InsuranceCompany_Initial_Address,
		Representetive,
		Representative_Contact_Number		
		from LCJ_VW_CaseSearchDetails LVC
		WHERE Case_Id Not in (select case_id from tblArbitrationCases) ')
	END
	
	if(@CaseId<>'')
	begin
	set @str=@str + ' and Case_Id in('''+@Cases+''')'
	end
	
	if(@Ins_Co<>'')
	begin
	set @str=@str + ' and INSURANCECOMPANY_NAME in('''+@Ins_Co+''')'
	end
	
	if(@InsGrp<>'')
	begin
	set @str=@str + ' and insurancecompany_groupname in('''+@InsGrp+''')'
	end
	
	if(@Provider<>'')
	begin
	set @str=@str + ' and PROVIDER_SUITNAME in('''+@Provider+''')'
	end
	
	if(@ProvGrp<>'')
	begin
	set @str=@str + ' and PROVIDER_GroupName in('''+@ProvGrp+''')'
	end
	
	if(@StartDate<>'' and @EndDate<>'')
	begin
	set @str=@str + ' and date_opened between '''+convert(datetime,@StartDate)+''' and '''+convert(datetime,@EndDate)+''''
	end
	
	if(@Stat<>'')
	begin
	set @str=@str + ' and status in('''+@Stat+''')' 
	end	
	
	if(@Stat='')
	begin
	set @str=@str -- + ' and status in(''AAA OPEN'',''AAA PENDING- RESOLVED'',''GBB ARB'',''GBB AWAITING REQUEST RETURNS'')' 
	end	
	print (@str)
	exec (@str)
END
GO
