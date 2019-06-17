USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetImgPath]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GetImgPath]
(  
   @ImgID nvarchar(50)   
)  
as  
begin  
select imagepath from tblimages where imageId=@ImgID
end
GO
