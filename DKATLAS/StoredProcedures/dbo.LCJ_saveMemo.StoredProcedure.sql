USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_saveMemo]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_saveMemo](
@cid varchar(50),
@Memo nvarchar(3000)
)
as
begin
update tblcase set Memo = @Memo where case_id=@cid
end
GO
