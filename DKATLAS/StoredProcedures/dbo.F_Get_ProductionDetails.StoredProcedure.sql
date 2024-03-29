USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_Get_ProductionDetails]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_Get_ProductionDetails]     --[dbo].[F_Get_ProductionDetails] '08/01/2013','08/31/2013'
(
	@s_l_fromdate DATETIME,
	@s_l_todate DATETIME
)
AS  
	BEGIN    
				select  A.USER_ID,COUNT( DISTINCT A.case_id) as CASE_ID,SUM(B.Balance_Amount)as BALANCE,count( c.Case_Id) as BILLS,
				DATENAME(dw,Notes_Date)+','+CONVERT(VARCHAR, Notes_Date, 106) as NameOfDay,DAY(Notes_Date) AS DAY
				from tblNotes A INNER JOIN LCJ_VW_CaseSearchDetails B ON A.Case_Id=B.CASE_ID
				inner join tblTreatment c on b.Case_Id=c.Case_Id
				where Notes_Desc like '%Case Opened%'
				AND cast(floor(convert( float,Notes_Date)) AS datetime)>= @s_l_fromdate and cast(floor(convert( float,Notes_Date)) AS datetime) <= @s_l_todate
				GROUP BY A.USER_ID,	DATENAME(dw,Notes_Date)+','+CONVERT(VARCHAR, Notes_Date, 106),DAY(Notes_Date) 
				ORDER BY DATENAME(dw,Notes_Date)+','+CONVERT(VARCHAR, Notes_Date, 106) ASC
	END
GO
