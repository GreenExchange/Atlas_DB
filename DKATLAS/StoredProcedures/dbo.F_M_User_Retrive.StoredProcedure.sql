USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_M_User_Retrive]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_M_User_Retrive]
(
	@i_a_User_Id INT = 0
)
AS        
BEGIN  

 IF(@i_a_User_Id = 0)
 BEGIN
    SELECT 
 		USR.UserId,
 		USR.UserName,
 		USR.UserPassword,
 		USR.first_name,
 		USR.last_name,
 		USR.UserRole,
 		USR.RoleId,
 		USR.UserType,
 		USR.Email,
 		USR.IsActive
	 FROM
		 IssueTracker_Users USR 		
     WHERE
         ISNULL(USR.UserType,'')<>'P'
	 ORDER BY 
		 USR.UserName 
		
 END
	

	
END
GO
