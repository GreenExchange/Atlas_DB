USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetFieldsByZip]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_GetFieldsByZip]
(
	@ZipCode nvarchar(255)
)
 AS

select City,ST from ZipList where ZipCode=@Zipcode
GO
