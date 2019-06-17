USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[DSP_SelectAzureBasePathId]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DSP_SelectAzureBasePathId] 
	
AS
BEGIN
	
	SET NOCOUNT ON;
	if exists(select * from tblBasePath where BasePathType=2)
	begin
    select BasePathId from tblBasePath where BasePathType=2
	end
END
GO
