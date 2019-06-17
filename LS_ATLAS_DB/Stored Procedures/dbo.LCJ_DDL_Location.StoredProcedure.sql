USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_Location]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_Location]
@DomainId NVARCHAR(50)
AS


BEGIN
	
	select Location_Id, isnull (Location_Address,'') +', '+isnull (Location_City,'')+', '+isnull (Location_State,'')+ ' '+isnull (Location_Zip,'') as addresss  from MST_Service_Rendered_Location WHERE DomainId=@DomainId

END

GO
