USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[delete_Service_render_location]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[delete_Service_render_location] --'5'
	@location_id int

AS
BEGIN
	If((select count(*) from tblcase where location_id = @location_id) = 0)
	begin
		delete MST_Service_Rendered_Location 
		where location_id = @location_id
	end
	
END
GO
