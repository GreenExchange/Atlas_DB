USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_MST_DOCUMENT_NODES]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_INSERT_MST_DOCUMENT_NODES]   
(  
	 @NodeID   int    =NULL,    
	 @ParentID  int    =NULL,    
	 @NodeName  nvarchar(300) =NULL,    
	 @NodeLevel  int    =NULL,    
	 @Expanded  bit    =NULL,    
	 @FriendlyName nvarchar(300) =NULL,    
	 @FLAG   nvarchar(50) ='NODELIST'   
)  
AS    
BEGIN    
	IF @FLAG='ADD'    
	  BEGIN    
		  INSERT INTO MST_DOCUMENT_NODES    
		  (     
			 ParentID,     
			 NodeName,   
			 NodeLevel,     
			 Expanded,    
			 FriendlyName    
		  )    
		  VALUES    
		  (      
			 @ParentID,     
			 @NodeName,         
			 @NodeLevel,     
			 @Expanded,    
			 @FriendlyName        
		  )    
	  END    
    
	ELSE IF @FLAG='NODELIST'    
		BEGIN    
			SELECT 
				0[CODE],' --Select-- '[DESCRIPTION]     
			UNION    
			SELECT 
				NodeID[CODE],    FRIENDLYNAME[DESCRIPTION] 
			FROM 
				MST_DOCUMENT_NODES    
			ORDER BY 
				[DESCRIPTION]			
		END    
    
	ELSE IF @FLAG='TREENODELIST'    
		BEGIN    
			SELECT 
				NodeID, NodeName ,    
				(SELECT COUNT(*) FROM MST_DOCUMENT_NODES WHERE PARENTID=@PARENTID)[COUNT]    
			FROM 
				MST_DOCUMENT_NODES    
			WHERE 
				ParentID=@ParentID 
			ORDER BY
				NodeName   
		END    
    
	ELSE IF @FLAG='GETROOTNODE'    
		BEGIN    
			SELECT 
				0[NodeID],'DOCUMENT MANAGER'[NodeName],(SELECT COUNT(*) 
			FROM 
				MST_DOCUMENT_NODES 
			WHERE 
				PARENTID=0)[COUNT]       
		END    
    
	ELSE IF @FLAG='GETNODEFORDELETE'    
		BEGIN    
			SELECT 
				NodeID[CODE],    FRIENDLYNAME[DESCRIPTION] 
			FROM 
				MST_DOCUMENT_NODES  ORDER BY [DESCRIPTION]
		END    
	ELSE IF @FLAG='DELETE'    
		BEGIN    
			IF EXISTS (SELECT NODEID FROM MST_DOCUMENT_NODES WHERE PARENTID=@NodeID)  
				BEGIN    
					DELETE 
					FROM 
						MST_DOCUMENT_NODES     
					WHERE 
						PARENTID=@NodeID     
      
					DELETE 
					FROM 
						MST_DOCUMENT_NODES     
					WHERE 
						NODEID=@NodeID       
				END    
			ELSE    
				BEGIN    
					DELETE 
					FROM 
						MST_DOCUMENT_NODES     
					WHERE 
						NODEID=@NodeID     
				END    
		END   
END

GO
