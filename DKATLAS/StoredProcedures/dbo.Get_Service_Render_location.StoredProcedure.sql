USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Get_Service_Render_location]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Service_Render_location] 
--(
	--@provider_name varchar(100)
--)
  
AS  
BEGIN
	SELECT tp.Provider_Name,tp.provider_id,location_id, Location_Address,Location_City,Location_State,Location_Zip
	FROM MST_Service_Rendered_Location 
	LEFT OUTER JOIN  tblprovider tp on  dbo.MST_Service_Rendered_Location.provider_id = tp.provider_id
	where Location_Address not in ('Select Location')
End
GO
