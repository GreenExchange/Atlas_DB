USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[prcUpdateRfundBatch]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prcUpdateRfundBatch]  
(  
@GetBatch varchar,  
@Case_Id varchar(100),  
@Deposite_Number varchar(100)  
)  
as  
declare @Batch int  
BEGIN  
set @Batch=cast(@GetBatch as int)  
 begin  
  update tblSettlements set Settlement_Rfund_Batch=@Batch where case_id in (@Case_Id)  
  update tblTransactions set  Rfund_Batch=@Batch where Rfund_Deposite_Number = @Deposite_Number    
 end  
END
GO
