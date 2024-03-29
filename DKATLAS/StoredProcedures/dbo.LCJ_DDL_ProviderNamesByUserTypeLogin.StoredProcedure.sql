USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_ProviderNamesByUserTypeLogin]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_ProviderNamesByUserTypeLogin] --[LCJ_DDL_ProviderNamesByUserTypeLogin] 'PD','40558'

	(
		--@parameter1 datatype = default value,
		--@parameter2 datatype OUTPUT
		@UserType NVARCHAR(10),
		@UserTypeLogin NVARCHAR(100)
	)

AS
--ALTER TABLE #tmpProviderNames
--	(Provider_ID nvarchar(100), Provider_Name varchar(400))

BEGIN

	
IF @UserType ='P' or @UserType ='PD'

	BEGIN
		
--		insert into #tmpProviderNames values(NULL, NULL)
--		insert into #tmpProviderNames values(0,'...Select Provider...')
--		insert into #tmpProviderNames
        select null as Provider_Id,null as Provider_Name
		union
        select 0 as Provider_Id,'...Select Provider...' as Provider_Name
		union 
		SELECT   DISTINCT Provider_Id, Provider_Name + ISNULL('[' + PROVIDER_LOCAL_ADDRESS + ']','')  AS Provider_Name
		FROM         tblProvider
		WHERE    Provider_Id  = @UserTypeLogin order by Provider_Name
		
	--	select Provider_ID, Provider_Name  from #tmpProviderNames  order by 2
--		drop table #tmpProviderNames

	End
ELSE

	BEGIN

--		insert into #tmpProviderNames values(NULL, NULL)
--		insert into #tmpProviderNames values(0,'...Select Provider...')
--		insert into #tmpProviderNames

--		SELECT   DISTINCT Provider_Id, Provider_Name
--		FROM         tblProvider
--		order by Provider_Name
		
--		select Provider_ID, Provider_Name  from #tmpProviderNames  order by 2
--		drop table #tmpProviderNames

		select null as Provider_Id,null as Provider_Name,NULL AS FH_ACTIVE
		union 
		select 0 as Provider_Id,'...Select Provider...' as Provider_Name,'2' AS FH_ACTIVE
		union 
		SELECT   Provider_Id, CASE WHEN FH_ACTIVE=1 THEN Provider_Name +ISNULL('[' + PROVIDER_LOCAL_ADDRESS + ']','') + Isnull('    [ '+Provider_GroupName + ' ]','') 
		ELSE  Provider_Name + '### INACTIVE ###' END as Provider_Name,FH_ACTIVE
		FROM tblProvider wHERE(1 = 1)
		order by fh_active desc ,provider_name asc


	End

END
GO
