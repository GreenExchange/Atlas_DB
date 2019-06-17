USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_Defendant]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_Defendant]
--(
--	@DomainID VARCHAR(50)
--)
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as Defendant_ID,' ---Select Defendant--- ' as Defendant_Name, ' ---Select Defendant--- ' as  DEFENDANT_DISPLAYNAME
	UNION
	SELECT Defendant_id, Defendant_Name as Defendant_Name, DEFENDANT_DISPLAYNAME
	FROM tblDefendant WHERE Defendant_Name not like '%select%' and Defendant_id <> 0 and Defendant_Name <> '' --and DomainID = @DomainID
	ORDER BY Defendant_Name
	
	SET NOCOUNT OFF ; 


END

GO
