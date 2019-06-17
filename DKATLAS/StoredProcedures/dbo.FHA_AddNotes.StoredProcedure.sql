USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[FHA_AddNotes]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[FHA_AddNotes]
(

@Case_Id varchar(50),
@Notes_Type varchar(20),
@NDesc varchar(3000),
@User_Id varchar(50),
@ApplyToGroup int
)
AS
BEGIN
	

if @ApplyToGroup > 0 
begin
Insert into tblNotes 
select @NDesc,@Notes_Type,1,Case_Id,getdate(),@User_Id from tblCase where Group_Data=1 and Group_Id in (select Group_Id from tblCase where Case_Id=@Case_Id)
end
else
begin
insert into tblNotes values (@NDesc,@Notes_Type,1,@Case_Id,getdate(),@User_Id)
end

END
GO
