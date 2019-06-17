USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[INSERT_ECMC_Denial_PDF]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[INSERT_ECMC_Denial_PDF]
	@Case_Id VARCHAR(50),
	@FileName VARCHAR(MAX),
	@Page_No INT
AS
BEGIN
	INSERT INTO ECMC_Denial_PDF
	(Case_Id,FileName,Page_No)
	VALUES
	(@Case_Id,@FileName,@Page_No)
END
GO
