USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Add_prov_BatchNo]    Script Date: 6/17/2019 2:53:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_prov_BatchNo]  --[Add_prov_BatchNo] '123','22'
(  
   @BatchNumber nvarchar(50),  
   @ProviderId nvarchar(50)
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
insert into RelationProv_BatchNo(BatchNumber,ProviderId) values(@BatchNumber,@ProviderId)
end
else
begin
insert into RelationProv_BatchNo(BatchNumber,ProviderId) values(@BatchNumber+'_'+convert(nvarchar,(@batch_no_count)),@ProviderId)
end
end
GO
