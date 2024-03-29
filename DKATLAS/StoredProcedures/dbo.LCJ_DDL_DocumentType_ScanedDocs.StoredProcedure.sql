USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_DocumentType_ScanedDocs]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_DocumentType_ScanedDocs] --[LCJ_DDL_DocumentType_ScanedDocs] 'Fh07-42372','10'
(  
   @Case_ID nvarchar(50),
   @Doc_Id nvarchar(50)
)  
as  
begin 
select Document_Id,FileName,ImageId, imagepath+'/'+filename as File_Path,Document_type from tblDocumentType inner join tblimages
on tblDocumentType.Document_Id=tblimages.DocumentId
where case_id=@Case_ID and Document_Id=@Doc_Id and fileName not like '%.htm'
order by imageid--and upper(FileName) not like '%.PDF%'
end
GO
