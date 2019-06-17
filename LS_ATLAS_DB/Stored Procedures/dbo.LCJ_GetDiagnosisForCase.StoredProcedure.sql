USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetDiagnosisForCase]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_GetDiagnosisForCase]
(
@Case_Id		nvarchar(50)
)
AS
BEGIN
	
		Select  D.Diag_Id,
				D.Diag_Code	
		from tblCaseDiagnosis CD ,
			 tblDiagnosis D
		where cd.Case_Id=@Case_Id AND CD.DIAG_ID = D.DIAG_ID


END

GO
