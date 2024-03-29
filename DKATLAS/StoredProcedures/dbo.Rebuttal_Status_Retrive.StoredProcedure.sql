USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Rebuttal_Status_Retrive]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Rebuttal_Status_Retrive] -- [Rebuttal_Status_Retrive] 0,'localhost'
(
	@i_a_Rebuttal_Status_Id INT = 0

)
AS        
BEGIN  

 IF(@i_a_Rebuttal_Status_Id = 0)
 BEGIN
    SELECT 
		PK_Rebuttal_Status_ID	
		, Rebuttal_Status	
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 Rebuttal_Status  		
    
	 ORDER BY 
		 Rebuttal_Status 	
 END
 ELSE
 BEGIN
	SELECT 
		  PK_Rebuttal_Status_ID	
		, Rebuttal_Status	
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 Rebuttal_Status  		
	 WHERE
		 PK_Rebuttal_Status_ID = @i_a_Rebuttal_Status_Id
		 
	 ORDER BY 
		 Rebuttal_Status 
 END
	

	
END
GO
