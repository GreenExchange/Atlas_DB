USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Reason_Type_Retrive]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Reason_Type_Retrive]
(
	@i_a_DenialReasons_Id INT = 0
	
)
AS        
BEGIN  

    SELECT 
		  DenialReasons_Id	
		, DenialReasons_Type	
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 tblDenialReasons  		
     WHERE 
		
		 (@i_a_DenialReasons_Id = 0 OR  DenialReasons_Id = @i_a_DenialReasons_Id)
	 ORDER BY 
		 DenialReasons_Type 	
 
		
END
GO
