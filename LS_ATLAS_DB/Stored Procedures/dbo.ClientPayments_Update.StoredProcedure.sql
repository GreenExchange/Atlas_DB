USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[ClientPayments_Update]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ClientPayments_Update] 
	-- Add the parameters for the stored procedure here
	@DomainId NVARCHAR(50),
	@pid varchar(20),
	@pamount float,
	@pdate datetime,
	@pdesc varchar(200),
	@PayID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @cb MONEY
	DECLARE @Payment_Amount Money
    -- Insert statements for procedure here
	select @cb = cost_balance from tblprovider(NOLOCK) where provider_id=@pid and DomainId=@DomainId

	select @Payment_Amount = Payment_Amount from tblClientPayment(NOLOCK) where ClientPaymentId=@PayID and DomainId=@DomainId

	set @cb = @cb + @Payment_Amount

	set @cb = @cb - @pamount

	update tblProvider set cost_balance = @cb where provider_id=@pid and DomainId=@DomainId

	UPDATE tblClientPayment
	SET 
	Payment_Amount=@pamount,
	Payment_Date=@pdate,
	Payment_Desc=@pdesc
	WHERE 
	DomainId=@DomainId
	AND ClientPaymentId=@PayID

END
GO
