USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_Notes_Viewed]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_Notes_Viewed](
@DomainId VARCHAR(50),
@Case_id varchar(50),
@User_Id varchar(50)
)
as
begin
declare
@cnt int
     select @cnt = count(1) from tblNotes (NOLOCK) where Case_Id=@Case_Id and DateDiff(d,Notes_Date,getdate()) = 0 and Notes_Desc = 'File Viewed' and User_Id=@User_id and DomainId=@DomainId
    -- print @cnt
       If @cnt < 1 
       Insert into tblNotes (Notes_Desc, Notes_Type, Notes_Priority, Case_Id, Notes_Date, User_Id, DomainId)
	   values('File Viewed','General',0,@case_id,getdate(),@user_id,@DomainId)
end

GO
