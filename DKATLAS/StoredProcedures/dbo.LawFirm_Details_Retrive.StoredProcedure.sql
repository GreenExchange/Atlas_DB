USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LawFirm_Details_Retrive]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- DROP PROCEDURE [dbo].[Reteive_LawFirm_By_Provider] 
CREATE PROCEDURE [dbo].[LawFirm_Details_Retrive] 
   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    Select LawFirmName, Client_Billing_Address, Client_Billing_City, Client_Billing_State,Client_Billing_Zip,
	 Client_Billing_Phone, Client_Billing_Fax from tbl_Client c 
	
	 
END
GO
