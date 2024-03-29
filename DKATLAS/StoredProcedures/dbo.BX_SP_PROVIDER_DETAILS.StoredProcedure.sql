USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_PROVIDER_DETAILS]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[BX_SP_PROVIDER_DETAILS] 
	
	@PROVIDER_ID int
AS
BEGIN
	
	SET NOCOUNT ON;

    
	SELECT     Provider_Id,Provider_Name +Isnull('    [ '+Provider_GroupName + ' ]','') as Provider_Name, Provider_Local_Address, Provider_Local_City, Provider_Local_State, Provider_Local_Zip, Provider_Local_Phone, 
                      Provider_Local_Fax, Provider_Contact, Provider_Email, Provider_President, Provider_TaxID
FROM         tblProvider
WHERE     (BX_SERV = 1) AND (PROVIDER_ID=@PROVIDER_ID)
END
GO
