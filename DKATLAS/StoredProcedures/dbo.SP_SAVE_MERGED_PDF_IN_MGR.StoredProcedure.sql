USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_SAVE_MERGED_PDF_IN_MGR]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_SAVE_MERGED_PDF_IN_MGR]  
@p_szCaseID nvarchar(50),  
@p_szFileName nvarchar(255) ,
@p_szLoginId	NVARCHAR(20)
AS  
declare @szCaseID nvarchar(50)  
declare @iImageID int  
declare @iNodeID int  
declare @iDocCount int  
BEGIN  
 -- set @szCaseId = (select SUBSTRING ( @p_szCaseID , charindex('-',@p_szCaseID,0)+1,len(@p_szCaseID)))   
 set @szCaseId = @p_szCaseID  
 set @iDocCount = (select count(imageid) from tbldocimages where lower([filename]) = lower(@p_szFileName)  
 and lower(filepath) = lower(@szCaseId + '/AR 1 Packet/'))  
  
 if(@iDocCount=0)   
 begin  
  insert into tbldocimages([filename],filepath,ocrdata,[status])  
  values(@p_szFileName,@szCaseId + '/AR 1 Packet/','',1)  
  
  set @iImageID = (select isnull(max(imageid),1) from tbldocimages)  
  set @iNodeID = (select TOP 1 nodeid from tbltags where caseid = @szCaseId And NodeName = 'AR 1 Packet' 
  ---set @iNodeID = (select TOP 1 nodeid from tbltags where caseid = @szCaseId and nodetype = 'SVDLET')  
  --and nodetype = 'SVDLET'
  )  
  
  insert into tblimagetag(imageid,tagid,loginid,dateinserted,datemodified)  
  values(@iImageID,@iNodeID,@p_szLoginId,GETDATE(),null)  	
 end  
END  
  
  ---select * from tbldocimages
  
  --select isnull(max(imageid),1) from tbldocimages
  
  --select TOP 1 nodeid from tbltags  where caseid='36'
GO
