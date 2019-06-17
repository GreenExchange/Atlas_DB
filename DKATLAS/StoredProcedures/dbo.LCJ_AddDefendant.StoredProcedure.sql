USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_AddDefendant]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_AddDefendant]
(

--Client_Id	nvarchar	no	100
@Defendant_Name		nvarchar(200),
@Defendant_Address		varchar(255),
@Defendant_City		varchar(100),
@Defendant_State		varchar(100),
@Defendant_Zip		varchar(50),
@Defendant_Phone		varchar(100),
@Defendant_Fax		varchar(100),
@Defendant_Email		varchar(100)

)
AS
BEGIN
	

		INSERT INTO tblDefendant
		(
		Defendant_Name,
		Defendant_DisplayName,
		Defendant_Address,
		Defendant_City,
		Defendant_State,
		Defendant_Zip,
		Defendant_Phone,
		Defendant_Fax,
		Defendant_Email

		)

		VALUES(
		@Defendant_Name,
		@Defendant_Name,		
		@Defendant_Address,
		@Defendant_City,
		@Defendant_State,
		@Defendant_Zip,
		@Defendant_Phone,
		@Defendant_Fax,
		@Defendant_Email
		)					


	
	
END
GO
