USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[dt_verstamp007]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
**	This procedure returns the version number of the stored
**    procedures used by the the Microsoft Visual Database Tools.
**	Version is 7.0.05.
*/
CREATE PROCEDURE [dbo].[dt_verstamp007]
as
	select 7005
GO
