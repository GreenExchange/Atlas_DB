USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_Witness_List]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_Witness_List] 
 @s_a_CaseId varchar(100),
 @s_a_DomainId varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    Select WitnessId
		  ,Case_Id
		  ,cw.DomainId
		  ,Name
		  ,Address
		  ,City
		  ,State
		  ,Zip
		  ,Email
		  ,MobileNumber
		  ,PhoneNumber
		  ,FaxNumber
		  ,Notes
		  ,isnull(cw.WitnessTypeID, 0) as WitnessTypeID
		  ,isnull(WitnessType,'') as WitnessType
   from tblCaseWitnessList(NOLOCK) cw left join tblWitnessType w on w.WitnessTypeID = cw.WitnessTypeID
   Where Case_Id = @s_a_CaseId and cw.DomainId = @s_a_DomainId
END
GO
