USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[tickets_sp_ddl_priority]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[tickets_sp_ddl_priority]
AS
BEGIN
	SELECT
		i_priority_id [ID],
		sz_priority [Text] 
	FROM mst_ticket_priority 
	ORDER BY i_ddl_sequence ASC
END
GO
