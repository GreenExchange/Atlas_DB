USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Settlement_Type_Retrive]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Settlement_Type_Retrive] -- [Settlement_Type_Retrive] 0,'localhost'
(
	@i_a_Settlement_Type_Id INT = 0,
	@s_a_DomainID VARCHAR(50)
)
AS        
BEGIN  

    SELECT 
		SettlementType_Id	
		, Settlement_Type	
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 tblSettlement_Type  		
     WHERE 
		DomainID = @s_a_DomainID
		AND (@i_a_Settlement_Type_Id = 0 OR  SettlementType_Id = @i_a_Settlement_Type_Id)
	 ORDER BY 
		 Settlement_Type 	
	
END
GO
