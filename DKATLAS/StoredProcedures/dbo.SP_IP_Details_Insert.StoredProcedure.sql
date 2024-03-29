USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_IP_Details_Insert]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- ALTER date: <ALTER Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_IP_Details_Insert]
	-- Add the parameters for the stored procedure here
(
		@UserID		varchar(50),
		@REMOTE_ADDR	nvarchar(2000),
		@IPAdd		nvarchar(500)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
    DECLARE @UserName VARCHAR(50)
    SET @UserName =(SELECT TOP 1 UserName FROM IssueTracker_Users WHERE UserId = @UserID)
    
    
	INSERT INTO tbl_IP_Tracker(UserName, UserId, REMOTE_ADDR,IPAdd)
	VALUES(@UserName,@UserID,@REMOTE_ADDR,@IPAdd)
	
	
	
END
GO
