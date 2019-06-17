USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_NotesTypeFilter]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_NotesTypeFilter]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
AS
--ALTER TABLE #tmpNotesType
--	(NotesType_Id int, Notes_Type varchar(50))

begin

--insert into #tmpNotesType values(0,'ALL')
--insert into #tmpNotesType

	SELECT    DISTINCT NotesType_Id, Upper(ISNULL(Notes_Type, '')) AS Notes_Type
	FROM         tblNotesType
	WHERE     (1 = 1) order by Notes_Type

--select NotesType_Id, Notes_Type from #tmpNotesType order by 1
end
GO
