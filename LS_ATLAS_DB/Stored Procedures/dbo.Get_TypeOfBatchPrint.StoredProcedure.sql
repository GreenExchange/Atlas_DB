USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_TypeOfBatchPrint]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_TypeOfBatchPrint]
	-- Add the parameters for the stored procedure here
	@DomainId varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
	Select 
	'---Select Type of Printing---' As Printing_Type,
	'---Select Type of Printing---' As Printing_Type
	union
    Select 
	Printing_Type
	,Printing_Type 
	from  [dbo].[TypeOfBatchPrint]
	Where Domain_Id = @DomainId
END
GO
