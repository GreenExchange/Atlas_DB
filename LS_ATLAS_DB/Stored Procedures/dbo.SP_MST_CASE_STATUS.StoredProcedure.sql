USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_MST_CASE_STATUS]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MST_CASE_STATUS]    
@ID     NVARCHAR(20)=NULL,    
@FLAG    VARCHAR(50)     
AS    
BEGIN    
		IF @FLAG='CASESTATUS_LIST'    
		BEGIN     
			SELECT  Status_Type [CODE],      
					Status_Type [DESCRIPTION]     
			FROM tblStatus    
			ORDER BY Status_Type ASC
		END    
END

GO
