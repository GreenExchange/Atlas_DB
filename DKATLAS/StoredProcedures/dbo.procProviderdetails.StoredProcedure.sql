USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[procProviderdetails]    Script Date: 6/17/2019 2:54:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procProviderdetails] (
@clid nvarchar(100)
)
as
select * from tblprovider where provider_id=@clid
GO
