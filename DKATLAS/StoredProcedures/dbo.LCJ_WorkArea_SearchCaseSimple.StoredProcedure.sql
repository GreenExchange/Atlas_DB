USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_WorkArea_SearchCaseSimple]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE  [dbo].[LCJ_WorkArea_SearchCaseSimple]
-- [LCJ_WorkArea_SearchCaseSimple] '','','','','','','','','','','','','','','',null,0,0,0,''
   
(
@strCaseId                              nvarchar(50),
@Status                                 nvarchar(50),
@InjuredParty_LastName               	nvarchar(50),
@InjuredParty_FirstName               	nvarchar(50),
@InsuredParty_LastName              	nvarchar(50),
@InsuredParty_FirstName              	nvarchar(50),
@Policy_Number                          nvarchar(100),
@Ins_Claim_Number                       nvarchar(100),
@IndexOrAAA_Number                  	nvarchar(100),
@Provider_Id							int=0,
@InsuranceCompany_Id					int=0,
--@ExcludeIds						nvarchar(1000),
@SZ_USER_ID						NVARCHAR(50),
@AssignedValue						int =null,
@DenialReasons_Id					int=0,
@strOldCaseId                           varchar(100),
@Accident_Date					  varchar(100)
--@PeerDoctor_ID						int=0,
--@Treating_DOCTOR_ID					int=0--,
--@BillNumber						nvarchar(100)=''
)

AS

 begin

SET @strCaseId=(LTRIM(RTRIM(@strCaseId)))
 
DECLARE @strsql_cursor as nvarchar(max)  
DECLARE @strsql as nvarchar(max)


set @strsql = 'select tblCase.Case_Id as Edit, Case_Id,
(InjuredParty_LastName + '','' + InjuredParty_FirstName) as InjuredParty_Name,
Provider_Name,
InsuranceCompany_Name,
convert(varchar, Accident_Date, 101) as Accident_Date,
convert(varchar, ISNULL(tblCase.DateOfService_Start,''''),101) as DateOfService_Start,
convert(varchar, ISNULL(tblCase.DateOfService_End,''''),101) as DateOfService_End,
Status,
Ins_Claim_Number,
convert(decimal(38,2),(convert(money,convert(float,Claim_Amount) - convert(float,Paid_Amount)))) as Claim_Amount,
IndexOrAAA_Number,
(Select top 1 a.Case_Id FROM  tblCase a WHERE a.Provider_Id =tblcase.Provider_Id  and a.InjuredParty_LastName =tblcase.InjuredParty_LastName
and a.InjuredParty_FirstName = tblcase.InjuredParty_FirstName and  a.Accident_Date =tblcase.Accident_Date  
and a.Case_Id <> tblcase.case_id) AS Similar_To_Case_ID,old_Case_id,
DateDiff(dd,ISNULL(tblcase.Date_Status_Changed,tblcase.Date_Opened),GETDATE()) AS Status_Age,
DateDiff(dd,tblcase.Date_Opened,GETDATE()) AS Case_Age
From tblcase inner join tblprovider on tblcase.provider_id=tblprovider.provider_id 
inner join tblinsurancecompany on tblcase.insurancecompany_id=tblinsurancecompany.insurancecompany_id 
WHERE 1=1 '

			--if @strOldCaseId <> ''
			--begin
   --          set @strsql = @strsql + ' AND old_Case_id Like ''%' + @strOldCaseId + '%'''             
			--end

			if @strCaseId <> ''
			begin
                set @strsql = @strsql + ' AND tblcase.Case_Id Like ''%' + @strCaseId + '%'''             
			end

				if @strOldCaseId <> '' 
			begin
                set @strsql = @strsql + '  AND old_Case_id = ''' + @strOldCaseId + ''''         
			end

					if @Accident_Date <> '' 
			begin
                set @strsql = @strsql + '  AND Accident_Date = ''' + @Accident_Date + ''''         
			end

			--if @strOldCaseId <> '' 
			--begin
   --             set @strsql = @strsql + '  AND old_Case_id Like ''%' + @strOldCaseId + '%'''         
			--end

			if @Status <> '' and @Status <> '0' and @Status <> 'all'
			begin
                set @strsql = @strsql + '  AND STATUS = ''' + @Status + ''''       
			end
			if @InjuredParty_LastName <> '' 
			begin
                set @strsql = @strsql + '  AND InjuredParty_LastName Like ''%' + @InjuredParty_LastName + '%'''         
			end

			if @InjuredParty_FirstName <> '' 
			begin
                set @strsql = @strsql + '  AND InjuredParty_FirstName Like ''%' + @InjuredParty_FirstName + '%'''
			end

			if @InsuredParty_LastName <> '' 
			begin
               set @strsql = @strsql + '  AND InsuredParty_LastName Like ''%' + @InsuredParty_LastName + '%'''
			end

			 
			if @InsuredParty_FirstName <> '' 
			begin
                set @strsql = @strsql + '  AND InsuredParty_FirstName Like ''%' + @InsuredParty_FirstName + '%'''
			end

			if @Policy_Number <> ''
			begin
                set @strsql = @strsql + '  AND Policy_Number= ''' + @Policy_Number + ''''
			end


			if @Ins_Claim_Number <> ''
			begin
               set @strsql = @strsql + '  AND Ins_Claim_Number= ''' + @Ins_Claim_Number + ''''
			end

			if @IndexOrAAA_Number <> ''
			begin 
				set @strsql = @strsql + '  AND IndexOrAAA_Number LIKE ''%' + @IndexOrAAA_Number + '%'''
			end

			if (@Provider_Id <> 0)
			Begin
				set @strsql = @strsql +  ' AND tblcase.Provider_ID = ''' + Convert(VARCHAR,@Provider_Id )+''''
			End 

			If (@InsuranceCompany_Id <> 0) 
			Begin
				set @strsql = @strsql +  ' AND tblcase.InsuranceCompany_Id  = ''' + Convert(VARCHAR,@InsuranceCompany_Id) + ''''
			End
			
			if (@AssignedValue <> 0)
			BEGIN
				set @strsql=@strsql + ' And tblCase.UserId = (Select UserId from issuetracker_users where username=''' + @SZ_USER_ID + ''')'
			END

			if (@DenialReasons_Id <> 0)
			BEGIN
				set @strsql = @strsql + '  AND case_id in (select distinct case_id from tbltreatment where DenialReason_Id ='''+convert(nvarchar(200),@DenialReasons_Id)+'''
											or treatment_id in(select treatment_id from TXN_tblTreatment where DenialReasons_id='''+convert(nvarchar(200),@DenialReasons_Id)+'''))'
			END
			
			--if @PeerDoctor_ID <> '' and @PeerDoctor_ID <> '0'
			--begin
			--	set @strsql = @strsql + '  AND tblcase.case_id in(select distinct (case_id) from tbltreatment where treatment_id in (select TREATMENT_ID from TXN_CASE_PEER_REVIEW_DOCTOR where doctor_id in (select doctor_id from TblReviewingDoctor where doctor_id = ''' + Convert(VARCHAR,@PeerDoctor_ID) + ''')))'
			--end
			 
			SET @strsql = @strsql + ' order by case_autoid desc'	


print @strsql 
exec (@strsql)

end

GO
