USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_NotesTypeFilter]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_NotesTypeFilter]
/*
	(
		@parameter1 datatype = default value,
		@parameter2 datatype OUTPUT
	)
*/
@DomainId NVARCHAR(50)
AS
--ALTER TABLE #tmpNotesType
--	(NotesType_Id int, Notes_Type varchar(50))

begin

--insert into #tmpNotesType values(0,'ALL')
--insert into #tmpNotesType
	SELECT 0 AS NotesType_Id,' ---ALL--- ' AS Notes_Type
	UNION 
	SELECT    DISTINCT NotesType_Id, Upper(ISNULL(Notes_Type, '')) AS Notes_Type
	FROM         tblNotesType
	WHERE     (1 = 1) and DomainId=@DomainId order by Notes_Type

--select NotesType_Id, Notes_Type from #tmpNotesType order by 1
end
GO
