USE [DKATLAS]
GO
/****** Object:  View [dbo].[SJR_Treatment_view]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[SJR_Treatment_view]
as
SELECT     Case_Id, convert(varchar(20),DateOfService_Start) + ' - ' + convert(varchar(20),DateOfService_End) AS DOS
FROM         tblTreatment
GROUP BY Case_Id, convert(varchar(20),DateOfService_Start) + ' - ' + convert(varchar(20),DateOfService_End)
GO
