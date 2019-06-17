USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GETCOSTBALANCE]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GETCOSTBALANCE]
(@var varchar(50))
as
begin
if @var <> 'all'
select * from tblprovider where provider_name like ''+@var + '%' order by provider_name
else
select * from tblprovider order by provider_name
end
GO
