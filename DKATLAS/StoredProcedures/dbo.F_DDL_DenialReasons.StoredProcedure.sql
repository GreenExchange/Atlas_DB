USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_DenialReasons]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_DenialReasons]
	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as DenialReasons_Id,' ---Select Denial Reasons--- ' as DenialReasons_Type
	UNION
	SELECT DenialReasons_Id AS DenialReasons_Id, DenialReasons_Type as InitialStatus_Type FROM tblDenialReasons 
	WHERE DenialReasons_Type not like '%select%' and DenialReasons_Id <> 0 and DenialReasons_Type <>''
	ORDER BY DenialReasons_Type
	
	SET NOCOUNT OFF ; 
	

END
GO
