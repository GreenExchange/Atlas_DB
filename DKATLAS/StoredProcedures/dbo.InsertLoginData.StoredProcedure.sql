USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[InsertLoginData]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[InsertLoginData]
(
  @UserName nvarchar(255),
  @userid nvarchar(55),
  @UserPassword nvarchar(50),
  @Email nvarchar(255),
  @DisplayName nvarchar(50),
  @UserTypeLogin nvarchar(100),
  @UserType nvarchar(10),
  @bit_for_reports_case_search bit,
  @bit_for_Provider_Cases bit
)
as
declare @RoleID int
begin
set @RoleID=(select RoleLevel from IssueTracker_Roles where RoleName='Provider')
if(@userid='0')
begin
	insert into IssueTracker_Users(UserName,UserPassword,RoleId,Email,DisplayName,UserTypeLogin,UserType,IsActive,bit_for_reports_case_search,bit_for_Provider_Cases)
	values(@UserName,@UserPassword,@RoleID,@Email,@DisplayName,@UserTypeLogin,@UserType,'True',@bit_for_reports_case_search,@bit_for_Provider_Cases)
end
else
begin
	update IssueTracker_Users 
	set UserName=@UserName,
		UserPassword=@UserPassword,
		Email=@Email,
		DisplayName=@DisplayName,
		bit_for_reports_case_search=@bit_for_reports_case_search,
		bit_for_Provider_Cases =@bit_for_Provider_Cases
	where UserId=@userid
end
end
GO
