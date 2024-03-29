USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Attorney_Type_Retrive]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[Attorney_Type_Retrive] --[Attorney_Type_Retrive] '0','test2'
(
	@i_a_Attorney_Type_ID INT = 0,
	@s_a_DomainID VARCHAR(50)
)
AS        
BEGIN  
  SELECT 
		  Attorney_Type_ID	
		, Attorney_Type	
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
		, DomainId
	 FROM
		 tblAttorney_Type  		
     WHERE 
		DomainID = @s_a_DomainID
		AND (@i_a_Attorney_Type_ID = 0 OR Attorney_Type_ID = @i_a_Attorney_Type_ID)
	 ORDER BY 
		 Attorney_Type 	
	
END
GO
