USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[WitnessType_List]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WitnessType_List]	
	@s_a_DomainId varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	Select  0 as WitnessTypeId, '--Select--' as WitnessType
	Union
	Select WitnessTypeId, WitnessType from tblWitnessType Where DomainId = @s_a_DomainId 
	ORDER BY WitnessType ASC
END
GO
