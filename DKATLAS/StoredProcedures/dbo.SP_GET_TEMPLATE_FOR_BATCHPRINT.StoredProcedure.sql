USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_TEMPLATE_FOR_BATCHPRINT]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GET_TEMPLATE_FOR_BATCHPRINT]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT CONVERT(VARCHAR,I_TEMPLATE_ID)  AS ID_VALUE, * FROM dbo.MST_TEMPLATES --WHERE BATCH_PRINT =1
END
GO
