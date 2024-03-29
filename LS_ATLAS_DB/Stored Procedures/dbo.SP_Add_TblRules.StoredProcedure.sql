USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_Add_TblRules]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SP_Add_TblRules]--[SP_Change_StatusAge_limit] 'TEST','tech','2'
(
@Rules_Disc nvarchar(Max),
@Provider_ID nvarchar(20),
@InsuranceCompanyID nvarchar(20),
@Provider_Group nvarchar(20),
@Created_By nvarchar(250),
@DomainId nvarchar(50),
@FilePath nvarchar(Max),
@FileName nvarchar(250),
@Category nvarchar(50),
@Insurance_Group nvarchar(20)
)
AS
BEGIN

		Insert INTO Tbl_Rules
		(
			Rules_Disc
			, Provider_ID
			, InsuranceCompanyID
			, Provider_Group
			, Created_By
			, DomainId
			, FilePath
			, FileName
			, Category
			, Insurance_Group
		) 
		values 
		(
			@Rules_Disc
			, @Provider_ID
			, @InsuranceCompanyID
			, @Provider_Group
			, @Created_By
			, @DomainId
			, @FilePath
			, @FileName
			, @Category
			, @Insurance_Group
		)
	
		
END


GO
