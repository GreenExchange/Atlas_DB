USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_FILE_PATH_FOR_DELETE]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_FILE_PATH_FOR_DELETE] -- [SP_GET_FILE_PATH] 490312  
(
	@DOMAINID NVARCHAR(100) = NULL,
	@SZ_NODEID NVARCHAR(200)=NULL
 )
AS  
BEGIN  

	DECLARE @s_a_Exists VARCHAR(10) = 'NO'
	IF EXISTS(select filepath + [filename],[filename],filepath from tbldocimages where imageid <> @SZ_NODEID and DomainId= @DOMAINID
	AND REPLACE(filepath + [filename],'/', '\') IN(select REPLACE(filepath + [filename],'/', '\') from tbldocimages where imageid <>  @SZ_NODEID and DomainId= @DOMAINID))
	BEGIN
		SET @s_a_Exists = 'YES'
	END
	
	select filepath + [filename],[filename],filepath, @s_a_Exists as isExists,BasePathId from tbldocimages where imageid = @SZ_NODEID and DomainId= @DOMAINID
	
 
END  
  
GO
