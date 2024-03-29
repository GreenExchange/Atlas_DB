USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[AddDelete_AttorneyRole]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddDelete_AttorneyRole]    
(
@id int =0,
@RoleName nvarchar(50) = null,
@DomainId nvarchar(50),
@Action varchar(10)
	) 
AS    
BEGIN  
  if( @Action ='Insert')
 Begin
 insert into  [dbo].[tbl_AttorneyRoles] values(@RoleName,@DomainId)
 end 
 if(@Action ='Delete')
  Begin
   Delete from [dbo].[tbl_AttorneyRoles] where Id = @Id and DomainId =@DomainId  
 end 
 if(@Action ='View')
  Begin
   Select Id,RoleName  from [dbo].[tbl_AttorneyRoles] where  DomainId =@DomainId  
 end
END
GO
