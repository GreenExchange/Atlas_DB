USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Arbitrator_Retrive]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Arbitrator_Retrive]
(
	@i_a_ARBITRATOR_ID INT = 0
	--@s_a_DomainID      VARCHAR(50)
)
AS        
BEGIN  
	SELECT 
		  ARBITRATOR_ID	
		, ARBITRATOR_NAME
		, ABITRATOR_LOCATION
		, ARBITRATOR_PHONE
		, ARBITRATOR_FAX 
	    , IS_AAA
		, ARBITRATOR_Email
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 TblArbitrator  		
	 WHERE
		
		  (@i_a_ARBITRATOR_ID = 0 or ARBITRATOR_ID = @i_a_ARBITRATOR_ID)
	 ORDER BY 
		 ARBITRATOR_NAME 
 
		
END
GO
