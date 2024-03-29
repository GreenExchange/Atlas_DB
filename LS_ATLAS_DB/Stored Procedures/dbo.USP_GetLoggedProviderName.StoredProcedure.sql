USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[USP_GetLoggedProviderName]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GetLoggedProviderName]   
(
@DomainId varchar(50),
@UserName varchar(50)
 ) 
AS    
BEGIN  
    select Provider_Name, Provider_Id  from tblprovider (NOLOCK) where provider_id  in (select provider_id from TXN_PROVIDER_LOGIN (NOLOCK) 
     where user_id in(select userid from issuetracker_users (NOLOCK) where username=@UserName)) and DomainId= @DomainId  order by provider_name
    
END
GO
