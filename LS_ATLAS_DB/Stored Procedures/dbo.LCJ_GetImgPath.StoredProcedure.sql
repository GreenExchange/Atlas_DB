USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetImgPath]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GetImgPath]
(  
	@DomainId NVARCHAR(50),
   @ImgID nvarchar(50)   
)  
as  
begin  
select imagepath from tblimages  where imageId=@ImgID and DomainId=@DomainId
end

GO
