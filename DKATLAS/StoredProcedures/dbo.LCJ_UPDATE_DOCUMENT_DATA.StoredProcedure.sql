USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_UPDATE_DOCUMENT_DATA]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_UPDATE_DOCUMENT_DATA]
(
		@documentID NVARCHAR(20),
		@imageID INT
)

AS
	update tblImages set DocumentID=@documentID where imageid=@imageID
GO
