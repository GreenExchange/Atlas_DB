USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[States_DDL]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[States_DDL]
	@DomainId NVARCHAR(50)=null	
AS

BEGIN

SELECT '' AS State_Abr, ' ---Select--- ' State_Name
UNION
SELECT   State_Abr, State_Name FROM tblStates
WHERE State_Abr <> '' 
ORDER BY 1 asc

END

GO
