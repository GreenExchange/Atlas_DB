USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_GET_RANDOM_ATTORNEY]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_GET_RANDOM_ATTORNEY]

AS
BEGIN
	
	SET NOCOUNT ON;
    DECLARE @i_l_attorney int
    DECLARE @s_l_attorney_name VARCHAR(100)
    
    SELECT @i_l_attorney =ISNULL(MAX(ATTORNEY_ID),0) FROM TBL_RANDOM_ATTORNEY WHERE ASSIGNED_BIT = 0
    print @i_l_attorney
    
	IF (@i_l_attorney =0)
	BEGIN
     	 INSERT INTO TBL_RANDOM_ATTORNEY(ATTORNEY_ID, ATTORNEY_USERNAME, ASSIGNED_BIT)  
     	 SELECT USERID, USERNAME,0 FROM IssueTracker_Users where RoleId =22
     	 
     	 SELECT @i_l_attorney =ISNULL(MAX(ATTORNEY_ID),0) FROM TBL_RANDOM_ATTORNEY WHERE ASSIGNED_BIT = 0
     	 
     	 
     	 --UPDATE TBL_RANDOM_ATTORNEY SET ASSIGNED_BIT = 1 WHERE ASSIGNED_BIT = 0 and ATTORNEY_ID= @i_l_attorney

	END
    select  USERNAME FROM IssueTracker_Users WHERE USERID =@i_l_attorney
	
END
GO
