USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_M_DenialReasons]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[F_DDL_M_DenialReasons]


AS
BEGIN
	
	SELECT 0 as PK_Denial_ID,' ---Select Denial Reasons--- ' AS DenialReason
	UNION
    SELECT PK_Denial_ID, DenialReason FROM MST_DenialReasons
    ORDER BY DenialReason ASC
END
GO
