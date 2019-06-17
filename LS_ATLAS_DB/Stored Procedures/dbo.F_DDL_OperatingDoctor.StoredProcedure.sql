USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_OperatingDoctor]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_OperatingDoctor]
	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as Doctor_ID,' ---Select Treating Doctor-- ' as Doctor_Name
	UNION
	SELECT Doctor_ID, Doctor_Name as Doctor_Name 
	FROM tblOperatingDoctor WHERE Doctor_Name not like '%select%' and Doctor_ID <> 0 and Doctor_Name <> ''
	ORDER BY Doctor_Name
	
	SET NOCOUNT OFF ; 


END

GO
