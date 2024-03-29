USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_DefendantNames]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_DefendantNames]
AS
BEGIN
	SELECT    DISTINCT Defendant_Id, Upper(ISNULL(Defendant_DisplayName, '')) AS Defendant_Name
	FROM         tblDefendant
	WHERE     (1 = 1) AND (ACTIVE=1) 
ORDER BY defendant_name
END
GO
