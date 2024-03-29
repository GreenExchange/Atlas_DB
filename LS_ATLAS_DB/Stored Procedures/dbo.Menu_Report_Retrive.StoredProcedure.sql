USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Menu_Report_Retrive]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Menu_Report_Retrive] -- [Menu_Report_Retrive] 'amt'
	-- Add the parameters for the stored procedure here
	@DomainId NVARCHAR(50) =''
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ReportMenuId, MenuName,MenuLink,Description,ParentID from tblMenu_Report 
	where ReportMenuId IN (select ReportMenuId from tblMenu_Report_Domain_Access WHERE DomainId=@DomainId)
END
GO
