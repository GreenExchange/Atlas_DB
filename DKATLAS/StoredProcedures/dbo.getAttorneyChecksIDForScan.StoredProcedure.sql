USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[getAttorneyChecksIDForScan]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[getAttorneyChecksIDForScan]--getAttorneyChecksIDForScan 'FH07-42372'
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
	WHERE Nodename = 'PAYMENTS - ATTORNEY' AND CaseID= @s_a_case_id
	select Nodename,* from tblTags
end
GO
