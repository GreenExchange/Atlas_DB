USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_DefendantNameList]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LCJ_DDL_DefendantNameList]
	-- Add the parameters for the stored procedure here
@DomainId NVARCHAR(50)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


		SELECT '0' AS Defendant_Id,  ' --- Select Defendant --- ' AS Defendant_Name
		UNION
		SELECT DISTINCT Defendant_Id,DEFENDANT_DISPLAYNAME AS Defendant_Name
		FROM         tblDEFENDANT
		WHERE (1 = 1 ) AND (Active=1 ) and DomainId=@DomainId
		ORDER BY DEFENDANT_NAME ASC


END

GO
