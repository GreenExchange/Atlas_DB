USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_DOCUMENT_TYPES]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_DOCUMENT_TYPES]
AS
select * from tbldocumenttype order by document_type

GO
