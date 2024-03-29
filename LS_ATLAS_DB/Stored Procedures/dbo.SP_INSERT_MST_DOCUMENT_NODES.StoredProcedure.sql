USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_INSERT_MST_DOCUMENT_NODES]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_INSERT_MST_DOCUMENT_NODES]  -- 0, 15,'50259944',2,0,'FFF33','ADD',3,'PRIYA'
(    
  @NodeID		INT				=NULL,      
  @ParentID		INT				=NULL,      
  @NodeName		NVARCHAR(300)	=NULL,      
  @NodeLevel	INT				=NULL,      
  @Expanded		BIT				=NULL,      
  @FriendlyName NVARCHAR(300)	=NULL,      
  @FLAG			NVARCHAR(50)	='NODELIST',
  @UserID		INT				=NULL,
   @DomainId varchar(50)
)
AS      
BEGIN
		DECLARE @i_l_node_id			BIGINT				=	NULL
		DECLARE @i_l_caseid				VARCHAR(MAX)	=	''
		DECLARE @i_l_parent_id			BIGINT			=	NULL
		DECLARE @i_l_fk_master_node_id	INT				=	NULL
		DECLARE @pk_nodes_log_id		BIGINT			=	NULL

		IF @FLAG='ADD'
		BEGIN
			
			IF EXISTS(SELECT 1 FROM MST_DOCUMENT_NODES WHERE LOWER(NodeName) = LOWER(@NodeName) AND ParentID = @ParentID AND DomainId = @DomainId)
			BEGIN				
				SELECT 'Cannot Add, node name already exists...!!' AS message
				RETURN
			END
			
			INSERT INTO  MST_DOCUMENT_NODES      
			(       
				ParentID,       
				NodeName,     
				NodeLevel,       
				Expanded,      
				FriendlyName,
				DomainId
			)      
			VALUES      
			(        
				@ParentID,       
				@NodeName,           
				@NodeLevel,       
				@Expanded,      
				@FriendlyName,
				@DomainId
			)
			
			SET @i_l_node_id = SCOPE_IDENTITY()
			SELECT @i_l_node_id
			--INSERT INTO mst_document_nodes_log
			--(
			--	fk_node_id,
			--	parent_id,
			--	node_name,
			--	node_level,
			--	expanded,
			--	friendly_name,
			--	business_type,
			--	log_type,
			--	fk_log_user_id,
			--	log_date
			--)
			--SELECT
			--	NodeID,
			--	ParentID,       
			--	NodeName,     
			--	NodeLevel,       
			--	Expanded,      
			--	FriendlyName,
			--	business_type,
			--	'ADD',
			--	@UserID,
			--	GETDATE()
			--FROM
			--	MST_DOCUMENT_NODES
			--WHERE
			--	NodeID = @i_l_node_id

			--CREATE TABLE #TEMP_TBLTAGS_CASES
			--(
			--	CaseID		VARCHAR(MAX)
			--)
					
			--INSERT INTO #TEMP_TBLTAGS_CASES
			--SELECT    
			--	CaseID
			--FROM
			--	tblTags
			--	JOIN tblcase C ON CAST(Case_Id AS VARCHAR(MAX)) = CaseID    
			--WHERE
			--	C.DomainId=@DomainId and
			--	ParentID		IS NULL AND
			--	CaseID			<>	'0'
	  --     select *from #TEMP_TBLTAGS_CASES
			--DECLARE NODE_CURSOR_NEW CURSOR FOR
			--	SELECT
			--		CaseID
			--	FROM
			--		#TEMP_TBLTAGS_CASES
			--OPEN NODE_CURSOR_NEW          
			--FETCH NEXT FROM NODE_CURSOR_NEW INTO @i_l_caseid            
			--WHILE @@FETCH_STATUS = 0          
			--BEGIN
			--		IF EXISTS(SELECT NodeID FROM tblTags WHERE CaseID = CAST(@i_l_caseid AS VARCHAR(MAX)) AND fk_master_node_id = @ParentID)
			--		BEGIN
			--			IF(@NodeName = (SELECT TOP 1 NodeName FROM tblTags WHERE CaseID = CAST(@i_l_caseid AS VARCHAR(MAX)) AND fk_master_node_id IS NULL AND NodeName = @NodeName AND DomainId = @DomainId))
			--			BEGIN
			--				IF(@ParentID = (SELECT TOP 1 fk_master_node_id FROM tblTags WHERE NodeID = (SELECT TOP 1 ParentID FROM tblTags WHERE CaseID = CAST(@i_l_caseid AS VARCHAR(MAX)) AND fk_master_node_id IS NULL AND NodeName = @NodeName AND DomainId = @DomainId)))
			--				BEGIN
			--				PRINT 'UP'								
			--					UPDATE
			--						tblTags
			--					SET
			--						fk_master_node_id = @i_l_node_id
			--					WHERE
			--						CaseID	=	@i_l_caseid AND
			--						NodeID	=	(SELECT TOP 1 NodeID FROM tblTags WHERE CaseID = CAST(@i_l_caseid AS VARCHAR(MAX)) AND fk_master_node_id IS NULL AND NodeName = @NodeName AND DomainId = @DomainId)
			--				END
			--				ELSE
			--				BEGIN
			--					SELECT TOP 1 @i_l_parent_id = NodeID FROM tblTags WHERE CaseID = CAST(@i_l_caseid AS VARCHAR(MAX)) AND fk_master_node_id = @ParentID
			--			 PRINT 'INS5'
			--					INSERT INTO tblTags
			--					(  
			--						NodeName,Expanded,ParentID,CaseID,NodeLevel,fk_master_node_id
			--					)         
			--					VALUES
			--					(  
			--						@NodeName,0,@i_l_parent_id,CAST(@i_l_caseid AS VARCHAR(MAX)),2,@i_l_node_id
			--					)
			--				END
			--			END
			--			ELSE
			--			BEGIN
			--				SELECT TOP 1 @i_l_parent_id = NodeID FROM tblTags WHERE CaseID = CAST(@i_l_caseid AS VARCHAR(MAX)) AND fk_master_node_id = @ParentID
			--			 PRINT 'INS'
			--				INSERT INTO tblTags
			--				(  
			--					NodeName,Expanded,ParentID,CaseID,NodeLevel,fk_master_node_id
			--				)         
			--				VALUES
			--				(  
			--					@NodeName,0,@i_l_parent_id,CAST(@i_l_caseid AS VARCHAR(MAX)),2,@i_l_node_id
			--				)
			--			END
			--		END
			--		ELSE
			--		BEGIN
			--			IF(@NodeName = (SELECT TOP 1 NodeName FROM tblTags WHERE CaseID = CAST(@i_l_caseid AS VARCHAR(MAX)) AND fk_master_node_id IS NULL AND NodeName = @NodeName AND DomainId = @DomainId))
			--			BEGIN
			--				IF(@ParentID = (SELECT TOP 1 fk_master_node_id FROM tblTags WHERE NodeID = (SELECT TOP 1 ParentID FROM tblTags WHERE CaseID = CAST(@i_l_caseid AS VARCHAR(MAX)) AND fk_master_node_id IS NULL AND NodeName = @NodeName AND DomainId = @DomainId)))
			--				BEGIN
			--				 PRINT 'INS2'
			--					SELECT TOP 1 @i_l_parent_id = NodeID FROM tblTags WHERE CaseID = CAST(@i_l_caseid AS VARCHAR(MAX)) AND fk_master_node_id = @ParentID
			--					UPDATE
			--						tblTags
			--					SET
			--						fk_master_node_id = @i_l_parent_id
			--					WHERE
			--						CaseID	=	@i_l_caseid AND
			--						NodeID	=	(SELECT TOP 1 NodeID FROM tblTags WHERE CaseID = CAST(@i_l_caseid AS VARCHAR(MAX)) AND fk_master_node_id IS NULL AND NodeName = @NodeName AND DomainId = @DomainId)
			--				END
			--				ELSE
			--				BEGIN
			--					SELECT TOP 1 @i_l_parent_id = NodeID FROM tblTags WHERE CaseID = CAST(@i_l_caseid AS VARCHAR(MAX)) AND ParentID IS NULL
			--				PRINT 'INS22'
			--					INSERT INTO tblTags
			--					(  
			--						NodeName,Expanded,ParentID,CaseID,NodeLevel,fk_master_node_id
			--					)         
			--					VALUES
			--					(  
			--						@NodeName,0,@i_l_parent_id,CAST(@i_l_caseid AS VARCHAR(MAX)),2,@i_l_node_id
			--					)
			--				END
			--			END
			--			ELSE
			--			BEGIN
			--				SELECT TOP 1 @i_l_parent_id = NodeID FROM tblTags WHERE CaseID = CAST(@i_l_caseid AS VARCHAR(MAX)) AND ParentID IS NULL
			--				 PRINT 'INS3'
			--				 SELECT @i_l_node_id
			--				INSERT INTO tblTags
			--				(  
			--					NodeName,Expanded,ParentID,CaseID,NodeLevel,fk_master_node_id
			--				)         
			--				VALUES
			--				(  
			--					@NodeName,0,@i_l_parent_id,CAST(@i_l_caseid AS VARCHAR(MAX)),2,@i_l_node_id
			--				)
			--			END
			--		END
						        
			--	FETCH NEXT FROM NODE_CURSOR_NEW INTO @i_l_caseid       
			--END
			--CLOSE NODE_CURSOR_NEW
			--DEALLOCATE NODE_CURSOR_NEW

			--DROP TABLE #TEMP_TBLTAGS_CASES

			INSERT INTO tblTags(CaseID,ParentID,NodeName,NodeLevel,Expanded,DomainId )
			SELECT Distinct CaseID,MIN(NodeID),@NodeName,'1','0',@DomainID FROM tblTags
			WHERE CaseID NOT IN (SELECT distinct CaseID FROM tblTags WHERE NodeName=@NodeName and DomainId =@DomainID)
			AND ParentID is null
			and DomainId =@DomainID
			GROUP BY CaseID

			SELECT 'Node added successfully...!!' AS message
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
			WHERE
				DomainId	=	@DomainId
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
				ParentID		=	@ParentID AND
DomainId	=	@DomainId
		   ORDER BY  
				NodeName     
		END
		ELSE IF @FLAG='GETROOTNODE'      
		BEGIN
		   SELECT   
				0[NodeID],'DOCUMENT MANAGER'[NodeName],
				(SELECT COUNT(*) FROM MST_DOCUMENT_NODES WHERE DomainId	=	@DomainId and PARENTID=0) [COUNT]         
		END  
		ELSE IF @FLAG='GETNODEFORDELETE'
		BEGIN
		   SELECT   
				NodeID [CODE],
				ParentID [PARENTID],
				NodeName [NODENAME],
				FRIENDLYNAME [DESCRIPTION]  
		   FROM
				MST_DOCUMENT_NODES
			WHERE 
				DomainId	=	@DomainId
			ORDER BY NodeName  
		END
		ELSE IF @FLAG='DELETE'      
		BEGIN      
			IF EXISTS (SELECT NODEID FROM MST_DOCUMENT_NODES WHERE PARENTID=@NodeID AND DomainId	=	@DomainId)    
			BEGIN
				
				CREATE TABLE #TEMP_NODE_LIST
				(
					NodeID INT
				)

				;WITH subnode_tree AS
				(
					SELECT
						NodeID,ParentID,NodeName
					FROM 
						MST_DOCUMENT_NODES
					WHERE 
						NodeID = @NODEID 
					UNION ALL
					SELECT 
						C.NodeID AS NodeID, C.ParentID,c.NodeName
					FROM 
						MST_DOCUMENT_NODES c
						JOIN subnode_tree p ON C.ParentID = P.NodeID
				)
				
				INSERT INTO #TEMP_NODE_LIST
				SELECT NodeID FROM subnode_tree OPTION (MAXRECURSION 0)				
				
				DECLARE NODE_CURSOR_NEW CURSOR FOR          
					SELECT
						NodeID
					FROM
						#TEMP_NODE_LIST
					ORDER BY
						NodeID ASC
				OPEN NODE_CURSOR_NEW          
				FETCH NEXT FROM NODE_CURSOR_NEW INTO @i_l_fk_master_node_id            
				WHILE @@FETCH_STATUS = 0          
				BEGIN
				--		SET @pk_nodes_log_id = NULL

				--		INSERT INTO mst_document_nodes_log
				--		(
				--			fk_node_id,
				--			parent_id,
				--			node_name,
				--			node_level,
				--			expanded,
				--			friendly_name,
				--			business_type,
				--			log_type,
				--			fk_log_user_id,
				--			log_date
				--		)
				--		SELECT
				--			NodeID,
				--			ParentID,       
				--			NodeName,     
				--			NodeLevel,       
				--			Expanded,      
				--			FriendlyName,							
				--			'DELETE',
				--			@UserID,
				--			GETDATE()
				--		FROM
				--			MST_DOCUMENT_NODES
				--		WHERE
				--			NodeID = @i_l_fk_master_node_id

				--		SET @pk_nodes_log_id = SCOPE_IDENTITY()

				--		INSERT INTO tbltags_log
				--		(
				--			NodeID,			
				--			ParentID,
				--			NodeName,		
				--			CaseID,	
				--			DocTypeID,
				--			NodeIcon,	
				--			NodeLevel,
				--			Expanded,
				--			NodeType,	
				--			CaseType,
				--			fk_master_node_id,
				--			fk_nodes_log_id
				--		)
				--		SELECT
				--			NodeID,			
				--			ParentID,
				--			NodeName,		
				--			CaseID,	
				--			DocTypeID,
				--			NodeIcon,	
				--			NodeLevel,
				--			Expanded,
				--			NodeType,	
				--			CaseType,
				--			fk_master_node_id,
				--			@pk_nodes_log_id
				--		FROM
				--			tblTags
				--		WHERE
				--			fk_master_node_id = @i_l_fk_master_node_id

				--		INSERT INTO tblimagetag_log
				--		(
				--			ImageID,
				--			TagID,
				--			LoginID,
				--			DateInserted,
				--			DateModified
				--		)
				--		SELECT
				--			ImageID,
				--			TagID,
				--			LoginID,
				--			DateInserted,
				--			DateModified
				--		FROM
				--			tblImageTag
				--		WHERE
				--			 TagID IN (SELECT NodeID FROM tblTags WHERE fk_master_node_id = @i_l_fk_master_node_id)

				--		INSERT INTO tbldocimages_log
				--		(
				--			ImageID,
				--			Filename,
				--			FilePath,
				--			OCRData,
				--			Status,
				--			is_saga_doc,
				--			nodeid,
				--			createduser,
				--			Revisededuser,
				--			createddate,
				--			Revisededdate,
				--			from_flag,
				--			description,
				--			DOCUMENTID,
				--			fk_tag_id
				--		)
				--		SELECT
				--			ImageID,
				--			Filename,
				--			FilePath,
				--			OCRData,
				--			Status,
				--			is_saga_doc,
				--			nodeid,
				--			createduser,
				--			Revisededuser,
				--			createddate,
				--			Revisededdate,
				--			from_flag,
				--			description,
				--			DOCUMENTID,
				--			fk_tag_id
				--		FROM
				--			tblDocImages
				--		WHERE
				--			ImageID IN (SELECT ImageID FROM tblImageTag WHERE TagID IN (SELECT NodeID FROM tblTags WHERE fk_master_node_id = @i_l_fk_master_node_id))


				--		DELETE FROM tblDocImages WHERE ImageID IN (SELECT ImageID FROM tblImageTag WHERE TagID IN (SELECT NodeID FROM tblTags WHERE fk_master_node_id = @i_l_fk_master_node_id))
				--		DELETE FROM tblImageTag WHERE TagID IN (SELECT NodeID FROM tblTags WHERE fk_master_node_id = @i_l_fk_master_node_id)
						--DELETE FROM tblTags WHERE fk_master_node_id = @i_l_fk_master_node_id
						        
					FETCH NEXT FROM NODE_CURSOR_NEW INTO @i_l_fk_master_node_id       
				END
				CLOSE NODE_CURSOR_NEW
				DEALLOCATE NODE_CURSOR_NEW
								
				DELETE FROM MST_DOCUMENT_NODES WHERE NODEID IN (SELECT NodeID FROM #TEMP_NODE_LIST)

				DROP TABLE #TEMP_NODE_LIST
			END      
			ELSE      
			BEGIN				
				--INSERT INTO mst_document_nodes_log
				--(
				--	fk_node_id,
				--	parent_id,
				--	node_name,
				--	node_level,
				--	expanded,
				--	friendly_name,
				--	business_type,
				--	log_type,
				--	fk_log_user_id,
				--	log_date
				--)
				--SELECT
				--	NodeID,
				--	ParentID,       
				--	NodeName,     
				--	NodeLevel,       
				--	Expanded,      
				--	FriendlyName,
				--	business_type,
				--	'DELETE',
				--	@UserID,
				--	GETDATE()
				--FROM
				--	MST_DOCUMENT_NODES
				--WHERE
				--	NodeID = @NodeID

				--SET @pk_nodes_log_id = SCOPE_IDENTITY()

				--INSERT INTO tbltags_log
				--(
				--	NodeID,			
				--	ParentID,
				--	NodeName,		
				--	CaseID,	
				--	DocTypeID,
				--	NodeIcon,	
				--	NodeLevel,
				--	Expanded,
				--	NodeType,	
				--	CaseType,
				--	fk_master_node_id,
				--	fk_nodes_log_id
				--)
				--SELECT
				--	NodeID,			
				--	ParentID,
				--	NodeName,		
				--	CaseID,	
				--	DocTypeID,
				--	NodeIcon,	
				--	NodeLevel,
				--	Expanded,
				--	NodeType,	
				--	CaseType,
				--	fk_master_node_id,
				--	@pk_nodes_log_id
				--FROM
				--	tblTags
				--WHERE
				--	fk_master_node_id = @NodeID

				--INSERT INTO tblimagetag_log
				--(
				--	ImageID,
				--	TagID,
				--	LoginID,
				--	DateInserted,
				--	DateModified
				--)
				--SELECT
				--	ImageID,
				--	TagID,
				--	LoginID,
				--	DateInserted,
				--	DateModified
				--FROM
				--	tblImageTag
				--WHERE
				--	TagID IN (SELECT NodeID FROM tblTags WHERE fk_master_node_id = @NodeID)

				--INSERT INTO tbldocimages_log
				--(
				--	ImageID,
				--	Filename,
				--	FilePath,
				--	OCRData,
				--	Status,
				--	is_saga_doc,
				--	nodeid,
				--	createduser,
				--	Revisededuser,
				--	createddate,
				--	Revisededdate,
				--	from_flag,
				--	description,
				--	DOCUMENTID,
				--	fk_tag_id
				--)
				--SELECT
				--	ImageID,
				--	Filename,
				--	FilePath,
				--	OCRData,
				--	Status,
				--	is_saga_doc,
				--	nodeid,
				--	createduser,
				--	Revisededuser,
				--	createddate,
				--	Revisededdate,
				--	from_flag,
				--	description,
				--	DOCUMENTID,
				--	fk_tag_id
				--FROM
				--	tblDocImages
				--WHERE
				--	ImageID IN (SELECT ImageID FROM tblImageTag WHERE TagID IN (SELECT NodeID FROM tblTags WHERE fk_master_node_id = @NodeID))

				--DELETE FROM tblDocImages WHERE ImageID IN (SELECT ImageID FROM tblImageTag WHERE TagID IN (SELECT NodeID FROM tblTags WHERE fk_master_node_id = @NodeID))
				--DELETE FROM tblImageTag WHERE TagID IN (SELECT NodeID FROM tblTags WHERE fk_master_node_id = @NodeID)
				
				--DELETE FROM tblTags WHERE fk_master_node_id = @NodeID
				DELETE FROM MST_DOCUMENT_NODES WHERE NODEID	=	@NodeID       
			END
		END
END  

GO
