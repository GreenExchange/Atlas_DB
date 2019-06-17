USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_BASEPATHID_Of_File]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_GET_BASEPATHID_Of_File] 
	@ImageId varchar(500),
	@DomainId varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;	
    select BasePathId from tblDocImages where ImageID=@ImageId and DomainId=@DomainId
END
GO
