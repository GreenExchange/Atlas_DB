USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Get_Scanned_Docs_Tiff]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Scanned_Docs_Tiff]-- 'FH12-97286'
(  
@case_id varchar(50)  
)  
as  
begin  
  
select  Replace(imagepath,'/','\') + '\' + filename as filepath, filename,Document_Type from tblimages img
inner join tbldocumenttype doctype on doctype.Document_ID = img.DocumentId
where case_id = @case_id and deleteflag = 0 --and Document_Type <> 'MISC' 
order by Document_Type,imageid asc
 
end
GO
