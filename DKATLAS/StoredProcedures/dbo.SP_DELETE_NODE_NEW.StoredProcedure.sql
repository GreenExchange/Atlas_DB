USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_NODE_NEW]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SP_DELETE_NODE_NEW 1,'F'
CREATE PROCEDURE  [dbo].[SP_DELETE_NODE_NEW]
(
	@SZ_NODEID	INT,
	@SZ_TYPE	VARCHAR(MAX)
)
AS
BEGIN
	--N for Node & F for File
	IF(@SZ_TYPE	=	'N')--N
	BEGIN
			DELETE 
			FROM 
				tblDocImages 
			WHERE 
				ImageID	IN 
				(
					SELECT 
						ImageID 
					FROM 
						tblImageTag 
					WHERE 
						TagID = @SZ_NODEID
				)
			DELETE 
			FROM 
				tblDocImages 
			WHERE 
				ImageID	IN 
				(
					SELECT 
						ImageID 
					FROM 
						tblImageTag 
					WHERE 
						TagID IN 
						(
							SELECT 
								NodeId 
							FROM 
								tblTags	
							WHERE 
								ParentID	= @SZ_NODEID
						)
				)
			DELETE 
			FROM 
				tblImageTag 
			WHERE 
				TagID	=	@SZ_NODEID
			DELETE 
			FROM 
				tblImageTag 
			WHERE 
				TagID	IN 
				(
					SELECT 
						NodeId 
					FROM 
						tblTags	
					WHERE 
						ParentID	= @SZ_NODEID
				)
			DELETE	
			FROM 
				tblTags 
			WHERE 
				NodeID	=	@SZ_NODEID
			DELETE 
			FROM 
				tblTags 
			WHERE 
				ParentID	=	@SZ_NODEID
	END
	ELSE--F
	BEGIN
			DELETE 
			FROM 
				tblDocImages 
			WHERE 
				ImageID	= @SZ_NODEID
			DELETE 
			FROM 
				tblImageTag 
			WHERE 
				ImageID	=	@SZ_NODEID
	END
END
GO
