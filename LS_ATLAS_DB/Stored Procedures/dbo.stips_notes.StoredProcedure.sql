USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[stips_notes]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stips_notes] (
@case_id nvarchar(100)
)
as
insert into tblnotes (notes_desc,User_Id,case_id,notes_date,notes_type,notes_priority) values
('Stipulation of discontinuous printed','system',@case_id,getdate(),'A',0)

GO
