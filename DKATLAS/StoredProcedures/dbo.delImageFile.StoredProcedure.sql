USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[delImageFile]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[delImageFile](
@fid int,
@cid varchar(50),
@uid varchar(50)
)
as
begin	
declare
@doctype varchar(50),
@ndesc varchar(200)
	Select @doctype =b.document_type from tblimages a inner join tbldocumenttype b on a.documentID=b.document_id where a.ImageId = @fid
	select @ndesc = 'File ' +  convert(varchar,@fid) + ' of type ' + @doctype  + ' deleted'
	insert into tblnotes values (@ndesc,'A',0,@cid,getdate(),@uid)
	--delete from tblimages where imageid =@fid
	update tblimages set deleteflag=1 where imageid=@fid
end
GO
