USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_CASE_TYPE]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MST_CASE_TYPE]  -- '' ,'CASESTATUS_LIST' 
@ID     NVARCHAR(20)=NULL,    
@FLAG    VARCHAR(50)     
AS
BEGIN    
		IF @FLAG='CASETYPE_LIST'    
		BEGIN     
			SELECT  ID [CODE],      
					Name [DESCRIPTION]     
			FROM tblCaseStatus    
			ORDER BY Name,ID ASC    
		END    
END
GO
