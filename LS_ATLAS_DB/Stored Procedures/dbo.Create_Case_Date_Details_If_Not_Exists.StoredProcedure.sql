USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Create_Case_Date_Details_If_Not_Exists]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Create_Case_Date_Details_If_Not_Exists] -- [Create_Case_Date_Details_If_Not_Exists]
   @s_a_DomainId varchar(50) = null
AS
BEGIN
	

	INSERT INTO tblCase_Date_Details
	(
		 Case_Id
		,DomainId		
		,CreatedBy
		,CreatedDate
	)
	SELECT DISTINCT
		c.Case_Id,
		c.DomainId,
		'',
		GETDATE()
	FROM 
		tblcase c
	WHERE 
		c.Case_Id not in (SELECT DISTINCT cd.Case_Id FROM tblCase_Date_Details cd)

END
GO
