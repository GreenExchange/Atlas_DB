USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_UpdateAdjusters]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_UpdateAdjusters]
(

@Adjuster_Id		int,
@Adjuster_LastName	nvarchar(200),
@Adjuster_FirstName	nvarchar(200),
@Adjuster_Address  nvarchar(200),
@InsuranceCompany_Id	nvarchar(100),
@Adjuster_Phone	nvarchar(100),
@Adjuster_Fax		nvarchar(100),
@Adjuster_Email	nvarchar(100),
@Adjuster_Extension varchar(100)

)
AS
BEGIN
	
	BEGIN
		
		BEGIN TRAN

		UPDATE  tblAdjusters
		
		SET 
				
		Adjuster_LastName = @Adjuster_LastName,
		Adjuster_FirstName = @Adjuster_FirstName,
		Adjuster_Address = @Adjuster_Address,
		InsuranceCompany_Id = @InsuranceCompany_Id,
		Adjuster_Phone = @Adjuster_Phone,
		Adjuster_Fax = @Adjuster_Fax,
		Adjuster_Email = @Adjuster_Email,
		Adjuster_Extension = @Adjuster_Extension
		WHERE

		Adjuster_Id = @Adjuster_Id
	
		COMMIT TRAN

	END

END
GO
