USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_UserStatus_CriticalCases_Details]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--[LCJ_WorkArea_SearchCaseSimple]'','','','','','','','','','','','','','tech',0,0,0,0,1

CREATE PROCEDURE  [dbo].[SP_UserStatus_CriticalCases_Details]--[SP_UserStatus_CriticalCases_Details] 'AAA APPLICANTS MASTER ARB-AWAITING DECISION'
   
(
@Status nvarchar(500)
)

AS
begin
 


 
--DECLARE @strsql_cursor as nvarchar(max)  
DECLARE @strsql as nvarchar(max)

 set @strsql = 'select distinct tblCase.Case_Id as Edit
, CASE WHEN provider_groupname=''GBB'' and abs(datediff(dd,Accident_Date,tblCase.DateOfService_Start))<30
    		THEN ''<font color=red>''+tblCase.Case_Id+''</font> '' 
			WHEN provider_groupname=''GBB'' and abs(datediff(dd,Accident_Date,tblCase.DateOfService_Start))>45
			THEN ''<font color=red>''+tblCase.Case_Id+''</font> ''
			WHEN provider_groupname=''GBB'' and abs(datediff(dd,Accident_Date,tblCase.DateOfService_Start)) between 30 and 45
			THEN ''<font color=green>''+tblCase.Case_Id+''</font> ''
            else tblCase.case_id END as
             Case_Id,
Case_Code,  
(InjuredParty_LastName + '','' + InjuredParty_FirstName) as InjuredParty_Name,
Provider_Name,
InsuranceCompany_Name,
convert(varchar, Accident_Date, 101) as Accident_Date,
ISNULL(convert(varchar, tblCase.DateOfService_Start,101),'''') as DateOfService_Start,
ISNULL(convert(varchar, tblCase.DateOfService_End,101),'''') as DateOfService_End,
CASE  WHEN STATUS IN (''CLOSED'',''Closed Arbitration'',''Closed as per RCF'',''Closed Judgement'',''Closed Withdrawn with Prejudice'',''Closed Withdrawn without prejudice'',''Settled'',''Withdrawn-with-prejudice'',''withdrawn-without-prejudice'',''Carrier In Rehab'',''Pending'',''Open-Old'',''Trial Lost'',''CLOSED-SETTLED-PAID'',''CLOSED-VOLUNTARY-PAID'',''PAID-FULL'')
    		THEN ''<font color="red">''+Status+''</font> '' 
			WHEN STATUS IN (''AAA CLOSED'',''AAA COLLECTION'',''AAA CONCILIATION SETTLEMENT'',''AAA CONFIRMED'',''AAA FILED'',''AAA HEARING SET'',''AAA OPEN'',''AAA PENDING'',''AAA RESPONSE RCVD'',''AAA SETTLED AT HEARING'',''AAA SETTLED POST HEARING'',''AAA SETTLED PRE HEARING'',''AAA WITHDRAWN WITH PREJUDICE AT HEARING'',''AAA WITHDRAWN WITH PREJUDICE POST HEARING'',''AAA WITHDRAWN WITH PREJUDICE PRE HEARING'',''AAA WITHDRAWN WITHOUT PREJUDICE AT HEARING'',''AAA WITHDRAWN WITHOUT PREJUDICE POST HEARING'',''AAA WITHDRAWN WITHOUT PREJUDICE PRE HEARING'')
			THEN ''<font color="green">''+Status+''</font> ''
            else tblCase.Status END [Status],
Ins_Claim_Number,
round(convert(money,convert(float,tblCase.Claim_Amount) - convert(float,tblCase.Paid_Amount)),2) as Claim_Amount,
round(convert(money,convert(float,tblCase.Fee_Schedule) - convert(float,tblCase.Paid_Amount)),2) as FS_Balance,
(Select top 1 a.Case_Id FROM  tblCase a WHERE a.Provider_Id =tblcase.Provider_Id  and a.InjuredParty_LastName =tblcase.InjuredParty_LastName
and a.InjuredParty_FirstName = tblcase.InjuredParty_FirstName and  a.Accident_Date =tblcase.Accident_Date  
and a.Case_Id <> tblcase.case_id) AS Similar_To_Case_ID,
--tblPreparationStatus.Preparation_Status,
IndexOrAAA_Number,
tblPacket.PacketID, 
(select CaseType from MST_PacketCaseType m where m.PK_CaseType_Id=tblPacket.FK_CaseType_Id) AS CaseType, 
Opened_By,
DateDiff(dd,ISNULL(Date_Status_Changed,Date_Opened),GETDATE())AS status_age,
Memo
--(select clientpriority_level_name from tblclientprioritylevel l where l.pk_clientpriority_level_id=tblprovider.fk_clientpriority_level_id) AS Client_Priority_Level
From tblcase inner join tblprovider on tblcase.provider_id=tblprovider.provider_id 
inner join tblinsurancecompany on tblcase.insurancecompany_id=tblinsurancecompany.insurancecompany_id 
--left join tblPreparationStatus on tblcase.fk_prep_status_id=tblPreparationStatus.pk_prep_status_id
left join tblPacket on tblcase.FK_Packet_ID=tblPacket.Packet_Auto_ID
--inner join tblTreatment on tblTreatment.Case_Id = tblcase.case_id
WHERE 1=1 and (DateDiff(dd,ISNULL(Date_Status_Changed,Date_Opened),GETDATE()) > (select CriticalDays from tblUserStatus where Status=tblCase.Status)) ' 
 

if @Status <> '' and @Status <> '0' and @Status <> 'all'
begin
                set @strsql = @strsql + '  AND STATUS = ''' + @Status + ''''        
end





SET @strsql = @strsql 	


print @strsql 
exec (@strsql)
--select @strsql
end

GO
