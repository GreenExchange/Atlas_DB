USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_Provider]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_Provider] --[F_DDL_Provider] 'mccollum'
--(
--	@DomainID VARCHAR(50)
--)	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as Provider_Id,' ---Select Provider--- ' as Provider_Name
	UNION
	SELECT Provider_Id,Provider_Name +ISNULL('[' + PROVIDER_LOCAL_ADDRESS + ']','') + Isnull('    [ '+Provider_GroupName + ' ]','')  FROM tblProvider 
	WHERE isnuLL(Provider_name,'') not like '%select%' and Provider_Id <> 0 and active = 1 
	and FH_ACTIVE = 1
	ORDER BY Provider_Name
	
	SET NOCOUNT OFF ;



END

GO
