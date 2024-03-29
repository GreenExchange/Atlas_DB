USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Auto_Update_Denial]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Auto_Update_Denial]
AS
BEGIN
	
	UPDATE TBLCASE 
		SET DenialReasons_Type = ''
---	 UPDATE Denial in tblCASE by comma separated			
		DECLARE @tblDenial AS TABLE 
		(
			DomainID VARCHAR(50),
			CaseID VARCHAR(50),
			DenialReason VARCHAR(2000)
		)

		INSERT INTO @tblDenial
		SELECT Distinct Case_Id, tre.DomainId, tblDenialReasons.DenialReasons_Type  from tbltreatment tre
		INNER JOIN tblDenialReasons on tre.DenialReason_ID = tblDenialReasons.DenialReasons_Id
		UNION
		SELECT Distinct Case_Id, tre.DomainId, tblDenialReasons.DenialReasons_Type from tblTreatment tre
		INNER JOIN TXN_tblTreatment on tre.Treatment_Id = TXN_tblTreatment.Treatment_Id
		INNER JOIN tblDenialReasons on TXN_tblTreatment.DenialReasons_Id = tblDenialReasons.DenialReasons_Id

		DECLARE @tblDenial_final AS TABLE 
		(
			DomainID VARCHAR(50),
			CaseID VARCHAR(50),
			DenialReason VARCHAR(2000)
		)
		INSERT INTO @tblDenial_final
		SELECT Distinct CaseID, DomainID, LTRIM(RTRIM((SELECT COALESCE(CAST(DenialReason AS VARCHAR(MAX))+', ','') 
		FROM			@tblDenial where DomainID = a.DomainID and CaseID = a.CaseID FOR XML PATH(''))))
		FROM @tblDenial a

		--select CaseID,DomainID, LEFT(DenialReason, LEN(ltrim(rtrim(DenialReason))) - 1) AS DenialReason from @tblDenial_final

		UPDATE TBLCASE 
		SET DenialReasons_Type = LEFT(DenialReason, LEN(ltrim(rtrim(DenialReason))) - 1)
		FROM tblCase cas
		INNER JOIN @tblDenial_final td on cas.Case_Id= td.CaseID and cas.DomainId = td.DomainID
		WHERE ISNULL(DenialReasons_Type,'') <> LEFT(ISNULL(DenialReason,''), LEN(ltrim(rtrim(DenialReason))) - 1)

		

END
GO
