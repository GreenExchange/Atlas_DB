USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_WitnessType]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_WitnessType]
	@s_a_DomainId varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
    
	Select WitnessTypeID
	      ,WitnessType
		  ,Description
		  ,DomainId
		  ,created_by_user
		  ,CONVERT(VARCHAR(50), created_date, 101) as created_date
		  ,modified_by_user 
		  ,CONVERT(VARCHAR(50), modified_date, 101) as modified_date 
    from tblWitnessType Where DomainId = @s_a_DomainId 
	ORDER BY
		WitnessType ASC
END
GO
