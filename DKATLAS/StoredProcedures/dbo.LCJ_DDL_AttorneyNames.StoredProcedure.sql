USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_AttorneyNames]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_AttorneyNames]  
/*  
 (  
  @parameter1 datatype = default value,  
  @parameter2 datatype OUTPUT  
 )  
*/  
AS  
CREATE TABLE #tmpAttorney  
 (Attorney_Id nvarchar(200), Attorney_Name varchar(200))  
insert into #tmpAttorney values(0,'...Select Attorney...')  
begin  
insert into #tmpAttorney  
SELECT   
Attorney_Id, Ltrim(Upper(ISNULL(Attorney_FirstName, '') + ' ' +  ISNULL(Attorney_LastName, ''))+'=>[ATT.PH#'+ ISNULL(attorney_phone,'')+']'+'=>[ATT.FAX#'+ ISNULL(attorney_fax,'')+']'+'=>[Company#'+ ISNULL(Attorney_Address,'')+']')  
AS   
Attorney_Name  
FROM         tblAttorney  
WHERE  
(1 = 1 ) ORDER BY ATTORNEY_FIRSTNAME ASC-- AND (LastName <> '= ""') AND (FirstName <> '= ""')  
  
select Attorney_Id, Attorney_Name from #tmpAttorney order by Attorney_Name  
end
GO
