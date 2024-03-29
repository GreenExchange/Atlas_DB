USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[procClientPayments]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procClientPayments] 
(
@pid varchar(20),@pamount float,@pdate datetime,@pdesc varchar(200)
)
as
begin
declare
@cb money

select @cb = cost_balance from tblprovider where provider_id=@pid

insert into tblClientPayment values (@pid,@pamount,@pdate,@pdesc)

set @cb = @cb - @pamount

update tblProvider set cost_balance = @cb where provider_id=@pid

end
GO
