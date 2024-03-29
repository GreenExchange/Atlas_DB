USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[DOCUMENT_NODES_Retrive]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DOCUMENT_NODES_Retrive]
	@DomainID varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT '0' AS NodeID, ' ---Select Document Node--- ' AS NodeName
	UNION 
    SELECT NodeID, NodeName FROM MST_DOCUMENT_NODES WHERE DomainId = @DomainID
	ORDER BY NodeName
END
GO
