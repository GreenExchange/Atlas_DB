USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_insertsettlement]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_insertsettlement]
@case_id varchar(200)
as
begin

select sum(settlement_amount)as settlement_amount,
sum(settlement_int)as settlement_int,sum(settlement_af)as settlement_af,
sum(settlement_ff)as settlement_ff,sum(settlement_total)as settlement_total
from tblsettlements where case_id =@case_id
end

GO
