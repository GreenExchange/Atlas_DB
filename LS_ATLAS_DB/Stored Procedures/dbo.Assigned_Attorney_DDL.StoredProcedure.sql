USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Assigned_Attorney_DDL]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Assigned_Attorney_DDL]
(
	@DomainID VARCHAR(50)
)
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as PK_Assigned_Attorney_ID,'---Select Attorney--- ' as Assigned_Attorney, '' as Assigned_Attorney_Value
	UNION
	SELECT    PK_Assigned_Attorney_ID AS PK_Assigned_Attorney_ID 
	         ,Assigned_Attorney       as Assigned_Attorney 
			 ,Assigned_Attorney       as Assigned_Attorney_Value 
	FROM      Assigned_Attorney 
	WHERE 
	          DomainID = @DomainID
	ORDER BY  Assigned_Attorney
	
	SET NOCOUNT OFF ; 

END

GO
