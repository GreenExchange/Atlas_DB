USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Task_Get_UserEmailId]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Task_Get_UserEmailId] 
	@i_a_To_UserID int,
	@i_a_From_UserID int,
	@s_a_DomainId varchar(50)
AS
BEGIN
	
	Select 
	(Select Email From [IssueTracker_Users] where UserId = @i_a_From_UserID and DomainId=@s_a_DomainId) As FromID,
	(Select Isnull(first_name,DisplayName) + + Isnull(last_name,'') From [IssueTracker_Users] where UserId = @i_a_From_UserID and DomainId=@s_a_DomainId) As FromName,
    (Select Email From [IssueTracker_Users] where UserId = @i_a_To_UserID and DomainId=@s_a_DomainId) As ToID

END
GO
