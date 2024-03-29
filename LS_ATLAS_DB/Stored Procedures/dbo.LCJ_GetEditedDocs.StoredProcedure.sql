USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetEditedDocs]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GetEditedDocs]
(
@Case_id varchar(50)
)
as 
begin
Select TG.NodeID[Node Id],TD.Filename [File Name],TD.ImageID[Image Id] from tblTags TG 
join tblImageTag TT on TG.NodeId=TT.TagID 
join tblDocImages TD on TD.ImageID=TT.ImageID
where TG.NodeType='SVDLET' and CaseID=@Case_Id Order By Td.ImageID
end

GO
