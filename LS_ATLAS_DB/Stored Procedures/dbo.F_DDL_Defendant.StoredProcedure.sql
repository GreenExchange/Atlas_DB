USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_Defendant]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_Defendant]
(
	@DomainID VARCHAR(50)
)
AS
BEGIN

	SET NOCOUNT ON;

	Declare @CompanyType varchar(150)=''
	Select TOP 1 @CompanyType = LOWER(LTRIM(RTRIM(CompanyType))) from tbl_Client(NOLOCK) Where DomainId=@DomainID

	Declare @Defendant_Name varchar(150) =' ---Select Defendant--- ';
	
	IF @CompanyType = 'funding'
	BEGIN
	   SET @Defendant_Name = ' ---Select Opposing Counsel--- ';
	END

	IF @CompanyType != 'funding'
	BEGIN
		SELECT '0' as Defendant_ID, @Defendant_Name as Defendant_Name, @Defendant_Name as  DEFENDANT_DISPLAYNAME
		UNION
		SELECT Defendant_id, Defendant_Name as Defendant_Name, DEFENDANT_DISPLAYNAME
		FROM tblDefendant WHERE Defendant_Name not like '%select%' and Defendant_id <> 0 and Defendant_Name <> '' and DomainID = @DomainID
		ORDER BY Defendant_Name
	END
	ELSE
	BEGIN
	  SELECT '0' as Defendant_ID, @Defendant_Name as Defendant_Name, @Defendant_Name as  DEFENDANT_DISPLAYNAME
	  UNION
	  Select AM.Attorney_Id as Defendant_ID, ISNULL(AM.Attorney_FirstName,'') + ' ' + ISNULL(AM.Attorney_LastName,'') AS Defendant_Name, ISNULL(AM.Attorney_FirstName,'') + ' ' + ISNULL(AM.Attorney_LastName,'') AS DEFENDANT_DISPLAYNAME
	  from tblAttorney_Master AM (NOLOCK) INNER JOIN 
	  tblAttorney_Type ATP ON AM.Attorney_Type_Id = ATP.Attorney_Type_ID
	  Where AM.DomainId = @DomainId and LOWER(Attorney_Type) = 'opposing counsel'
	END
	SET NOCOUNT OFF ; 


END

GO
