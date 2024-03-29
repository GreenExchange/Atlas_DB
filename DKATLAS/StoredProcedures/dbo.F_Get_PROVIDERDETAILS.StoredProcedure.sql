USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_Get_PROVIDERDETAILS]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_Get_PROVIDERDETAILS]      
(
	@s_l_fromdate DATETIME,
	@s_l_todate DATETIME
)
AS  
	BEGIN    
		SELECT b.Provider_Name,COUNT(DISTINCT b.case_id) AS CASE_ID, COUNT(c.Case_ID) AS BILLS,SUM(b.Balance_Amount) AS BALANCE
		FROM LCJ_VW_CaseSearchDetails b inner join tblTreatment c ON b.Case_Id=c.Case_Id
		--WHERE B.Date_Opened BETWEEN @s_l_fromdate AND @s_l_todate
		WHERE cast(floor(convert( float,b.Date_Opened)) AS datetime)>= @s_l_fromdate and cast(floor(convert( float,b.Date_Opened)) AS datetime) <= @s_l_todate
		--WHERE month(b.date_opened) =8 and year(b.date_opened) =2013 and b.Provider_Name='Advanced Orthopaedics PLLC'
		 GROUP BY B.Provider_Name
		 
		 
	END
GO
