USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GETCLIENTDETAILS_GROUP]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_GETCLIENTDETAILS_GROUP]
(
	@dt1 datetime,
	@dt2 datetime,
	@provider_group varchar(50)       
)
AS

SELECT * FROM TBLPROVIDER WHERE Provider_id in 
	(select Provider_Id from tblclientaccount 
	where Provider_id in (select distinct Provider_Id from tblProvider where Provider_GroupName =@provider_group)
	and cast(floor(convert( float,account_date)) as datetime)>= @dt1
	and cast(floor(convert( float,account_date)) as datetime) <= @dt2)

GO
