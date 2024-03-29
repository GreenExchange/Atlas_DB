USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Selectuniqueusername]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Selectuniqueusername]    
@DomainId NVARCHAR(50)    
as    
begin    
select distinct a.user_id,b.UserName,b.UserPassword as 'Password' from TXN_PROVIDER_LOGIN a inner join IssueTracker_Users b on a.user_id=b.UserId where b.IsActive='True' and b.DomainId=@DomainId order by b.UserName    
end    
GO
