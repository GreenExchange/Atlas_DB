USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Task_Type_Retrive]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Task_Type_Retrive]
(
	@i_a_Task_Type_ID INT = 0,
	@s_a_DomainID VARCHAR(50)
)
AS        
BEGIN  

    SELECT 
				  Task_Type_ID
				, Description
				, Comments
				, Deadline_Day		
				, DomainID						 			    
				, created_by_user	
				, CONVERT(VARCHAR(10), created_date, 101) AS created_date
				, modified_by_user	
				, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 Task_Type 		
     WHERE 
		DomainID = @s_a_DomainID
		AND (@i_a_Task_Type_ID = 0 OR  Task_Type_ID = @i_a_Task_Type_ID)
	 ORDER BY 
		 Description 	

		
END
GO
