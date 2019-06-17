USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_Base_Active_Path]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_Base_Active_Path]
    
AS
BEGIN

	SET NOCOUNT ON
	Select BasePathId, PhysicalBasePath, VirtualBasePath from [dbo].[tblBasePath] 
	where BasePathId=(Select ParameterValue from [tblApplicationSettings] where ParameterName='BasePathId')

END

GO
