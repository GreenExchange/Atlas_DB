USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[DeleteProvand_Users]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProvand_Users] --[DeleteProvand_Users] '232',1,''
(  
   @BatchNumber nvarchar(50),
   @param int,   
   @val as nvarchar(50) output
)  
as  
begin 
set @val=''
if(@param='0') 
begin
delete from RelationProv_BatchNo where BatchNumber=@BatchNumber
delete from RelationUser_BatchNo where BatchNumber=@BatchNumber
end
else
begin
delete from RelationProv_BatchNo where BatchNumber=@BatchNumber
delete from RelationUser_BatchNo where BatchNumber=@BatchNumber
if exists(select BatchNumber from tblProvListBoxDetails where BatchNumber=@BatchNumber)
delete from tblProvListBoxDetails where BatchNumber=@BatchNumber
else
set @val='No Records'
end
end
GO
