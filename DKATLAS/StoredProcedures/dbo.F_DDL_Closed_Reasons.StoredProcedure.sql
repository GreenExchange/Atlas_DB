USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_Closed_Reasons]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[F_DDL_Closed_Reasons] 
  
AS  
BEGIN
	SELECT * FROM tbl_closed_reasons ORDER BY ClosedReasons
END
GO
