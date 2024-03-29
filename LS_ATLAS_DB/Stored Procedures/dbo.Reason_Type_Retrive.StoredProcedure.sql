USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Reason_Type_Retrive]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Reason_Type_Retrive]
(
	@i_a_DenialReasons_Id INT = 0,
	@s_a_DomainID VARCHAR(50)
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
		DomainID = @s_a_DomainID
		AND (@i_a_DenialReasons_Id = 0 OR  DenialReasons_Id = @i_a_DenialReasons_Id)
	 ORDER BY 
		 DenialReasons_Type 	
 
		
END
GO
