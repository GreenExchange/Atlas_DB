USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_TREATINGDOCTOR_DETAILS]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_TREATINGDOCTOR_DETAILS]
(	@domainId				   nvarchar(50),
	@Treatment_Id int  
)
AS
SELECT ID, D.DOCTOR_NAME
FROM txn_case_treating_doctor TXN, tblOperatingDoctor D
WHERE D.DOCTOR_ID = TXN.DOCTOR_ID and TREATMENT_ID=@Treatment_Id
and TXN.DomainId = @domainId



GO
