USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_Payments_DataGrid]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_Payments_DataGrid]

(

@Case_Id NVARCHAR(100)

)
AS

Select * from LCJ_VW_PaymentsGrid where Case_Id= + @Case_Id
GO
