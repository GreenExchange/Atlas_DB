USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_WorkAreaPaymentSummary]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE  [dbo].[LCJ_WorkAreaPaymentSummary]

(
@Case_Id as NVARCHAR(400)
)

 AS

Select * from LCJ_VW_CaseSearchDetails where Case_Id= + @Case_Id
GO
