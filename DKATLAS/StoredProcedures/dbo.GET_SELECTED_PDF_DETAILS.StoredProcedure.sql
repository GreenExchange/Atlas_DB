USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[GET_SELECTED_PDF_DETAILS]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[GET_SELECTED_PDF_DETAILS]
AS
BEGIN
	SELECT SZ_IMAGEID,SZ_FILENAME FROM TXN_SET_ORDER
END
GO
