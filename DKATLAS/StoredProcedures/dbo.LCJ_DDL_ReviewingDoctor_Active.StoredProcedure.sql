USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_ReviewingDoctor_Active]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LCJ_DDL_ReviewingDoctor_Active]
		
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT ' --- Select Reviewing Doctor --- '  as Doctor_Name, '0' Doctor_id
	UNION
	SELECT     Doctor_Name, Doctor_id
	FROM         TblReviewingDoctor WHERE  Doctor_Name <>'' and Doctor_Name not like '%select%' and Active = 1
	ORDER BY Doctor_name
	
	
END
GO
