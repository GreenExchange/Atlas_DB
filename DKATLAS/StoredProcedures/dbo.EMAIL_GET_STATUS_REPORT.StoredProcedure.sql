USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[EMAIL_GET_STATUS_REPORT]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EMAIL_GET_STATUS_REPORT]
AS
BEGIN
	select Status,COUNT(*) as [Count of Cases] from tblcase
	where Status like 'AAA%'
	group by Status
	ORDER BY STATUS

	select 'Total:' as Status,COUNT(*) as [Total Cases] from tblcase
	where Status like 'AAA%' 
END
GO
