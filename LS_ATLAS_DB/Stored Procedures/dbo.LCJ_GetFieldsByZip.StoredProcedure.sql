USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GetFieldsByZip]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GetFieldsByZip] --[LCJ_GetFieldsByZip] 'test',''
(
	@DomainId NVARCHAR(50),
	@ZipCode nvarchar(255)
)
 AS

 select 'NY' as City, '' as ST
 UNION
select City,ST from ZipList where ZipCode=@Zipcode --and DomainId=@DomainId

GO
