USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_Update_TblRules]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_Update_TblRules](
@Rules_ID nvarchar(50),
@Rules_Disc nvarchar(3000),
@Provider_ID nvarchar(50),
@InsuranceCompanyID nvarchar(50),
@Provider_Group nvarchar(250),
@FilePath nvarchar(Max),
@FileName nvarchar(250),
@Category nvarchar(250)
)
as
begin
--update tblcase set Memo = @Memo where case_id=@cid And DomainId = @DomainId
update Tbl_Rules set Rules_Disc=@Rules_Disc,Provider_ID=@Provider_ID,InsuranceCompanyID=@InsuranceCompanyID,Provider_Group=@Provider_Group,FilePath=@FilePath,FileName=@FileName,Category=@Category where Rules_ID=@Rules_ID
end


GO
