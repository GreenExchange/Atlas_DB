USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_UserName]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_UserName]  
(
@DomainId NVARCHAR(50)
)
    
As  
   
Begin  
 select '...Select user to assign...' [userid], '' [userName]  
 union  
 select username [userid],userName from IssueTracker_Users
 WHERE @DomainId = DomainId  
end

GO
