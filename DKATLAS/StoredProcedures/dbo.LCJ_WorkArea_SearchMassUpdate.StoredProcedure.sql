USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_WorkArea_SearchMassUpdate]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[LCJ_WorkArea_SearchMassUpdate]-- [LCJ_WorkArea_SearchMassUpdate]'','','','','','','','','','','','','','fasstos','',0,'',''

(
	@strOldCaseId                           nvarchar(50),
	@strCaseId                              nvarchar(50),
	@Status                                 nvarchar(50),
	@InjuredParty_LastName               	nvarchar(50),
	@InjuredParty_FirstName               	nvarchar(50),
	@InsuredParty_LastName              	nvarchar(50),
	@InsuredParty_FirstName              	nvarchar(50),
	@Policy_Number                          nvarchar(100),
	@Ins_Claim_Number                       nvarchar(100),
	@IndexOrAAA_Number                  	nvarchar(100),
	@AssignedValue						int =null,
	@PeerDoctor						nvarchar (100)=null,
	@strMultipleValues Nvarchar(max)
)

As


DECLARE @tblCaseTemp AS TABLE
(
	CASEID VARCHAR(100)
)
INSERT INTO @tblCaseTemp
select items FROM dbo.STRING_SPLIT(@strMultipleValues,',')

DECLARE @strsql as nvarchar(max)

begin
  

--print(@strsql_cursor)
select top 1000 Case_Id,
Case_Code,  
(InjuredParty_LastName + ',' + InjuredParty_FirstName) as InjuredParty_Name,
Provider_Name,
InsuranceCompany_Name,
convert(varchar, Accident_Date, 101) as Accident_Date,
ISNULL(convert(varchar, DateOfService_Start,101),'') as DateOfService_Start,
ISNULL(convert(varchar, DateOfService_End,101),'') as DateOfService_End,
Status,
Initial_Status,
Ins_Claim_Number,
convert(decimal(38,2),convert(float,Claim_Amount) - convert(float,Paid_Amount)) as Claim_Amount,
'' AS ClickMe
From tblcase inner join tblprovider on tblcase.provider_id=tblprovider.provider_id inner join tblinsurancecompany on tblcase.insurancecompany_id=tblinsurancecompany.insurancecompany_id 
WHERE 
 1=1

AND (@strOldCaseId = '' OR Case_Code like '%' + @strOldCaseId +'%')
	AND (@strCaseId = '' OR Case_Id like '%' + @strCaseId +'%' )
	AND (@InjuredParty_LastName ='' OR InjuredParty_LastName like '%'+ @InjuredParty_LastName + '%')
	AND (@InjuredParty_FirstName ='' OR InjuredParty_FirstName like '%'+ @InjuredParty_FirstName + '%')
	AND (@InsuredParty_LastName ='' OR InsuredParty_LastName like '%'+ @InsuredParty_LastName + '%')
	AND (@InsuredParty_FirstName ='' OR InsuredParty_FirstName like '%'+ @InsuredParty_FirstName + '%')
	AND (@Policy_Number ='' OR Policy_Number like '%'+ @Policy_Number + '%')
	AND (@Ins_Claim_Number ='' OR Ins_Claim_Number like '%'+ @Ins_Claim_Number + '%')
	AND (@IndexOrAAA_Number ='' OR IndexOrAAA_Number like '%'+ @IndexOrAAA_Number + '%')		
	AND (@Status = '' OR @Status = '0' OR Status = @Status)
	AND (@strMultipleValues ='' OR Case_Id in (SELECT CASEID FROM @tblCaseTemp))
ORDER BY Case_AutoId DESC

end
--**************** End of Procedure LCJ_WorkArea_SearchCaseSimple **********************
GO
