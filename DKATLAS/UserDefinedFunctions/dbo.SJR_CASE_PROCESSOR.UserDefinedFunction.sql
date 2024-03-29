USE [DKATLAS]
GO
/****** Object:  UserDefinedFunction [dbo].[SJR_CASE_PROCESSOR]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		srosenthal
-- ALTER date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[SJR_CASE_PROCESSOR] ()

RETURNS TABLE 
AS
RETURN 
(
	SELECT     tblcase.Case_Id, tblNotes.User_Id, tblcase.Status
FROM         tblcase INNER JOIN
                      tblNotes ON tblcase.Case_Id = tblNotes.Case_Id
WHERE      (tblNotes.Notes_Desc = N'case opened')
GROUP BY tblcase.Case_Id, tblNotes.User_Id, tblcase.Status
)
GO
