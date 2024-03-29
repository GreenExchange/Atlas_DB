USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[InsertAdminNode]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertAdminNode]
	@DomainId nvarchar(50),
	@noteDesc nvarchar(2000),
	@User_Id nvarchar(500), 
    @Type nvarchar(500)
as
Begin
	Insert Into AdminNotes (Notes_Desc,Notes_Date,User_Id,Type,DomainId)
	values(@noteDesc,getDate(),@User_Id,@Type,@DomainId)
End

GO
