USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[getProviderChecksIDForScan]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[getProviderChecksIDForScan]--getProviderChecksIDForScan 'FH13-163690'
(
@s_a_case_id varchar(50)
)
as
begin



EXEC sp_createDefaultDocTypesForTree   @s_a_case_id, @s_a_case_id



	SELECT
		max(NodeID) as NodeID		
	FROM 
		tblTags 
	WHERE Nodename = 'PAYMENTS - PROVIDER' AND CaseID= @s_a_case_id

end
GO
