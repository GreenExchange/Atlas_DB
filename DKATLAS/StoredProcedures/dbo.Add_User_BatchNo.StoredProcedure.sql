USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Add_User_BatchNo]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_User_BatchNo]
(  
   @BatchNumber nvarchar(50),  
   @UserId nvarchar(50)
)  
as  
declare @batch_no as nvarchar(50)
declare @batch_no_count as nvarchar(50)
BEGIN
set @batch_no=(select max(BatchNumber) from tblProvListBoxDetails where BatchNumber like @BatchNumber+'%')
if(@batch_no is null)
set @batch_no=@BatchNumber+'_0'
set @batch_no_count=convert(int,(select SUBSTRING (@batch_no ,10, 12 )))
IF (@BatchNumber LIKE '%[_]%') 
begin
insert into RelationUser_BatchNo(BatchNumber,UserId) values(@BatchNumber,@UserId)
end
else
begin
insert into RelationUser_BatchNo(BatchNumber,UserId) values(@BatchNumber+'_'+convert(nvarchar,(@batch_no_count)),@UserId)
end
end
GO
