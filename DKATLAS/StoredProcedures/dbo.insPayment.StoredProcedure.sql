USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[insPayment]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insPayment] (
@clid varchar(50),
@payment_amount money,
@payment_type varchar(10),
@notes nvarchar(500),
@user_id varchar(50)
)
as
begin
insert into tblpayment values (@clid,@payment_amount,getdate(),@notes,@payment_type,@user_id)
end
GO
