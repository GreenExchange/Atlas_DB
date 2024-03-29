USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Status]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LCJ_DDL_Status]
AS
begin

    SELECT '0' as Status_Abr,' --- Select Status --- ' as Status_Type
    UNION
	SELECT   DISTINCT Status_Abr, Upper(ISNULL(Status_Type, '')) AS Status_Type
	FROM tblStatus
	WHERE     (1 = 1) order by Status_Type
end
GO
