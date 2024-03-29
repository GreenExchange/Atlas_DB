USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[GET_TEMPLATE_BYUSERID]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GET_TEMPLATE_BYUSERID] --[GET LATE_BYUSERID] ''
	@DomainId NVARCHAR(50),
	@USER_TYPE NVARCHAR(100)
AS
BEGIN
	SELECT 
		T.I_TEMPLATE_ID,T.SZ_TEMPLATE_NAME 
	FROM 
		MST_TEMPLATES T
		WHERE T.DomainId=@DomainId
	--	LEFT OUTER JOIN
	--	TXN LATES_ACCESS A
	--	ON T.I LATE_ID = A.TEMPLATE_ID
	--WHERE
	--	USER_TYPE = @USER_TYPE
	order by SZ_TEMPLATE_NAME 
END
GO
