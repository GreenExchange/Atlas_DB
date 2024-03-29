USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_Temp_DM_FileMoved]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
CREATE PROCEDURE [dbo].[F_Temp_DM_FileMoved]  
   
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    -- Insert statements for procedure here  
  
 SELECT 
		  I.ImageID
		  , Filename  
		  , I.FilePath AS FilePath  
		  , T.DomainID + '\' +CaseID+'\' + NodeName +'\' AS NewFilePath  
		  --, Replace(Filename,'''','') AS NewFileName  
		  , Replace(Filename,'''','') AS NewFileName 
		  , statusdone
	from dbo.TBLDOCIMAGES I (NOLOCK)
	inner Join dbo.tblImageTag IT (NOLOCK) on IT.ImageID=i.ImageID 
	inner Join dbo.tblTags T (NOLOCK) on T.NodeID = IT.TagID 
	LEFT OUTER JOIN dbo.tblBasePath (NOLOCK) b ON I.BasePathID = b.BasePathID
	WHERE -- T.CaseID IN (SELECT LTRIM(RTRIM(items)) FROM dbo.STRING_SPLIT(@s_a_case_id,','))
	-- and 
	T.DomainId  ='GLF'
	--and nodename in ('DENIALS')
	AND replace(FilePath,'\','/') NOT like 'glf/G%'
	AND replace(FilePath,'\','/')  NOT like 'glf/ACT%'
	AND I.BasePathId = 2
	-- AND statusdone ='File Not Found'
	AND statusdone IS NULL
 order by I.ImageID  
      
END  
GO
