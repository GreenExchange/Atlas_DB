USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[PROC_UPDATEexpCOSTBALANCE]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_UPDATEexpCOSTBALANCE] 
(
@ttype varchar(20),
@amt money,
@case_id varchar(50)
)
as
begin
declare
@cnt int

select @cnt = count(*) from tbltransactions where case_id=@case_id and transactions_type=@ttype
if @cnt >=1 
begin
update tbltransactions set transactions_amount = @amt,transactions_deScription = transactions_description + 'COST UPDATION' where case_id=@case_id and transactions_type=@ttype
end
else
begin
insert into tbltransactions(CASE_ID,TRANSACTIONS_TYPE,TRANSACTIONS_dATE,TRANSACTIONS_AMOUNT,TRANSACTIONS_DESCRIPTION,PROVIDER_ID,USER_ID,TRANSACTIONS_FEE)
select @case_id,@ttype,getdate(),@amt,'COST CORRECTION',PROVIDER_ID,'SYSTEM',@AMT FROM TBLCASE WHERE CASE_ID=@CASE_ID
end
end

--select * from tbltransactions where transactions_type='exp' and transactions_amount=0
GO
