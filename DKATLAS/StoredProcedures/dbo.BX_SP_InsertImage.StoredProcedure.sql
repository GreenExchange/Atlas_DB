USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_SP_InsertImage]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BX_SP_InsertImage] (
@ImagePath nvarchar(255),@Filename nvarchar(100),@DocumentID nvarchar(20),
@CaseId nvarchar(50),@ScanDate nvarchar(50),@UserId nvarchar(50),@RecordDescriptor nvarchar(220)
)
as
begin

insert into BX_Images(ImagePath,Filename,DocumentID,Case_Id,ScanDate,UserId,RecordDescriptor)
 values(@ImagePath,@Filename,@DocumentID,@CaseId,@ScanDate,USER_NAME(),@RecordDescriptor)
END
GO
