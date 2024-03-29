USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[PROC_UPDATECOSTBALANCE]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_UPDATECOSTBALANCE](
@DomainId NVARCHAR(50),
@PID VARCHAR(50),
@AMT MONEY
)
AS
BEGIN
UPDATE tblprovider SET cost_balance=@AMT where provider_id = @PID and DomainId=@DomainId
END

GO
