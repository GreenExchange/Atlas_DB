USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[DeleteProvand_Users]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProvand_Users] --[DeleteProvand_Users] '232',1,''
(  
	@DomainId nvarchar(50),
   @BatchNumber nvarchar(50),
   @param int,   
   @val as nvarchar(50) output
)  
as  
begin 
set @val=''
if(@param='0') 
begin
delete from RelationProv_BatchNo  where BatchNumber=@BatchNumber and DomainId = @DomainId
delete from RelationUser_BatchNo  where BatchNumber=@BatchNumber and DomainId = @DomainId
end
else
begin
delete from RelationProv_BatchNo  where BatchNumber=@BatchNumber and DomainId = @DomainId
delete from RelationUser_BatchNo  where BatchNumber=@BatchNumber and DomainId = @DomainId
if exists(select BatchNumber from tblProvListBoxDetails  where BatchNumber=@BatchNumber and DomainId = @DomainId)
delete from tblProvListBoxDetails  where BatchNumber=@BatchNumber and DomainId = @DomainId
else
set @val='No Records'
end
end

GO
