USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_DELETE_OPERATING_DOCTOR]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DELETE_OPERATING_DOCTOR]
@DomainId nvarchar(50),
@DOCTOR_ID NVARCHAR(100)
AS
BEGIN

UPDATE TbloperatingDoctor  SET Active = 0 WHERE DOCTOR_ID = @DOCTOR_ID and DomainId = @DomainId
 
END

GO
