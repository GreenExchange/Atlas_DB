USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Status_Retrive]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Status_Retrive]
(
	@i_a_Status_Id		INT = 0

)
AS        
BEGIN  
    SELECT 
		           Status_Id	
		          , Status_Type	
				  , Status_Abr	
				  , Status_Hierarchy
				  , Auto_bill_amount
				  , Auto_bill_type
				  , Auto_bill_notes
				  , Status_Description
				  , Final_Status
				  , ISNULL(IsActive,'1') AS IsActive
				  , ISNULL(forum,'') AS forum 
				  , ISNULL(Filed_Unfiled,'') AS Filed_Unfiled
				  , hierarchy_Id				
				  , created_by_user	
				  , CONVERT(VARCHAR(10), created_date, 101) AS created_date
		          , modified_by_user	
		          , CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 tblStatus  		
     WHERE 
	
		 (@i_a_Status_Id = 0 OR Status_Id = @i_a_Status_Id)
	 ORDER BY 
		 Status_Type 	
 

	
END
GO
