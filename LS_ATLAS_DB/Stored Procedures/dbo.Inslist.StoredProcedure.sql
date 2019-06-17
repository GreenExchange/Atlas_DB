USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Inslist]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Inslist](
@provider_id varchar(50),
@InsuranceCompany_Id varchar(50)
)
as
select case_id,injuredparty_name,provider_name,insurancecompany_name,
ins_claim_number,accident_date,dateofservice_start,dateofservice_end,
indexoraaa_number,status,
claim_amount from lcj_vw_casesearchdetails where provider_id=@provider_id and InsuranceCompany_Id=@InsuranceCompany_Id

GO
