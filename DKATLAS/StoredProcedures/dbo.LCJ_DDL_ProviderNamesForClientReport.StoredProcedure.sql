USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_ProviderNamesForClientReport]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_ProviderNamesForClientReport]

	(
		@UserType NVARCHAR(10),
		@UserName NVARCHAR(100)
	)

AS
BEGIN

	
IF @UserType ='P'

	BEGIN
	
		select 0 as Provider_Id,'...Select Provider...' as Provider_Name
		union 

		select DISTINCT Provider_Id, Provider_Name + ISNULL('[' + PROVIDER_LOCAL_ADDRESS + ']','') AS Provider_Name
		from tblprovider 
		where provider_id in (select usertypelogin from issuetracker_users 
								where username=@UserName) order by provider_name
	End

ELSE

	BEGIN
		select 0 as Provider_Id,'...Select Provider...' as Provider_Name
		union 
		SELECT   DISTINCT Provider_Id, Provider_Name + ISNULL('[' + PROVIDER_LOCAL_ADDRESS + ']','') + ISNULL(' [Group: '+PROVIDER_GROUPNAME+ ' ]','') AS PROVIDER_NAME  FROM tblProvider order by provider_name
	
	End

END
GO
