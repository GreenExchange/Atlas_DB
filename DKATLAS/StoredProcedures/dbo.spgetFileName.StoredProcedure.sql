USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[spgetFileName]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spgetFileName](  
@getFName varchar(100)  
) as  
begin  
    declare   
 @st nvarchar(1000)  
    set @st = 'Select a.case_id,b.document_type from tblimages a inner join tbldocumenttype b on a.DocumentID = b.Document_ID where a.filename = '''+@getFName+'''' 
    execute sp_executesql @st  
end
GO
