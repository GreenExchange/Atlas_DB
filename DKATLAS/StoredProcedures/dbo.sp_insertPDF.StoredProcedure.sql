USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[sp_insertPDF]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_insertPDF] (
@imagePath nvarchar(255),
@newfile nvarchar(255),
@documentId varchar(50),
@Case_Id varchar(50),
@user_id varchar(50),
@RecordDescriptor nvarchar(100)
)
as
begin

insert into tblimages values (@imagePath,@newfile,@documentId,@Case_Id,getdate(),@user_id,@RecordDescriptor,0)


end
GO
