USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_DocumentType]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_DocumentType] --LCJ_DDL_DocumentType 'Fh07-42372'
(  
   @Case_ID NVARCHAR(50) 
)  
as  
BEGIN  
SELECT '....SELECT Doc Types....' AS Document_Type,0 AS Document_ID
UNION 
SELECT distinct Document_Type,Document_ID FROM tblDocumentType 
inner join tblimages on tblDocumentType.Document_Id=tblimages.DocumentId
WHERE case_id = @Case_ID and  imageid not in (SELECT imageid FROM tblimages WHERE case_id =@Case_ID and fileName like '%.htm')
ORDER BY Document_Type
END
GO
