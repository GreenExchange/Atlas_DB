USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[PacketType_Retrive]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PacketType_Retrive]
(
	@i_a_CaseType_Id INT = 0,
	@s_a_DomainId VARCHAR(50)
)
AS        
BEGIN  

 IF(@i_a_CaseType_Id = 0)
 BEGIN
    SELECT 
		PK_CaseType_Id	
		, CaseType	
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 MST_PacketCaseType  		
     WHERE 
		DomainId = @s_a_DomainId
	 ORDER BY 
		 CaseType 	
 END
 ELSE
 BEGIN
	SELECT 
		PK_CaseType_Id	
		, CaseType	
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 MST_PacketCaseType  		
	 WHERE
		 PK_CaseType_Id = @i_a_CaseType_Id
		 and DomainId = @s_a_DomainId
	 ORDER BY 
		 CaseType 
 END	
END
GO
