USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_DocumentTypeAll]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_DocumentTypeAll]
AS
begin
	--select 0 as Document_ID , '...Select...' as Document_Type
	--union 
	select Document_ID, Document_Type from tbldocumenttype where doc_for=0 order by document_Type asc
end

GO
