USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[procUpdatePrintFlag]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procUpdatePrintFlag]
as 
begin
Select distinct * from LCJ_VW_CASESEARCHDETAILS WHERE case_id in (select case_id from tbltobeprinted_MOTIONS where printed=0) order by indexorAAA_number asc
update tbltobeprinted_MOTIONS set printed=1 where case_id in (select case_id from tbltobeprinted_MOTIONS where printed=0) 
end

GO
