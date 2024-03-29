USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SJR_ARB_WON_UPDATER]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SJR_ARB_WON_UPDATER]
AS
BEGIN


declare @case_id varchar(50)

declare oxcur cursor
for
select case_id from tblcase
WHERE DateFile_Trial_DeNovo = GETDATE() AND Status='ARB WON-NOTICE OF ENTRY'

open oxcur 

fetch next from oxcur into @case_id
while @@FETCH_STATUS=0
begin
update tblcase
SET STATUS='ARB WON-FLAG FOR JUDGMENT',Last_Status='ARB WON-NOTICE OF ENTRY'
where Case_Id =@case_id


exec LCJ_AddNotes @case_id=@case_id,@notes_type='Activity' ,@NDesc='Status changed to ARB WON-FLAG FOR JUDGMENT by system.>>>' ,@user_id='system',@applytogroup=0

fetch next from oxcur into @case_id

end

close oxcur
deallocate oxcur

END

GO
