USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_MotionType]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_MotionType] 
	@DomainId varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

     Select MotionTypeId, Name from tblMotionType(NOLOCK) Where DomainId = @DomainId
END
GO
