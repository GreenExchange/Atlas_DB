USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[GetRoleNodes]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRoleNodes] --1







(







   @RoleId AS INT







) 	







AS







BEGIN	







	SET NOCOUNT ON;







    SELECT DN.NodeID,NodeName FROM dbo.MST_DOCUMENT_NODES DN INNER JOIN tbl_node_role ND







    ON DN.NodeID =ND.NodeID WHERE roleid=@RoleId ORDER BY NodeName







END
GO
