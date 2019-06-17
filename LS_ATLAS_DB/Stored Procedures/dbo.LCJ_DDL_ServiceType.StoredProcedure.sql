USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_ServiceType]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_ServiceType]
@DomainId NVARCHAR(50)
AS
begin

	SELECT ServiceType FROM tblServiceType WHERE DomainId = @DomainId order by ServiceType ASC

end

GO
