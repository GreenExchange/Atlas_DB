USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Case_Search_Simple]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[Case_Search_Simple]    
-- [LCJ_WorkArea_SearchCaseSimple] @DomainId = 'AF' , @SZ_USER_ID= 4088    
(    
  @strCaseId                              varchar(50)='',    
  @Status                                 varchar(50)='',    
  @InjuredParty_LastName                varchar(50)='',    
  @InjuredParty_FirstName                varchar(50)='',    
  @InsuredParty_LastName               varchar(50)='',    
  @InsuredParty_FirstName               varchar(50)='',    
  @Policy_Number                          varchar(100)='',    
  @Ins_Claim_Number                       varchar(100)='',    
  @IndexOrAAA_Number                   varchar(100)='',    
  @Provider_Id       int=0,    
  @InsuranceCompany_Id     int=0,    
  @SZ_USER_ID      int=0,    
  @AssignedValue      int =0,    
  @DenialReasons_Id     int=0,    
  @s_a_Rebuttal_Status   varchar(100)='',   
  @DomainId        varchar(50)='amt'  ,  
  @PortfolioId int =0  ,  
  @AttorneyFirmId int =0  ,  
  @Reference_CaseId varchar(50)='',  
  @InitialStatus varchar(100)='',  
  @AccidentDate varchar(100) = '',  
  @strBill_No    varchar(100)='',  
  @Provider_Group       varchar(100)='',  
  @ProviderName varchar(200)='',  
  @InsuranceName varchar(200)='',  
  @s_a_FinalStatus   varchar(100)='',   
  @s_a_Forum   varchar(100)='',  
  @s_a_PacketId   varchar(100)='',  
  @ChequeNo   Nvarchar(100)='',  
  @Attorney_FirstName    varchar(50)='',  
  @Attorney_LastName    varchar(50)='',  
  @Adjuster_LastName    varchar(50)='',  
  @Adjuster_FirstName    varchar(50)=''  
)    
AS    
begin   
	SET NOCOUNT ON  
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED  
   
	SET @strCaseId=(LTRIM(RTRIM(@strCaseId)))    
     
	DECLARE @strsql as varchar(max)    
	DECLARE @InvestorId AS INT = 0    
	SELECT @InvestorId=InvestorId FROM Tbl_Investor WHERE UserId = @SZ_USER_ID and DomainId = @DomainId   
    
	Declare @CompanyType varchar(150)=''
	Select TOP 1 @CompanyType = LOWER(LTRIM(RTRIM(CompanyType))) from tbl_Client(NOLOCK) Where DomainId=@DomainID
  
  
  Select  tblcase.Case_Id,     
   (InjuredParty_LastName + ',' + InjuredParty_FirstName) as InjuredParty_Name,    
   (Attorney_LastName + ',' + Attorney_FirstName) as Attorney_Name,  
   (Adjuster_LastName + ',' + Adjuster_FirstName)  as Adjuster_Name,  
   iif(@CompanyType!='funding', a_att.Assigned_Attorney,
   SUBSTRING(ISNULL(STUFF((
		SELECT COALESCE(isnull(Attorney_FirstName, '') + SPACE(1) + isnull( Attorney_LastName,'')+', ',' - ')
				FROM tblAttorney_Case_Assignment aa (NOLOCK) 
				inner join tblAttorney_Master am (NOLOCK) on am.Attorney_Id = aa.Attorney_Id inner join tblAttorney_Type atp (NOLOCK) on atp.Attorney_Type_ID = am.Attorney_Type_Id
				Where aa.Case_Id = tblcase.Case_Id  and Lower(Attorney_Type) = 'plaintiff attorney' and aa.DomainId = @DomainId 
				AND (@Attorney_FirstName = ''  or AM.Attorney_FirstName  Like '%' + @Attorney_FirstName + '%')
				AND (@Attorney_LastName = ''  or AM.Attorney_LastName  Like '%' + @Attorney_LastName + '%')
		for xml path('')
	),1,0,''),','),1,(LEN(ISNULL(STUFF(
	(
		SELECT COALESCE(isnull(Attorney_FirstName, '') + SPACE(1) + isnull( Attorney_LastName,'')+', ',' - ')
				FROM tblAttorney_Case_Assignment aa (NOLOCK) 
				inner join tblAttorney_Master am (NOLOCK) on am.Attorney_Id = aa.Attorney_Id inner join tblAttorney_Type atp (NOLOCK) on atp.Attorney_Type_ID = am.Attorney_Type_Id
				Where aa.Case_Id = tblcase.Case_Id and Lower(Attorney_Type) = 'plaintiff attorney' and aa.DomainId = @DomainId
				AND (@Attorney_FirstName = ''  or AM.Attorney_FirstName  Like '%' + @Attorney_FirstName + '%')
				AND (@Attorney_LastName = ''  or AM.Attorney_LastName  Like '%' + @Attorney_LastName + '%')
		for xml path('')
	),1,0,''),',')))-1)	)  AS Assigned_Attorney,
   Provider_Name,    
   tblprovider.Provider_GroupName,  
   InsuranceCompany_Name,    
   convert(varchar, Accident_Date, 101) as Accident_Date,    
   convert(varchar, ISNULL(tblCase.DateOfService_Start,''),101) as DateOfService_Start,    
   convert(varchar, ISNULL(tblCase.DateOfService_End,''),101) as DateOfService_End,    
   Status,    
   Rebuttal_Status,  
   Ins_Claim_Number,    
   Policy_Number,  
    --convert(varchar, Date_BillSent, 101) as Date_BillSent,    
    convert(varchar, ISNULL(tblCase.Date_BillSent,''),101) as Date_BillSent ,  
   convert(decimal(38,2),(convert(money,convert(float,Claim_Amount)))) as Claim_Amount,    
   convert(decimal(38,2),(convert(money,convert(float,Paid_Amount)))) as Paid_Amount,   
  
   (select convert(decimal(38,2),(convert(money,convert(float,sum(transactions_amount))))) from tblTransactions (NOLOCK)  where tblTransactions.case_id=tblcase.Case_Id and DomainId=@DomainId and Transactions_Type in ('PreC','PreCToP'))[Voluntary_Payment],
  
   (select convert(decimal(38,2),(convert(money,convert(float,sum(transactions_amount))))) from tblTransactions (NOLOCK) where tblTransactions.case_id=tblcase.Case_Id and DomainId=@DomainId and Transactions_Type in ('C','I'))[Collection_Payment],  
  
   convert(decimal(38,2),(convert(money,convert(float,Claim_Amount) - convert(float,Paid_Amount)- ISNULL(WriteOff,0)))) as Claim_Balance,    
   convert(decimal(38,2),(convert(money,convert(float,Fee_Schedule)))) as FS_Amount,    
   convert(decimal(38,2),(convert(money,convert(float,Fee_Schedule) - convert(float,Paid_Amount)- ISNULL(WriteOff,0)))) as FS_Balance,   
   -- dbo.fncGetBillNumber(tblCase.Case_id) As BillNumber,  
   (select top 1 bill_number from tblTreatment (NOLOCK) where ISNULL(bill_number,'') <> '' and case_id = tblcase.case_id and domainid = tblcase.DomainId) as BillNumber,  
   --'' as BillNumber,  
   convert(varchar, ISNULL(tblCase.Date_Opened,''),101) as Date_Opened,  
   IndexOrAAA_Number,    
   tblCase.Initial_Status,  
   (Select top 1 a.Case_Id FROM  tblCase a (NOLOCK) WHERE a.Provider_Id =tblcase.Provider_Id  and a.InjuredParty_LastName =tblcase.InjuredParty_LastName    
   and a.InjuredParty_FirstName = tblcase.InjuredParty_FirstName and  a.Accident_Date =tblcase.Accident_Date     
   and a.Case_Id <> tblcase.case_id) AS Similar_To_Case_ID    
   , AF.Name AttorneyFirmName
   , PF.Name PortfolioName    
   ,ISNULL(tblCase.case_code,'') AS Reference_CaseId  
   , DenialReasons_Type AS DenialReasons  
   ,sta.forum  
   ,sta.Final_Status  
   ,p.PacketID  
   ,StatusDisposition  
   ,DateDiff(dd,ISNULL(Date_Status_Changed,Date_Opened),GETDATE()) AS Status_Age  
   , DateDiff(dd,Date_Opened,GETDATE()) AS Case_Age  
   ,(select top 1 ChequeNo from tblTransactions (NOLOCK) where ISNULL(ChequeNo,'') <> '' and case_id = tblcase.case_id and domainid = tblcase.DomainID) as ChequeNo  
  From tblcase as tblcase  (NOLOCK)  
  left join tblprovider  as tblprovider (NOLOCK) on tblcase.provider_id=tblprovider.provider_id     
  left join tblinsurancecompany as tblinsurancecompany (NOLOCK) on tblcase.insurancecompany_id=tblinsurancecompany.insurancecompany_id     
  left join tbl_portfolio PF (NOLOCK)on tblcase.PortfolioId=PF.id     
  left join tbl_AttorneyFirm AF (NOLOCK) on tblcase.AttorneyFirmId=AF.id    
  --left join tblStatus sta (NOLOCK) on tblcase.Status=sta.Status_Type  AND tblcase.DomainId= sta.DomainId  
  left JOIN dbo.tblStatus sta (NOLOCK) on tblcase.Status=sta.Status_Type AND tblcase.DomainId= sta.DomainId  
  left join tblPacket p (NOLOCK) on tblcase.FK_Packet_ID = p.Packet_Auto_ID  
  left join tblAttorney att (NOLOCK) on tblcase.Attorney_Id = att.Attorney_Id  
  left join tblAdjusters adj (NOLOCK) on tblcase.Adjuster_Id = adj.Adjuster_Id  
   LEFT OUTER JOIN dbo.Assigned_Attorney a_att (NOLOCK) ON tblcase.Assigned_Attorney = a_att.PK_Assigned_Attorney_ID
  -- left join tblTransactions tra (NOLOCK) on tblcase.case_id = tra.Case_Id  
  WHERE tblcase.DomainId= @DomainId    
     AND tblCase.status <> 'IN ARB OR LIT'  
    AND (@strCaseId ='' or tblcase.Case_Id Like '%' + @strCaseId + '%')      
    AND (@Reference_CaseId ='' OR tblCase.case_code like '%' + @Reference_CaseId + '%')    
    AND (STATUS = @Status OR @Status = '' OR @Status = '0' OR @Status = 'all')    
    AND (@s_a_Rebuttal_Status = '' OR Rebuttal_Status = @s_a_Rebuttal_Status)    
    AND (@InjuredParty_LastName = '' or InjuredParty_LastName Like '%' + @InjuredParty_LastName + '%')     
    AND (@InjuredParty_FirstName = '' or InjuredParty_FirstName Like '%' + @InjuredParty_FirstName + '%')    
    AND (@InsuredParty_LastName = '' or InsuredParty_LastName Like '%' + @InsuredParty_LastName + '%')    
    AND (@InsuredParty_FirstName = '' or InsuredParty_FirstName Like '%' + @InsuredParty_FirstName + '%')  
	
    AND 
	((@CompanyType!='funding' AND (@Attorney_FirstName = ''  or Attorney_FirstName  Like '%' + @Attorney_FirstName + '%')   
     AND (@Attorney_LastName = ''  or Attorney_LastName  Like '%' + @Attorney_LastName + '%'))
	 OR
	 (@CompanyType='funding' AND ((Select Count(*) from tblAttorney_Case_Assignment(NOLOCK) ACA INNER JOIN
									tblAttorney_Master AM (NOLOCK) ON AM.Attorney_Id=ACA.Attorney_Id INNER JOIN 
									tblAttorney_Type ATP ON AM.Attorney_Type_Id = ATP.Attorney_Type_ID
									Where ACA.Case_Id = tblcase.Case_Id and ACA.DomainId = @DomainId and LOWER(Attorney_Type) = 'plaintiff attorney'
									AND (@Attorney_FirstName = ''  or AM.Attorney_FirstName  Like '%' + @Attorney_FirstName + '%')   
									AND (@Attorney_LastName = ''  or AM.Attorney_LastName  Like '%' + @Attorney_LastName + '%')) > 0
	 OR (@Attorney_FirstName = '' and @Attorney_LastName = ''))))  
       
    AND (@Adjuster_FirstName = ''  or Adjuster_FirstName  Like '%' + @Adjuster_FirstName + '%')   
    AND (@Adjuster_LastName= ''  or Adjuster_LastName  Like '%' + @Adjuster_LastName + '%')    
        
    AND (@ProviderName = '' or Provider_Name Like '%' + @ProviderName + '%')  
    AND (@InsuranceName = '' or InsuranceCompany_Name Like '%' + @InsuranceName + '%')  
    AND (@Policy_Number='' or  Policy_Number= @Policy_Number )         
    AND (@Ins_Claim_Number='' or  Replace(Ins_Claim_Number,'-','') LIKE '%' + Replace(@Ins_Claim_Number,'-','')+ '%')          
    and (@IndexOrAAA_Number = '' or Replace(IndexOrAAA_Number,'-','') LIKE '%' + Replace(@IndexOrAAA_Number,'-','') + '%')     
    and (@Provider_Id = 0 or  tblcase.Provider_ID = @Provider_Id )     
    AND (@InsuranceCompany_Id = 0  OR tblcase.InsuranceCompany_Id  =  @InsuranceCompany_Id)     
    and (@AssignedValue = 0 or tblCase.UserId = @SZ_USER_ID )   
    and (@strBill_No ='' or tblcase.Case_Id in (select Case_Id from tbltreatment where BILL_NUMBER  Like '%' + @strBill_No + '%'))   
    and (@Provider_Group = '' OR tblprovider.Provider_GroupName =  @Provider_Group)  
    and ( @DenialReasons_Id = 0     
    OR tblcase.case_id in ( select distinct case_id     
     from tbltreatment (NOLOCK) where DenialReason_Id =@DenialReasons_Id  AND DomainId= @DomainId  
    OR treatment_id in(select treatment_id     
       from TXN_tblTreatment   (NOLOCK)   
       where DenialReasons_id= @DenialReasons_Id  AND DomainId= @DomainId ))  
     )   
  
    AND (@PortfolioId=0 OR tblcase.PortfolioId= @PortfolioId)    
    AND (@AttorneyFirmId=0 OR tblcase.AttorneyFirmId=@AttorneyFirmId)    
    AND (@InvestorId = 0 OR tblcase.portfolioid in (SElect portfolioid from tbl_InvestorPortfolio IP (NOLOCK) WHERE IP.InvestorId =@InvestorId))    
    And (Initial_Status = '' OR Initial_Status LIKE '%' + @InitialStatus + '%')     
    AND (@AccidentDate = '' OR convert(varchar, Accident_Date, 101) like '%' + @AccidentDate + '%')  
    AND (@s_a_FinalStatus  ='' OR  ISNULL (sta.Final_Status,'')= @s_a_FinalStatus )  
    AND (@s_a_Forum  ='' OR ISNULL (sta.forum,'')= @s_a_Forum )   
    AND (@s_a_PacketId='' OR p.PacketID LIKE '%' + @s_a_PacketId + '%')   
    AND (@ChequeNo = '' OR tblcase.case_id in (SELECT DISTINCT CASE_ID FROM tblTransactions (NOLOCK) WHERE DomainId = @DomainId and Replace(ChequeNo,'-','') LIKE '%' + Replace(@ChequeNo,'-','') + '%')    )  
   order by case_autoid desc     
end    
    
  
GO
