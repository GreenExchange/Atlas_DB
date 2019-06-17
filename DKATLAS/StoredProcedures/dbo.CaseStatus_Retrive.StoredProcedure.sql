USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[CaseStatus_Retrive]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CaseStatus_Retrive]
(
	@i_a_Id INT = 0
	
)
AS        
BEGIN  

 IF(@i_a_Id = 0)
 BEGIN
    SELECT 
		  id	
		, name	
		, description
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 tblCaseStatus	

		
	 ORDER BY 
		 name 	
 END
ELSE
 BEGIN
	SELECT 
		id
		, name	
		, description
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		  tblCaseStatus			
	 WHERE
		 id = @i_a_Id
	
	 ORDER BY 
		 name 
 END

END
GO
