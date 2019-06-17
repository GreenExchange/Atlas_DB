USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_States]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_States]
	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as State_Abr,' ---Select State--- ' as State_Name
	UNION
	SELECT State_Abr,State_Name FROM tblStates WHERE State_Name not like '%select%'  ORDER BY State_Name
	
	SET NOCOUNT OFF ;



END

GO
