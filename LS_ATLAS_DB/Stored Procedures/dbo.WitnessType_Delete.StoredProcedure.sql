USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[WitnessType_Delete]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WitnessType_Delete]
	@i_a_WitnessTypeID int,
	@s_a_DomainId varchar(50)
AS
BEGIN
		IF EXISTS(Select * from tblCaseWitnessList Where WitnessTypeID = @i_a_WitnessTypeID and DomainId = @s_a_DomainId)
			BEGIN
				Select 'Witness type can not be deleted. Reference exists in case witness list.'
			END
		ELSE
			BEGIN
			     Delete from tblWitnessType Where WitnessTypeID = @i_a_WitnessTypeID and DomainId = @s_a_DomainId
			     
				 Select 'Witness type deleted successfully.'
			END
END
GO
