USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[FHA_WorkArea_UpdateSettlementPctg]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[FHA_WorkArea_UpdateSettlementPctg]
(
@Settlement_Pctg as float,
@Treatment_Id as int,
@Case_Id nvarchar(100)
)

 AS

Update tblTreatment
SET Settlement_Pctg = @Settlement_Pctg
      
WHERE Case_Id = @Case_Id AND Treatment_Id = @Treatment_Id

GO
