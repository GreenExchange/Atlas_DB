USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[procInsertCopyImage]    Script Date: 6/17/2019 2:54:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procInsertCopyImage](
@imageid int,
@cid varchar(50))
as 
begin
insert into tblimages(ImagePath,FileName,DocumentId,Case_Id,ScanDate,UserId,RecordDescriptor,DeleteFlag)
select ImagePath,FileName,DocumentId,@cid,getdate(),userid,'',0 from tblimages where imageid=@imageid
end
GO
