USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[GET_ACTIVE_PROVIDER]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_ACTIVE_PROVIDER]
AS
BEGIN
select provider_id, provider_name, Provider_Local_Address from tblprovider where active = 0
order by 2
	--select provider_id, provider_name, Provider_Local_Address+ ' ' + Provider_Local_City+ ' ' +Provider_Local_State+ ' ' +Provider_Local_Zip as Provider_Local_Address from tblprovider where active = 0
END
GO
