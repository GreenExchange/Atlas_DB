USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_SAVE_MERGED_PDF_IN_MGR]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SAVE_MERGED_PDF_IN_MGR]  
@DomainId nvarchar(50),
@p_szCaseID nvarchar(50),  
@p_szFileName nvarchar(255) ,
@p_szYearPath nvarchar(255) ,
@p_szLoginId	NVARCHAR(20),
@i_a_BasePathId INT
AS  
declare @szCaseID nvarchar(50)  
declare @iImageID int  
declare @iNodeID int  
declare @iDocCount int  
BEGIN  
 -- set @szCaseId = (select SUBSTRING ( @p_szCaseID , charindex('-',@p_szCaseID,0)+1,len(@p_szCaseID)))   
 set @szCaseId = @p_szCaseID  
 set @iDocCount = (select count(imageid) from tbldocimages (NOLock) where DomainId=@DomainId and lower([filename]) = lower(@p_szFileName)  
 and lower(filepath) = lower(@p_szYearPath))  
  
 if(@iDocCount=0)   
 begin  
		insert into tbldocimages(DomainId, [filename],filepath,ocrdata,[status], BasePathId)  
		values(@DomainId, @p_szFileName,@p_szYearPath,'',1, @i_a_BasePathId)  
		
		SET @iImageID = SCOPE_IDENTITY()         

		
		set @iNodeID = (select MIN(nodeid) from tbltags (NOLock) where caseid = @szCaseId  and DomainId=@DomainId)  
  
		insert into tblimagetag(DomainId, imageid,tagid,loginid,dateinserted,datemodified)  
		values(@DomainId, @iImageID, @iNodeID, @p_szLoginId,GETDATE(),null)  	
 end  
END  
  
  ---select * from tbldocimages
  
  --select isnull(max(imageid),1) from tbldocimages
  
  --select TOP 1 nodeid from tbltags  where caseid='36'
GO
