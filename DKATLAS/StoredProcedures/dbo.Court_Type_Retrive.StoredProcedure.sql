USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Court_Type_Retrive]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Court_Type_Retrive]
(
	@i_a_Court_Id		INT = 0

)
AS        
BEGIN  

 
    SELECT        
				   Court_Id
	              ,Court_Name				 
				  ,Court_Venue
				  ,Court_Address
				  ,Court_Basis
				  ,Court_Misc				 					    					
				  ,created_by_user	
				  ,CONVERT(VARCHAR(10), created_date, 101) AS created_date
		          ,modified_by_user	
		          ,CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 tblCourt  		
     WHERE 
	
		 (@i_a_Court_Id = 0 OR Court_Id     = @i_a_Court_Id)
	 ORDER BY 
		 Court_Name 	
	
END

GO
