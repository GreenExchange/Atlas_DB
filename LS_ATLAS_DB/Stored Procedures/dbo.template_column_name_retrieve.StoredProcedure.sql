USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[template_column_name_retrieve]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[template_column_name_retrieve]    
AS    
BEGIN    
SET NOCOUNT ON    
 SELECT    
   *     
 FROM           
   tbl_template_column    
 ORDER BY     
   column_name ASC    
 SET NOCOUNT OFF      
END
GO
