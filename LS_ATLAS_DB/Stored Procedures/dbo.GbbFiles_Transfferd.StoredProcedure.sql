USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[GbbFiles_Transfferd]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- DROP PROCEDURE [dbo].[GbbFiles_Transfferd]

CREATE PROCEDURE [dbo].[GbbFiles_Transfferd]
(
	@Path  VARCHAR(2000),
	@NodeType  VARCHAR(50),
	@BasePathId int,
	@TransferFilePath  VARCHAR(2000),
	@BillNumber VARCHAR(50),
	@Gbb_Type VARCHAR(50)
)
AS
BEGIN

	INSERT INTO tblGbbDocuments_transfferd(Path, NodeType, BasePathId, TransferFilePath, BillNumber, Gbb_Type, Trnasfferd_Date)
	 VALUES(@Path, @NodeType, @BasePathId, @TransferFilePath, @BillNumber, @Gbb_Type, GETDATE())


END

GO
