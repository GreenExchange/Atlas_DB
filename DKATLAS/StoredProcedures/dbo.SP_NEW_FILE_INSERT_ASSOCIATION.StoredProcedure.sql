USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_NEW_FILE_INSERT_ASSOCIATION]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_NEW_FILE_INSERT_ASSOCIATION]        
(       
-- @DomainId nVARCHAR(50),         
 @s_a_case_id nVARCHAR(50),            
 @s_a_node_name nVARCHAR(500),            
 @s_a_filename nVARCHAR(100),            
 @s_a_file_path nVARCHAR(100)   ,        
 @i_a_user_id int,    
 @i_a_BasePathId int=null,  
 @i_a_from_flag int=1  
)              
AS              
BEGIN  
/*  
from_flag=7: From Batch printing Summons  
*/  
set deadlock_priority 10  
   
 DECLARE @s_l_NotesDesc VARCHAR(MAX)  
 DECLARE @i_l_node_id INT  
   
 SET @i_l_node_id = (SELECT top 1 NodeID from tblTags (NOLOCK)  WHERE CaseID = @s_a_case_id   
 AND NodeName = @s_a_node_name --AND DomainId = @DomainId  
 )  
   
 IF  (@i_l_node_id is null)  
 BEGIN  
  EXEC sp_createDefaultDocTypesForTree    @s_a_case_id, @s_a_case_id  
  SET @i_l_node_id = (SELECT top 1 NodeID from tblTags  (NOLOCK) WHERE CaseID = @s_a_case_id AND NodeName = @s_a_node_name )  
 END  
  
 IF  (@i_l_node_id is not null)  
 BEGIN  
      DECLARE @i_l_max_id  INT        
  SET @i_l_max_id  = 0        
  DECLARE @i_l_duplicate INT = 0      
  
   SELECT @i_l_duplicate = COUNT(*) FROM tblDocImages (NOLOCK) WHERE FilePath = @s_a_file_path AND Filename = @s_a_filename and ImageID in     
   (SELECT ImageID FROM tblImageTag  (NOLOCK) WHERE TagID IN (SELECT NodeID FROM tblTags (NOLOCK) WHERE  ltrim(rtrim(caseid)) = ltrim(rtrim( @s_a_case_id))))  
  
   IF(@i_l_duplicate = 0)        
   BEGIN        
      INSERT INTO  tblDocImages (Filename,FilePath,OCRData,Status,from_flag, BasePathId)                
      VALUES (@s_a_filename,@s_a_file_path,'',1  ,@i_a_from_flag, @i_a_BasePathId)  
                  
      SET @i_l_max_id = SCOPE_IDENTITY()              
           
      INSERT INTO tblImageTag            
      VALUES (@i_l_max_id,@i_l_node_id,@i_a_user_id,GETDATE(),NULL, NULL)          
   END         
   --ELSE      
   --BEGIN  
   -- SELECT @i_l_max_id = imageid FROM tblDocImages WHERE FilePath = @s_a_file_path   
   -- AND Filename = @s_a_filename and ImageID in   
   -- (SELECT ImageID FROM tblImageTag WHERE TagID IN (SELECT NodeID FROM tblTags  WHERE ltrim(rtrim( caseid)) = ltrim(rtrim( @s_a_case_id)) AND @DomainId = DomainId))        
  
   -- SET @s_l_NotesDesc = @s_a_filename + ' uploaded at ' + @s_a_node_name    
   -- exec dbo.F_Add_Activity_Notes   
   -- @s_a_Case_Id=@s_a_case_id,@s_a_Notes_Type='Activity',@s_a_NDesc= @s_l_NotesDesc,@s_a_user_Id='System',@i_a_ApplyToGroup = 0,@DomainId = @DomainId  
  
   --END      
             
  -- select @i_l_node_id  ,@i_l_max_id as Imageid,@i_l_duplicate as duplicate    
 END  
END  
  
GO
