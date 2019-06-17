USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_tblServedDetails]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_tblServedDetails]
(
@DomainId						NVARCHAR(512),
@InsuranceCompany_Id			int
)
AS
Begin

		select Name, age,Weight,Height,skin,hair,sex,ID 
		from tblServed 
		where DomainId=@DomainId and InsuranceCompany_Id=@InsuranceCompany_Id
End
GO
