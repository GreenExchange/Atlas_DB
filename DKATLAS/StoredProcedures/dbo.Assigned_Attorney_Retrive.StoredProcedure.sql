USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Assigned_Attorney_Retrive]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Assigned_Attorney_Retrive] -- [Assigned_Attorney_Retrive] 0,'localhost'
(
	@i_a_Assigned_Attorney_Id INT = 0
	
)
AS        
BEGIN  

 IF(@i_a_Assigned_Attorney_Id = 0)
 BEGIN
    SELECT 
		PK_Assigned_Attorney_ID	
		, Assigned_Attorney	
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 Assigned_Attorney  		
   
	 ORDER BY 
		 Assigned_Attorney 	
 END
 ELSE
 BEGIN
	SELECT 
		PK_Assigned_Attorney_ID	
		, Assigned_Attorney	
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 Assigned_Attorney  		
	 WHERE
		 PK_Assigned_Attorney_ID = @i_a_Assigned_Attorney_Id
		
	 ORDER BY 
		 Assigned_Attorney 
 END
	

	
END
GO
