USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[EventStatus_Retrive]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EventStatus_Retrive]
(
	@i_a_EventStatusId INT = 0

)
AS        
BEGIN  

 IF(@i_a_EventStatusId = 0)
 BEGIN
    SELECT 
		  EventStatusId	
		, EventStatusName	
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 tblEventStatus	

  
	 ORDER BY 
		 EventStatusName 	
 END
ELSE
 BEGIN
	SELECT 
		EventStatusId
		, EventStatusName	
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		  tblEventStatus			
	 WHERE
		 EventStatusId = @i_a_EventStatusId
	
	 ORDER BY 
		 EventStatusName 
 END

END
GO
