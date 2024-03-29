USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Service_Type_Retrive]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Service_Type_Retrive]
(
	@i_a_ServiceType_ID			INT	
	
)
AS        
BEGIN  

 IF(@i_a_ServiceType_ID = 0)
 BEGIN
    SELECT 
				   ServiceType_ID
				  ,ServiceType				 		 
				  ,ServiceDesc			      		
				  ,created_by_user	
				  ,CONVERT(VARCHAR(10), created_date, 101) AS created_date
		          ,modified_by_user	
		          ,CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 tblServiceType  		
    
	 ORDER BY 
		 ServiceType 	
 END
 ELSE
 BEGIN
	SELECT 
					 
				   ServiceType_ID
	              ,ServiceType				 		 
				  ,ServiceDesc			      								
				  ,created_by_user	
				  ,CONVERT(VARCHAR(10), created_date, 101) AS created_date
		          ,modified_by_user	
		          ,CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 tblServiceType  		
	 WHERE
		 ServiceType_ID = @i_a_ServiceType_ID
		
	 ORDER BY 
		 ServiceType 
 END
	

	
END
GO
