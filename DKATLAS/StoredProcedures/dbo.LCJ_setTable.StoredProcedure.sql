USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_setTable]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_setTable] 
(
@case_id varchar(50)
)
as
begin
select a.case_id,b.treatment_id,b.dateofservice_start,b.dateofservice_end,
b.claim_amount,b.paid_amount,a.settlement_amount,a.settlement_int,a.settlement_af,a.settlement_ff,
a.settlement_date,a.settlement_total,a.user_id
from tblsettlements a inner join tbltreatment b on
a.treatment_id=b.treatment_id where a.case_id=@case_id
end
GO
