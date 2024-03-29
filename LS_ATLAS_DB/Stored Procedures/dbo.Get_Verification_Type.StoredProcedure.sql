USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_Verification_Type]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_Verification_Type]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Select 0 as vr_type_id, '---Select Type---' as verification_type
	Union
	Select vr_type_id, verification_type from tbl_verification_type
END
GO
