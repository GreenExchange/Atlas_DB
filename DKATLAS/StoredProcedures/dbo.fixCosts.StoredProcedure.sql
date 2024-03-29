USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[fixCosts]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[fixCosts]
(
@var varchar(10)
)
as
begin
select distinct b.provider_name,a.case_id,insurancecompany_name,
(select sum(transactions_amount) from tbltransactions c where transactions_type='exp' and c.case_id=a.case_id) as exp,
(select sum(transactions_amount) from tbltransactions c where transactions_type='ffb' and c.case_id=a.case_id) as ffb,
(select sum(transactions_amount) from tbltransactions d where transactions_type='ffc' and d.case_id=a.case_id) as ffc,
(select sum(transactions_amount) from tbltransactions e where transactions_type='fFrec' and e.case_id=a.case_id) as ffrec
from tbltransactions a inner join lcj_VW_casesearchdetails b on a.CASE_id=b.CASE_id
where provider_name like ''+@var + '%' order by provider_name
end
GO
