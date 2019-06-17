USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_PacketCaseType]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_PacketCaseType]
	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as PacketCaseTypeID,' ---Select Packet Case Type--- ' as PacketCaseType
	UNION
	SELECT PK_CaseType_Id AS PacketCaseTypeID,Upper(ISNULL(CaseType, '')) AS PacketCaseType FROM MST_PacketCaseType WHERE PK_CaseType_Id <> 0
	
	SET NOCOUNT OFF ;



END
GO
