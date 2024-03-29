USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_ReviewingDoctor]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_ReviewingDoctor]
(
	@DomainID VARCHAR(50)
)
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as Doctor_id,' ---Select Reviewing Doctor--- ' as Doctor_Name
	UNION
	SELECT Doctor_id AS Doctor_id, Doctor_Name as Doctor_Name 
	FROM TblReviewingDoctor WHERE Doctor_Name not like '%select%' and Doctor_id <> 0 and Doctor_Name <> '' and DomainID = @DomainID
	ORDER BY Doctor_Name
	
	SET NOCOUNT OFF ; 
	

END

GO
