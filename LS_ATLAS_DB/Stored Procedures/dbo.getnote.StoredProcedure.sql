USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[getnote]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getnote](
@cid varchar(50)
)
as
begin
select * from tblnotes where case_id=@cid
end

GO
