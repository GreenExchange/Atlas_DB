USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[EventType_Retrive]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[EventType_Retrive]
(
	@i_a_EventTypeId INT = 0

)
AS        
BEGIN  

 IF(@i_a_EventTypeId = 0)
 BEGIN
    SELECT 
		  EventTypeId	
		, EventTypeName	
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		 tblEventType	

    
	 ORDER BY 
		 EventTypeName 	
 END
ELSE
 BEGIN
	SELECT 
		EventTypeId
		, EventTypeName	
		, created_by_user	
		, CONVERT(VARCHAR(10), created_date, 101) AS created_date
		, modified_by_user	
		, CONVERT(VARCHAR(10), modified_date, 101) AS modified_date
	 FROM
		  tblEventType			
	 WHERE
		 EventTypeId = @i_a_EventTypeId
		
	 ORDER BY 
		 EventTypeName 
 END

END
GO
