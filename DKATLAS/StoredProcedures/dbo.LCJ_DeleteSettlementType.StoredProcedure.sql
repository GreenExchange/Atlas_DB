USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteSettlementType]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DeleteSettlementType]
(

@Settlement_Type nvarchar(100)

)


AS

DELETE from tblSettlement_Type where Settlement_Type = + Rtrim(Ltrim(@Settlement_Type))
GO
