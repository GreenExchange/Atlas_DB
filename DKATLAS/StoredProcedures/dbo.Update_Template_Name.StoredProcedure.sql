USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Update_Template_Name]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Template_Name]
	@templatename varchar(200),
	@templateid int
AS
BEGIN
	update MST_TEMPLATES
	set SZ_TEMPLATE_NAME = @templatename
	where I_TEMPLATE_ID = @templateid
END
GO
