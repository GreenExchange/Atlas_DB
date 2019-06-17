USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[GETINSURANCEGROUPS]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GETINSURANCEGROUPS]
@DomainId NVARCHAR(50)
AS
BEGIN
	SELECT * FROM dbo.tblInsuranceGroups WHERE DomainId=@DomainId
END

GO
