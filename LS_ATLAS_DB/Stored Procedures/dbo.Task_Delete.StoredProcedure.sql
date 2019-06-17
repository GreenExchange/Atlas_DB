USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Task_Delete]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Task_Delete] 
	@Task_ID int,
	@DomainID varchar(50),
	@Case_ID varchar(50)
AS
BEGIN
	Delete from Task Where Task_ID = @Task_ID and DomainID = @DomainID and Case_ID = @Case_ID
END
GO
