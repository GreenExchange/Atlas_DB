USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[get_batch_type]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_batch_type]
	 @DomainID	varchar(50)
AS
BEGIN	
	SELECT
		ID,
		Name
	from 
		tbl_batch_type
	order by
		Name ASC
END
GO
