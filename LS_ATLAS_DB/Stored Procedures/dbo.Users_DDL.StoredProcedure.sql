USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Users_DDL]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Users_DDL]  -- [Users_DDL] 'localhost'
	@DomainID varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Select '0' AS UserId,' ---Select User---- 'AS UserName,'' AS UserNameValue
	UNION    
	Select UserId, UserName, UserName AS UserNameValue  From IssueTracker_Users 
	Where DomainID = @DomainID and IsActive = '1' order by UserName

END
GO
