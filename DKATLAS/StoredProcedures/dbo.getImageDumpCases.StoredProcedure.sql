USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[getImageDumpCases]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getImageDumpCases]
as
select * from tblimages where case_id in 
(select top 500  a.case_id from tblimages a inner join tblcase b 
on a.case_id=b.case_id where documentid in (11,12,13,14,23,29) 
and b.status in ('closed') order by date_opened desc
) order by case_id,documentid
GO
