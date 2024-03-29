USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[dt_adduserobject]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
**	Add an object to the dtproperties table
*/
CREATE PROCEDURE [dbo].[dt_adduserobject]
as
	set nocount on
	/*
	** ALTER the user object if it does not exist already
	*/
	begin transaction
		insert dbo.dtproperties (property) VALUES ('DtgSchemaOBJECT')
		update dbo.dtproperties set objectid=@@identity 
			where id=@@identity and property='DtgSchemaOBJECT'
	commit
	return @@identity
GO
