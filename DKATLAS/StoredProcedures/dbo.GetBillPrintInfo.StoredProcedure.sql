USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[GetBillPrintInfo]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBillPrintInfo]--'01/01/2010','09/09/2010','Date_Opened','Billed'
(  
@dt1 varchar(50),  
@dt2 varchar(50),  
@printtype varchar(100),  
@status varchar(50)  
)  
as  
begin  
declare  
@st varchar(MAX)  
  
  set @st = 'select 
				CASE_ID,
				Injuredparty_name,
				Provider_name,
				Insurancecompany_name,
				Ins_Claim_Number,
				(select isnull(CONVERT(NVARCHAR(12),min(DateOfService_Start),101),'''') from tbltreatment where case_id=lcj_vw_casesearchdetails.case_id) as DOS_Start, 
				(select isnull(CONVERT(NVARCHAR(12),max(DateOfService_End),101),'''') from tbltreatment where case_id=lcj_vw_casesearchdetails.case_id) as DOS_End, 
				ISNULL(CONVERT(NVARCHAR(12),Accident_Date,101),'''') as Accident_Date, 
				isnull(claim_amount,0.00) as claim_amount,
				InsuranceCompany_Perm_Address As InsuranceCompany_Address,
				InsuranceCompany_Perm_City As InsuranceCompany_City,
				InsuranceCompany_Perm_State As InsuranceCompany_State,
				InsuranceCompany_Perm_Zip As InsuranceCompany_Zip
			from lcj_vw_casesearchdetails where   
			CAST(FLOOR(CAST(' + @printtype + ' AS FLOAT))AS DATETIME) >= Replace(''' + @dt1 + ''',''/'',''-'') and  
			CAST(FLOOR(CAST('+@printtype+' AS FLOAT))AS DATETIME) <= Replace(''' + @dt2+''',''/'',''-'') '  
  if @status <> 'ALL'  
  set @st = @st + ' and status = ''' + @status + ''' order by case_id'  
  else  
  set @st = @st + '  order by case_id'  
  print @st  
  execute(@st)
end
GO
