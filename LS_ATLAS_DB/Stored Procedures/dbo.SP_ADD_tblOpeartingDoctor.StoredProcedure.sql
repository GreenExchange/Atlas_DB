USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_ADD_tblOpeartingDoctor]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ADD_tblOpeartingDoctor]
@DomainId nvarchar(50),
@DOCTOR_NAME NVARCHAR(100)
AS
BEGIN
 INSERT INTO TblOperatingDoctor (Doctor_Name, Active, DomainId)
	VALUES(@DOCTOR_NAME,1,@DomainId)
 
END

GO
