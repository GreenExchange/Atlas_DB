USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[providerinslist]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[providerinslist](
@provider_id varchar(50)
)
as
select insurancecompany_name,insurancecompany_id,count(*) as [count] from lcj_vw_casesearchdetails where provider_id = @provider_id group by insurancecompany_name,insurancecompany_id order by insurancecompany_name
GO
