USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_Add_TblRules]    Script Date: 6/17/2019 2:54:07 AM ******/
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
@FilePath nvarchar(Max),
@FileName nvarchar(250),
@Category nvarchar(250)
)
AS
BEGIN

		Insert INTO Tbl_Rules(Rules_Disc,Provider_ID,InsuranceCompanyID,Provider_Group,Created_By,FilePath,FileName,Category) 
		values (@Rules_Disc,@Provider_ID,@InsuranceCompanyID,@Provider_Group,@Created_By,@FilePath,@FileName,@Category)
	 
		
END


GO
