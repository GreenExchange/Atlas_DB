USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Peer_Review_Doctor_Retrive]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Peer_Review_Doctor_Retrive]
(
	@i_a_Doctor_id INT = 0,
	@s_a_DomainID VARCHAR(50)
)
AS        
BEGIN  

 
	SELECT 
		  Doctor_id	
		, Doctor_Name
		, Active	
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 TblReviewingDoctor  		
	 WHERE
		DomainID     = @s_a_DomainID
		and (@i_a_Doctor_id = 0 or Doctor_id = @i_a_Doctor_id)
	 ORDER BY 
		 Doctor_Name 
 
		
END
GO
