USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_SAVE_PDF_IN_MGR]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE   [dbo].[SP_SAVE_PDF_IN_MGR]  
@p_szCaseID nvarchar(50),  
@p_szFileName nvarchar(255)  
AS  
declare @szCaseID nvarchar(50)  
declare @iImageID int  
declare @iNodeID int  
declare @iDocCount int  
BEGIN  
 -- set @szCaseId = (select SUBSTRING ( @p_szCaseID , charindex('-',@p_szCaseID,0)+1,len(@p_szCaseID)))   
 set @szCaseId = @p_szCaseID  
 set @iDocCount = (select count(imageid) from tbldocimages where lower([filename]) = lower(@p_szFileName)  
 and lower(filepath) = lower(@szCaseId + '/saved pdfs/'))  
  
 if(@iDocCount=0)   
 begin  
  insert into tbldocimages([filename],filepath,ocrdata,[status])  
  values(@p_szFileName,@szCaseId + '/Saved PDFs/','',1)  
  
  set @iImageID = (select isnull(max(imageid),1) from tbldocimages)  
  set @iNodeID = (select nodeid from tbltags where caseid = @szCaseId and nodetype = 'SVDPDF')  
  
  insert into tblimagetag(imageid,tagid,loginid,dateinserted,datemodified)  
  values(@iImageID,@iNodeID,null,default,null)  
 end  
END
GO
