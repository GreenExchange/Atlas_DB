USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GETCLIENTDETAILS_GroupNew]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[LCJ_GETCLIENTDETAILS_GroupNew]
(
@clientid varchar(50)
)
AS

select * from tblprovider where Provider_GroupName=@clientid
GO
