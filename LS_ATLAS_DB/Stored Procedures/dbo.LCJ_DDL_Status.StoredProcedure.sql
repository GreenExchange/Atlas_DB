USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Status]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LCJ_DDL_Status]
@DomainId NVARCHAR(50)
AS
begin

    SELECT '0' as Status_Abr,' --- Select Status --- ' as Status_Type
    UNION
	SELECT   DISTINCT Status_Abr, Upper(ISNULL(Status_Type, '')) AS Status_Type
	FROM tblStatus
	WHERE     (1 = 1) and DomainId=@DomainId 
	AND ISNULL(IsActive,'') <>'0' order by Status_Type
end

GO
