USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DeleteNotesType]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  Stored Procedure dbo.LCJ_DeleteNotesType    Script Date: 3/14/2008 9:52:10 AM ******/




CREATE PROCEDURE [dbo].[LCJ_DeleteNotesType]
(

@Notes_Type nvarchar(300)

)


AS
DELETE from tblNotesType where Notes_Type = + Rtrim(Ltrim(@Notes_Type))

GO
