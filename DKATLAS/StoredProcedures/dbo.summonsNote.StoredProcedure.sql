USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[summonsNote]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[summonsNote]--'FH07-42372'
@cid varchar(50)

as
begin

--insert into tblnotes
--select 'Summons Printed','A',0,@cid,getdate(),'system' from tblnotes a 
--where case_id not in (select case_id from tblnotes b where notes_Desc='Summons Printed' and b.case_id=a.case_id)
--IF EXISTS(SELECT TOP 1 1 FROM TBLCASE WHERE CASE_ID=@cid AND date_summons_printed is null)
--BEGIN
--	exec SP_ASSIGN_REDCAT_DENIAL_REASONS @CASE_ID=@cid
--END
update tblcase 
set status='SUMMONS-PRINTED' 
where  case_id=@cid

update tblcase 
set date_summons_printed = getdate()
where date_summons_printed is null and case_id=@cid



--return 1 
end
GO
