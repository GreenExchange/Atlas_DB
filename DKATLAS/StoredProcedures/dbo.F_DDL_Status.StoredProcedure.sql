USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_DDL_Status]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_DDL_Status] 
--(
--	@DomainID VARCHAR(50)
--)	
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT '0' as Status_Id,' ---Select  Status--- ' as Status_Type, ''  as Status_Value
	UNION
	SELECT Status_Id AS Status_Id, Status_Type as Status_Type, Status_Type as Status_Value FROM tblStatus WHERE Status_Type not like '%select%' and Status_Id <> 0-- AND DomainID = @DomainID
	 ORDER BY Status_Type
	
	SET NOCOUNT OFF ; 

END
GO
