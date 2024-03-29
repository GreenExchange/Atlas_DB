USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_Get_USERDETAILS]    Script Date: 6/17/2019 2:54:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[F_Get_USERDETAILS]      
(
	@s_l_fromdate DATETIME,
	@s_l_todate DATETIME
)
AS  
	BEGIN    
	select  A.USER_ID,COUNT( DISTINCT A.case_id) as CASE_ID,count( c.Case_Id) as BILLS,SUM(B.Balance_Amount)as BALANCE
		from tblNotes A INNER JOIN LCJ_VW_CaseSearchDetails B ON A.Case_Id=B.CASE_ID
		inner join tblTreatment c on b.Case_Id=c.Case_Id	
		where Notes_Desc like '%Case Opened%'
		--AND A.Notes_Date BETWEEN @s_l_fromdate AND @s_l_todate
		AND cast(floor(convert( float,Notes_Date)) AS datetime)>= @s_l_fromdate and cast(floor(convert( float,Notes_Date)) AS datetime) <= @s_l_todate
		--AND YEAR(Notes_Date)=2013 and month(Notes_Date)=8 
	    GROUP BY A.USER_ID 
	END
GO
