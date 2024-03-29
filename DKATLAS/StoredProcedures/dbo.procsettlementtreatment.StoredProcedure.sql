USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[procsettlementtreatment]    Script Date: 6/17/2019 2:54:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procsettlementtreatment] (
@insid varchar(20),
@dt1 varchar(20),
@dt2 varchar(20),
@userid varchar(100)
)
as
begin
SET NOCOUNT ON
declare
@cnt int,
@caseid varchar(20)

set @cnt = 0
create table #temp(
		case_id varchar(50),
		InjuredParty_Name varchar(100),
		Provider_Name varchar(100),
		InsuranceCompany_Name varchar(100),
		Claim_Amount money,
		user_id varchar(50),
		Settlement_Amount money,
		Settlement_Int money,
		Settlement_AF money,
		Settlement_FF money,
		Settlement_Date datetime)

declare mycur cursor local for
select distinct  case_id from LCJ_VW_CaseSearchDetails 
where InsuranceCompany_id=@insid 
and CAST(FLOOR(CAST(settlement_date AS FLOAT))AS DATETIME) >= @dt1 
and CAST(FLOOR(CAST(settlement_date AS FLOAT))AS DATETIME) <= @dt2 
and User_id=@userid 
order by case_id
open mycur
fetch next from mycur into @caseid
while @@fetch_status=0
begin


select @cnt = count(*) from tbltreatment where case_id=@caseid

if @cnt > 0
begin
insert into #temp 
select a.case_id,a.injuredparty_name,a.provider_name,a.insurancecompany_name,
(b.claim_amount-b.paid_amount) as claimamount,@userid,
a.settlement_amount,a.settlement_int,
a.settlement_af,a.settlement_ff,settlement_date
from lcj_vw_Casesearchdetails a inner join tbltreatment b on a.treatment_id=b.treatment_id
where InsuranceCompany_id=@insid and b.treatment_id > 0 
and CAST(FLOOR(CAST(settlement_date AS FLOAT))AS DATETIME) >= @dt1 
and CAST(FLOOR(CAST(settlement_date AS FLOAT))AS DATETIME) <= @dt2 
and User_id=@userid 

end
else
begin
insert into #temp 
select a.case_id,a.injuredparty_name,a.provider_name,a.insurancecompany_name,
(convert(money,a.claim_amount)-convert(money,a.paid_amount)) as claimamount,@userid,
a.settlement_amount,a.settlement_int,
a.settlement_af,a.settlement_ff,settlement_date
from LCJ_VW_CaseSearchDetails a 
where InsuranceCompany_id=@insid 
and CAST(FLOOR(CAST(settlement_date AS FLOAT))AS DATETIME) >= @dt1 
and CAST(FLOOR(CAST(settlement_date AS FLOAT))AS DATETIME) <= @dt2 
and User_id=@userid 
end
fetch next from mycur into @caseid
end
deallocate mycur
select distinct * from #temp where claim_amount > 0 order by case_id
drop table #temp
end
GO
