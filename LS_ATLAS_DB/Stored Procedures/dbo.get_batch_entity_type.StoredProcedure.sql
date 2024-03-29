USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[get_batch_entity_type]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_batch_entity_type]
	@DomainID	varchar(50)
AS
BEGIN	
    
	Declare @CompanyType varchar(150)=''
    Select TOP 1 @CompanyType =  LOWER(LTRIM(RTRIM(CompanyType))) from tbl_Client(NOLOCK) Where DomainId=@DomainID

	SELECT
		ID,
		Name
	from 
		tbl_batch_entity_type 
	Where
	(@CompanyType = 'funding' and Lower(Name) != 'defendant' and Lower(Name)!='adversary attorney')
	OR
	(@CompanyType != 'funding' and Lower(Name) != 'opposing counsel')
	order by
		Name ASC
END

GO
