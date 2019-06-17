USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_Change_StatusAge_limit]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SP_Change_StatusAge_limit]--[SP_Change_StatusAge_limit] 'TEST','tech','2'
(
@status nvarchar(800),
@user_name nvarchar(100),
@critical_days nvarchar(50),
@status_type varchar(50),
@DomainId nvarchar(50)
)
AS
BEGIN
declare @strUserstatusId nvarchar(50)
set @strUserstatusId = (select MAX(UserstatusId) from tblUserStatus) + 1
	SET NOCOUNT ON;
		if  exists(select status from tblUserStatus where status=@status)
		begin
		update tblUserStatus set criticaldays = @critical_days,username=@user_name, StatusType=@status_type where status=@status And DomainId = @DomainId
		--update tblstatus set status_age_limit = @critical_days where status_type=@status
		end
		else
		begin
		insert into tblUserStatus(userid,username,Status,CriticalDays,DomainId,StatusType) values 
		((select userid from issuetracker_users where username=@user_name and DomainId = @DomainId),@user_name,@status,@critical_days,@DomainId,@status_type)
		--update tblstatus set status_age_limit = @critical_days where status_type=@status
		end
		
END


GO
