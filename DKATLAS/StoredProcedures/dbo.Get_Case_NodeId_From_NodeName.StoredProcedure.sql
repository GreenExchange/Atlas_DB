USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Get_Case_NodeId_From_NodeName]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_Case_NodeId_From_NodeName]
(     
	@CaseId		VARCHAR(MAX),
	@NodeName	VARCHAR(MAX)
)
AS      
BEGIN      
	SELECT TOP 1
		T.NodeID
	FROM
		tblTags T
	WHERE
		T.CaseID			=	@CaseId AND
		LOWER(T.NodeName)	=	LOWER(@NodeName)
END  
GO
