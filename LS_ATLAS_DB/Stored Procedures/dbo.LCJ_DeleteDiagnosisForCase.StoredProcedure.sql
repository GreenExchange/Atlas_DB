USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteDiagnosisForCase]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  Stored Procedure dbo.LCJ_DeleteDiagnosisForCase    Script Date: 3/13/2008 3:52:10 PM ******/




CREATE PROCEDURE [dbo].[LCJ_DeleteDiagnosisForCase]
(
@Case_Id nvarchar(50),
@Diag_Id int

)


AS
DELETE from tblCaseDiagnosis where Case_Id = @Case_Id AND Diag_Id = @Diag_Id

GO
