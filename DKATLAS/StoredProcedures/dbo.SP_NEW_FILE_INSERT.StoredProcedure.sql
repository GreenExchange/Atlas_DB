USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_NEW_FILE_INSERT]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_NEW_FILE_INSERT]    
(          
 @s_a_case_id VARCHAR(MAX),        
 @s_a_node_name VARCHAR(MAX),        
 @s_a_filename VARCHAR(MAX),        
 @s_a_file_path VARCHAR(MAX)   ,    
 @i_a_user_id int =0   ,    
 @i_a_from_flag int=2    
)          
AS          
BEGIN             
 DECLARE @i_l_max_id  INT          
 DECLARE @i_l_nodeid  INT        
       
 SET @i_l_max_id  = 0        
 SET @i_l_nodeid  = 0        
    
 SELECT     
  @i_l_nodeid = nodeid     
 FROM     
  tblTags     
 WHERE       
  ltrim(rtrim( nodename)) = ltrim(rtrim( @s_a_node_name))    
  AND ltrim(rtrim( caseid)) = ltrim(rtrim( @s_a_case_id))    
       
 INSERT INTO     
  tblDocImages   (Filename, FilePath,OCRData,Status,from_flag)    
 VALUES    
 (    
  @s_a_filename,@s_a_file_path,'',1,@i_a_from_flag    
 )        
 SET @i_l_max_id = SCOPE_IDENTITY()          
    
 INSERT INTO     
  tblImageTag        
 VALUES    
 (    
  @i_l_max_id,@i_l_nodeid,@i_a_user_id,GETDATE(),NULL  ,NULL    
 )        
          
      select @i_l_nodeid    
END     
    
--SP_HELP tblDocImages
GO
