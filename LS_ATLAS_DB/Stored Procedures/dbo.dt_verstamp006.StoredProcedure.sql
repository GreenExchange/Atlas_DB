USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[dt_verstamp006]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
**	This procedure returns the version number of the stored
**    procedures used by legacy versions of the Microsoft
**	Visual Database Tools.  Version is 7.0.00.
*/
CREATE PROCEDURE [dbo].[dt_verstamp006]
as
	select 7000

GO
