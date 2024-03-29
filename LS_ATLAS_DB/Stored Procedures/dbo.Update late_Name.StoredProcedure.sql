USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Update late_Name]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update late_Name]
	@DomainId varchar(50),
	@templatename varchar(200),
	@templateid int
AS
BEGIN
	update MST_TEMPLATES 
	set SZ_TEMPLATE_NAME = @templatename
	where I_TEMPLATE_ID = @templateid
	AND DomainId = @DomainId
END

GO
