USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_LocationAdd]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_LocationAdd]
as
begin
select distinct a.Location_Id,a.location_address from mst_service_rendered_location a inner join tblcase b on b.location_id=a.Location_Id where 1=1 order by a.Location_Id 
end
GO
