USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[FHA_AddNotes]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[FHA_AddNotes]
(
@DomainId NVARCHAR(50),
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
Insert into tblNotes (Notes_Desc,	Notes_Type,	Notes_Priority,	Case_Id,	Notes_Date,	User_Id,	DomainId)
select @NDesc,@Notes_Type,1,Case_Id,getdate(),@User_Id,@DomainId from tblCase where Group_Data=1 and Group_Id in (select Group_Id from tblCase where Case_Id=@Case_Id and DomainId=@DomainId)
end
else
begin
insert into tblNotes (Notes_Desc,	Notes_Type,	Notes_Priority,	Case_Id,	Notes_Date,	User_Id,	DomainId) values (@NDesc,@Notes_Type,1,@Case_Id,getdate(),@User_Id,@DomainId)
end

END

GO
