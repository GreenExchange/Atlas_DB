USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[sp_createDefaultDocTypesForTree]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[sp_createDefaultDocTypesForTree] --[sp_createDefaultDocTypesForTree] 'FH13-159692','FH13-159692'        
( 
       
 @CID nvarchar(200)='7',        
 @NodeName nvarchar(200)='7'    
)        
AS        
BEGIN   
DECLARE @Parent_Id  INTEGER,        
       @Sub_Parent_Id  int,        
       @CaseID varchar(200),         
       @SZ_NODE_NAME NVARCHAR(200),        
       @I_PARENT_ID  int,        
       @maxID INTEGER 
set @CaseID=@CID  
IF ((SELECT ISNULL(COUNT(caseid),0) from tblTags Where CaseID =@CaseID and ParentID is not null )= 0)
BEGIN
       SET @Parent_id=  (Select TOP 1 ISNULL(NODEID,0) from tblTags where NodeName=@NodeName and caseid =@CID )        
         
       IF(@Parent_id is null)  
       begin  
           INSERT INTO tblTags (PARENTID, NODENAME,CASEID, DOCTYPEID, NODEICON, NODELEVEL, EXPANDED)        
           VALUES (null, @CASEID, @CASEID, null, 'Folder.gif', 0,1)     
           set @Parent_id=@@IDENTITY    
       end  
    
       DECLARE NODE_CURSOR CURSOR FOR          
            SELECT    
             NodeName,ParentID   
            FROM   
             MST_DOCUMENT_NODES        
            WHERE        
             NODEID IN(SELECT PARENTID  FROM MST_DOCUMENT_NODES )        
             OR PARENTID IN(SELECT NODEID FROM MST_DOCUMENT_NODES  )        
             OR PARENTID = 0         
			-- AND @DomainId = DomainId
            ORDER BY parentid        
           
       OPEN NODE_CURSOR          
       FETCH NEXT FROM NODE_CURSOR INTO @SZ_NODE_NAME,@Sub_Parent_Id              
       WHILE @@FETCH_STATUS = 0          
       BEGIN          
               IF @Sub_Parent_Id=0         
               BEGIN            
                INSERT INTO tblTags( NodeName,Expanded,ParentID,CaseID,NodeLevel)         
                VALUES(@SZ_NODE_NAME,0,@Parent_ID,@CaseID,1)        
               END        
              ELSE        
              BEGIN        
               SET @I_PARENT_ID =  
               (  
                Select   
                 max(NodeID)   
                from   
                 tblTags         
                WHERE   
                 NODENAME=(SELECT NODENAME FROM MST_DOCUMENT_NODES WHERE NODEID=@Sub_Parent_Id ) and caseid=@CID 
               )  
               INSERT INTO tblTags  
               (  
                 NodeName,Expanded,ParentID,CaseID,NodeLevel  
               )         
               VALUES  
               (  
                @SZ_NODE_NAME,0,@I_PARENT_ID,@CaseID,2  
               )        
              END           
              
             FETCH NEXT FROM NODE_CURSOR INTO @SZ_NODE_NAME,@Sub_Parent_Id        
      END          
           
   CLOSE NODE_CURSOR          
   DEALLOCATE NODE_CURSOR        
        
         
END       
else 
begin
	SET @Parent_id=  (Select TOP 1 ISNULL(NODEID,0) from tblTags where NodeName=@CID and  caseid=@CID)        
	DECLARE NODE_CURSOR CURSOR FOR          
	SELECT    
	NodeName,ParentID   
	FROM   
	MST_DOCUMENT_NODES        
	WHERE        
	(NODEID IN(SELECT PARENTID  FROM MST_DOCUMENT_NODES )        
	OR PARENTID IN(SELECT NODEID FROM MST_DOCUMENT_NODES )        
	OR PARENTID = 0)    
	and NodeName not in(Select distinct NodeName from tbltags where CaseId=@CID )
	--and DomainId=@DomainId
	ORDER BY parentid        

	OPEN NODE_CURSOR          
	FETCH NEXT FROM NODE_CURSOR INTO @SZ_NODE_NAME,@Sub_Parent_Id              
	WHILE @@FETCH_STATUS = 0          
	BEGIN 
	
		IF NOT EXISTS(SELECT NODEID FROM tblTags WHERE NodeName =@SZ_NODE_NAME and CaseID=@CID)-- AND @DomainId = DomainId)
		BEGIN
		print(@SZ_NODE_NAME)
			IF @Sub_Parent_Id=0         
			BEGIN            
				INSERT INTO tblTags( NodeName,Expanded,ParentID,CaseID,NodeLevel)         
				VALUES( @SZ_NODE_NAME,0,@Parent_ID,@CID,1)        
			END        
			ELSE        
			BEGIN        
				SET @I_PARENT_ID =  
				(  
				Select   
				max(NodeID)   
				from   
				tblTags         
				WHERE   
				NODENAME=(SELECT NODENAME FROM MST_DOCUMENT_NODES WHERE NODEID=@Sub_Parent_Id ) and caseid=@CID-- AND DomainId = @DomainId 
				)  
				INSERT INTO tblTags  
				(  
				 NodeName,Expanded,ParentID,CaseID,NodeLevel  
				)         
				VALUES  
				(  
				 @SZ_NODE_NAME,0,@I_PARENT_ID,@CID,2  
				)        
			END           	
		END
		FETCH NEXT FROM NODE_CURSOR INTO @SZ_NODE_NAME,@Sub_Parent_Id        
	END          

	CLOSE NODE_CURSOR          
	DEALLOCATE NODE_CURSOR
end    


END

GO
