USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[GetAllNodes]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllNodes]  	







(







   @RoleId As INT







)







AS







BEGIN	







	SET NOCOUNT ON;







    







    SELECT NodeID,NodeName FROM dbo.MST_DOCUMENT_NODES WHERE NodeID not in(select NodeID from tbl_node_role where roleid=@RoleId) 







END
GO
