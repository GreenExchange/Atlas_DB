USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_ADD_tblOpeartingDoctor]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ADD_tblOpeartingDoctor]
@DOCTOR_NAME NVARCHAR(100)
AS
BEGIN
 INSERT INTO TblOperatingDoctor(Doctor_Name,Active)
	VALUES(@DOCTOR_NAME,1)
 
END
GO
