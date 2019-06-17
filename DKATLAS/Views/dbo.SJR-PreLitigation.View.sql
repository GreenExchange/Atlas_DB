USE [DKATLAS]
GO
/****** Object:  View [dbo].[SJR-PreLitigation]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SJR-PreLitigation]
AS
select distinct (case_id) as case_id, provider_id,(CONVERT(money, Claim_Amount)) as claim_amount,(CONVERT(money, Fee_Schedule)) as Fee_Schedule ,max(paid_amount)as Voluntary_Paid_Amount ,
 date_opened,
 transactions_date
from [vw_precollected] 
group by date_opened ,case_id, claim_amount,provider_id,transactions_date,Fee_Schedule

--select count(distinct (case_id))case_count, provider_id,sum(transactions_amount)as Voluntary_Paid_Amount ,(CONVERT(money, Claim_Amount)) as claim_amount , date_opened
--from [SJR-PreCollected] 
--group by date_opened ,case_id, claim_amount,provider_id
GO
