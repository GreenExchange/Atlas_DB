USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_Notes_Viewed]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_Notes_Viewed](
@User_Id varchar(100),
@Case_id varchar(100)
)
as
begin
declare
@cnt int

     select @cnt = count(*) from tblNotes where Case_Id=@Case_Id and DateDiff(d,Notes_Date,getdate()) = 0 and Notes_Desc = 'File Viewed' and User_Id=@User_id
     print @cnt
       If @cnt < 1 
       Insert into tblNotes values('File Viewed','General',0,@case_id,getdate(),@user_id)

end
GO
