USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[procSettlementIdReport]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procSettlementIdReport]
(
@pid varchar(50),
@setyear int,
@setmonth int
)
as
begin
declare
@cnt int,
@cid varchar(50)
set @cnt = 0

SET NOCOUNT ON
create table #temp (case_id varchar(50),claimamt money,paidamt money )
declare mycur cursor local for
select distinct case_id from lcj_vw_casesearchdetails where provider_id=@pid and settlement_amount > 0 
and year(settlement_date)=@setyear and month(settlement_date)=@setmonth
open mycur
fetch next from mycur into @cid
while @@fetch_status=0
begin


select @cnt = count(*) from tbltreatment where case_id=@cid
if @cnt > 0
begin
insert into #temp
select case_id,sum(claim_amount),sum(paid_Amount) from tbltreatment where case_id=@cid group by case_id
end
else
begin
insert into #temp
select case_id,claim_amount,paid_Amount from tblcase where case_id=@cid
end

set @cnt = 0

fetch next from mycur into @cid
end 


select s.case_id,SUM(Settlement_Amount) as Settlement_Amount,
SUM(Settlement_Int) as Settlement_Int,SUM(Settlement_FF) as Settlement_FF,SUM(Settlement_AF) as Settlement_AF,
SUM(Settlement_Total) as Settlement_Total,
(select top 1 InjuredParty_Name from lcj_vw_casesearchdetails where case_id=s.case_id) as InjuredParty_Name,
(select top 1 Provider_Name from lcj_vw_casesearchdetails where case_id=s.case_id) as Provider_Name,
(select top 1 InsuranceCompany_Name from lcj_vw_casesearchdetails where case_id=s.case_id) as InsuranceCompany_Name,
(select c.claimamt - c.paidamt from #temp c where c.case_id=s.case_id) as Claim_Amount,
(select top 1 User_Id from lcj_vw_casesearchdetails where case_id=s.case_id) as User_Id,
(select top 1 Settlement_Date from lcj_vw_casesearchdetails where case_id=s.case_id) as Settlement_Date,
(select top 1 Settlement_Notes from lcj_vw_casesearchdetails  where case_id=s.case_id) as 
Settlement_Notes  from lcj_vw_casesearchdetails s where provider_id=@pid and settlement_amount > 0 
and year(settlement_date)=@setyear and month(settlement_date)=@setmonth group by s.case_id order by settlement_date asc

drop table #temp

end

GO
