USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[providerstatuslist]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[providerstatuslist](
@provider_id varchar(50)
)
as
select status,count(*) as [count] from lcj_vw_casesearchdetails where provider_id = @provider_id group by status order by status

GO
