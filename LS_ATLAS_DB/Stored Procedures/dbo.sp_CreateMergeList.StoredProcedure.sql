USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateMergeList]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CreateMergeList](
@idList nvarchar(4000)
)
as
begin
declare
@sq nvarchar(4000)

set @sq = 'select ImagePath + ''\'' + FileName as [FilePath],documentId from tblimages where ImageId in (' + @idList + ')'
--print @sq

exec sp_executesql @sq
end

GO
