USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_DDL_ATTORNEY_FILL]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DDL_ATTORNEY_FILL] --[SP_DDL_ATTORNEY_FILL]'0'
@Defendant_Id varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT '0' AS Attorney_AutoId,  ' --- Select Attorney --- ' AS Attorney_Name
	UNION
	select Attorney_AutoId, 
		LTRIM(RTRIM(Upper(ISNULL(Attorney_LastName, '')+ ' '+ISNULL(Attorney_FirstName,'') + ' =>' + 
		'[Att.Ph#: ' + Attorney_Phone +'] / ' + '[Def.: ' + ISNULL(Defendant_Name, '') + ' / ' + 'Def.Ph#: ' + ISNULL(Defendant_Phone,'') + ' / ' + 'Def.Fax#: ' + ISNULL(Defendant_Fax,'') + ']'))) 
	AS Attorney_Name
	from tblattorney 
	INNER JOIN tbldefendant on tblattorney.Defendant_id=tbldefendant.Defendant_id where tblattorney.Defendant_Id = @Defendant_Id

END
GO
