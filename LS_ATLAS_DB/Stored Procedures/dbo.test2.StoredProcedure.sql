USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[test2]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[test2]
as
begin
declare @Nodeid  as NVARCHAR(50)
declare @caseid      as NVARCHAR(50)

DECLARE NODE_CURSOR CURSOR FOR            
            SELECT      
             nodeid,caseid     
            FROM     
             tbltags where ParentID is null and caseid  in ('FH07-42372')   
       OPEN NODE_CURSOR            
       FETCH NEXT FROM NODE_CURSOR INTO @Nodeid,@caseid                
       WHILE @@FETCH_STATUS = 0            
       BEGIN            
                 insert into tblTags(ParentID,NodeName,CaseID,NodeLevel,Expanded)
                 select @Nodeid,'BRIEF ANALYSIS',@caseid,1,0                
       FETCH NEXT FROM NODE_CURSOR INTO @Nodeid,@caseid          
   END            
   CLOSE NODE_CURSOR            
   DEALLOCATE NODE_CURSOR  
   end

GO
