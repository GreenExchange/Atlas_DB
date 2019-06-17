USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_NODENAME_USING_NODEID]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_NODENAME_USING_NODEID] -- '89', 'ReqVeri'
@SZ_NODE_ID NVARCHAR(20),
@flag nvarchar (20)
AS
BEGIN
	if	@flag = 'DocMgr'
	begin
		SELECT NodeName FROM tblTags WHERE NodeID = @SZ_NODE_ID
	end
	else
	begin
		select SZ_NODE_NAME from MST_NODES where I_NODE_ID = @SZ_NODE_ID
	end
END

GO
