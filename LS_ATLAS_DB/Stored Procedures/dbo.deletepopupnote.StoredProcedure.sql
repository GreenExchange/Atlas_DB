USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[deletepopupnote]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deletepopupnote](
@nid int
)
as
begin

delete from tblnotes where notes_id=@nid

end

GO
