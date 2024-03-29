USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_ADMIN_GETSTATUS]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_ADMIN_GETSTATUS]
@DomainId NVARCHAR(50)

AS

Select STATUS_ABR, LTRIM(RTRIM(UPPER(STATUS_TYPE))) AS STATUS_TYPE  from tblStatus where 1=1 and DomainId=@DomainId

GO
