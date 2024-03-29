USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[BX_sp_Insert_mp_Image]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BX_sp_Insert_mp_Image] (
@ImagePath nvarchar(255),@Filename nvarchar(100),@DocumentID nvarchar(20),
@CaseId nvarchar(50),@recorddescriptor nvarchar(50),@page_count int,@Bill_id int =null)

as
begin

insert into BX_Images(ImagePath,Filename,DocumentID,Case_Id,UserId,recorddescriptor,page_count,Bill_id)
 values(@ImagePath,@Filename,@DocumentID,@CaseId,USER_NAME(),@recorddescriptor,@page_count,@Bill_id)
END
GO
