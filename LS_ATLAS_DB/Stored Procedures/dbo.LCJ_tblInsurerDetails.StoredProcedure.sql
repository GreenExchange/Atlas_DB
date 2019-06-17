USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_tblInsurerDetails]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_tblInsurerDetails]
	
	(
		@Insurer_Id NVARCHAR(100)
		
	)

AS

BEGIN

	SELECT    *
	FROM        tblInsurer
	WHERE    Insurer_Id = @Insurer_Id

END

GO
