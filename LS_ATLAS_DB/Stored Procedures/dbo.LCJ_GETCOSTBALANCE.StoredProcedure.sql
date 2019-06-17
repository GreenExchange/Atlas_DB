USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GETCOSTBALANCE]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GETCOSTBALANCE]
(@DomainId NVARCHAR(50),
@var varchar(50))
as
begin
if @var <> 'all'
select * from tblprovider where provider_name like ''+@var + '%' and DomainId=@DomainId order by provider_name
else
select * from tblprovider WHERE DomainId=@DomainId  order by provider_name
end

GO
