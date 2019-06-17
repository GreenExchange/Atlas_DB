USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_NODE_ID]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_NODE_ID] 
(
	--exec SP_GET_NODE_ID '','AUTHORIZATION','',''  
	 @CASE_ID VARCHAR(max)='',  
	 @FLEVEL VARCHAR(max)='',  
	 @SLEVEL VARCHAR(max)='',  
	 @TLEVEL VARCHAR(max)=''  ,
	 @F1LEVEL VARCHAR(max)=''
)
AS  
BEGIN  
	DECLARE @FLTAGID bigint  
	SET @FLTAGID = (SELECT TOP 1 NODEID FROM tblTags WHERE CaseID=@CASE_ID AND NodeName=@FLEVEL)  
   
	DECLARE @SLTAGID bigint  
	SET @SLTAGID = (SELECT TOP 1 NODEID FROM tblTags WHERE CaseID=@CASE_ID AND NodeName=@SLEVEL )  
	DECLARE @TLTAGID bigint  
	SET @TLTAGID = (SELECT TOP 1 NODEID FROM tblTags WHERE CaseID=@CASE_ID AND NodeName=@TLEVEL )
	Declare @FL1TAGID bigint 
	 SET @FL1TAGID = (SELECT TOP 1 NODEID FROM tblTags WHERE CaseID=@CASE_ID AND NodeName=@F1LEVEL)
	 	
    if(@FL1TAGID <> 0)
	SELECT @FL1TAGID as TagId  
	else if(@TLTAGID <> 0)
	SELECT @TLTAGID as TagId 
	else if(@SLTAGID <> 0)
	SELECT @SLTAGID as TagId 
	else
	SELECT @FLTAGID as TagId 
END

GO
