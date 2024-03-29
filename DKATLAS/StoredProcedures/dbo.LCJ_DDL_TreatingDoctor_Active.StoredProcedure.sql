USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_TreatingDoctor_Active]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[LCJ_DDL_TreatingDoctor_Active]
		
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT ' --- Select Treating Doctor --- '  as Doctor_Name, '0' Doctor_id
	UNION
	SELECT DOCTOR_NAME, DOCTOR_ID FROM tblOperatingDoctor
	WHERE ACTIVE=1
	ORDER BY DOCTOR_NAME
END


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FHA_DDL_ReviewingDoctor_Active]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[FHA_DDL_ReviewingDoctor_Active]
GO
