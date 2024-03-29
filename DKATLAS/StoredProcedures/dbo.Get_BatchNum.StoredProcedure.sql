USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Get_BatchNum]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--sp_helptext LCJ_AddDataEntry1

CREATE PROCEDURE [dbo].[Get_BatchNum] --Add_ProviderBoxDetails '','','','','0507201234','','Save'
(  	
    @BatchNumber nvarchar(50)  
)  
AS  
declare @batch_no as nvarchar(50)
declare @batch_no_count as nvarchar(50)
BEGIN
set @batch_no=(select max(BatchNumber) from tblProvListBoxDetails where BatchNumber like @BatchNumber+'%')

set @batch_no_count=convert(int,(select SUBSTRING (@batch_no ,10, 12 )))
select @BatchNumber+'_'+convert(nvarchar,@batch_no_count)
End
GO
