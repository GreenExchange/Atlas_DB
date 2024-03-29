USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[fixCosts]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[fixCosts]
(
@DomainId NVARCHAR(50),
@var varchar(10)
)
as
begin
select distinct b.provider_name,a.case_id,insurancecompany_name,
(select sum(transactions_amount) from tbltransactions c where transactions_type='exp' and c.case_id=a.case_id and DomainId=@DomainId) as exp,
(select sum(transactions_amount) from tbltransactions c where transactions_type='ffb' and c.case_id=a.case_id and DomainId=@DomainId) as ffb,
(select sum(transactions_amount) from tbltransactions d where transactions_type='ffc' and d.case_id=a.case_id and DomainId=@DomainId) as ffc,
(select sum(transactions_amount) from tbltransactions e where transactions_type='fFrec' and e.case_id=a.case_id and DomainId=@DomainId) as ffrec
from tbltransactions a inner join lcj_VW_casesearchdetails b on a.CASE_id=b.CASE_id
where provider_name like ''+@var + '%' and a.DomainId=@DomainId order by provider_name
end

GO
