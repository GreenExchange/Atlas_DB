USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Rebuttal_Status_DDL]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Rebuttal_Status_DDL] -- [Rebuttal_Status_DDL] 'localhost'
(
	@DomainID VARCHAR(50)
)
AS        
BEGIN  

	
	SELECT 
		'0' AS Rebuttal_Status_ID	
		, '' AS Rebuttal_Status_Value	
		, '  ---Select Rebuttal Status---  ' AS Rebuttal_Status	
	
	UNION 
    SELECT 
		PK_Rebuttal_Status_ID	AS Rebuttal_Status_ID	
		, Rebuttal_Status AS Rebuttal_Status_Value	
		, Rebuttal_Status	
	 FROM
		 Rebuttal_Status  		
     WHERE 
		DomainID = @DomainID
	 ORDER BY 
		 Rebuttal_Status 	
		 	
END
GO
