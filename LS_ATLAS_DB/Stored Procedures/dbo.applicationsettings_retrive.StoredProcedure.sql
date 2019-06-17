USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[applicationsettings_retrive]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[applicationsettings_retrive] -- / applicationsettings_retrive @s_a_Type=N'DocumentUploadLocationPhysical',@s_a_DomainID=N'GLF'
	-- Add the parameters for the stored procedure here
	@s_a_DomainID VARCHAR(50),
	@s_a_Type VARCHAR(50)

AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM tblApplicationSettings WHERE DomainId = @s_a_DomainID AND ParameterName =  @s_a_Type 
END
GO
