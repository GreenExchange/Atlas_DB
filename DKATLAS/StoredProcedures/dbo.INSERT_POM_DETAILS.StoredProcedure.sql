USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[INSERT_POM_DETAILS]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERT_POM_DETAILS]
	@Pom_generated_by AS NVARCHAR(50),
	@MAX_POMID INTEGER OUTPUT
AS
BEGIN
		INSERT INTO TBLPOM
		(
			Pom_date,
			Pom_generated_by
		)
		VALUES
		(
			getdate(),
			@Pom_generated_by
		)

		SET @MAX_POMID = (SELECT MAX(POM_ID) FROM TBLPOM)
END
GO
