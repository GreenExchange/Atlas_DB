USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[ClientPayment]    Script Date: 6/17/2019 2:53:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ClientPayment] (
@clid varchar(50)
)
as
begin
select * from tblpayment where provider_id=@clid order by payment_date desc
end
GO
