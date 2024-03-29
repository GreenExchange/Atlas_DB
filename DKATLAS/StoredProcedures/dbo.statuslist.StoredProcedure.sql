USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[statuslist]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[statuslist](
@provider_id varchar(50),
@status varchar(50)
)
as
select case_id,injuredparty_name,provider_name,insurancecompany_name,
ins_claim_number,accident_date,dateofservice_start,dateofservice_end,
indexoraaa_number,status,
claim_amount from lcj_vw_casesearchdetails where provider_id=@provider_id and status=@status
GO
