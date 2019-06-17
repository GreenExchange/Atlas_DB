USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[AAA_PPO_OPEN_Cases]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AAA_PPO_OPEN_Cases]--[AAA_PPO_OPEN_Cases]'0','0','1'
(
@month varchar(10),
@year varchar(10),
@chk varchar(10)


)
AS
BEGIN
SET NOCOUNT ON
CREATE TABLE #TEMP(CASE_ID VARCHAR(50),AOB INT, BILLS INT, MEDICALS INT, Images int)

declare
@cid varchar(50)
DECLARE MYCUR CURSOR LOCAL FOR

select case_id from lcj_vw_Casesearchdetails where status ='AAA PPO OPEN'  ORDER BY DATE_OPENED

open MYCUR
fetch next from MYCUR into @cid
while @@fetch_status=0
begin
INSERT INTO #TEMP
SELECT @CID,(SELECT COUNT(*) FROM TBLIMAGES WHERE CASE_ID=@CID AND DOCUMENTID='11' and deleteflag=0 and documentid <> '-1'),
(SELECT COUNT(*) FROM TBLIMAGES WHERE CASE_ID=@CID AND DOCUMENTID='13' and deleteflag=0 and documentid <> '-1'),
(SELECT COUNT(*) FROM TBLIMAGES WHERE CASE_ID=@CID AND DOCUMENTID='29' and deleteflag=0 and documentid <> '-1'),
(SELECT COUNT(*) FROM TBLIMAGES WHERE CASE_ID=@CID AND deleteflag=0 and documentid <> '-1')

fetch next from MYCUR into @cid
end
CLOSE MYCUR
DEALLOCATE MYCUR
if @month = 0 and @year = 0 
begin
	if @chk = 1
		begin
			SELECT A.*,DATE_OPENED,INJUREDPARTY_NAME,PROVIDER_NAME,INSURANCECOMPANY_NAME FROM #TEMP A INNER JOIN LCJ_VW_CASESEARCHDETAILS B ON A.CASE_ID=B.CASE_ID where aob > 0 ORDER BY a.Images , AOB DESC,B.DATE_OPENED
		end
	else
		begin
			SELECT A.*,DATE_OPENED,INJUREDPARTY_NAME,PROVIDER_NAME,INSURANCECOMPANY_NAME FROM #TEMP A INNER JOIN LCJ_VW_CASESEARCHDETAILS B ON A.CASE_ID=B.CASE_ID ORDER BY a.Images , AOB DESC,B.DATE_OPENED
		end
		
	
		
end
else
begin
	if @chk = 1
		begin
			SELECT A.*,DATE_OPENED,INJUREDPARTY_NAME,PROVIDER_NAME,INSURANCECOMPANY_NAME FROM #TEMP A INNER JOIN LCJ_VW_CASESEARCHDETAILS B ON A.CASE_ID=B.CASE_ID where year(date_opened) = @year and month(date_opened) = @month and aob > 0 ORDER BY a.Images , AOB DESC,B.DATE_OPENED
		end
	else
		begin
			SELECT A.*,DATE_OPENED,INJUREDPARTY_NAME,PROVIDER_NAME,INSURANCECOMPANY_NAME FROM #TEMP A INNER JOIN LCJ_VW_CASESEARCHDETAILS B ON A.CASE_ID=B.CASE_ID where year(date_opened) = @year and month(date_opened) = @month ORDER BY a.Images , AOB DESC,B.DATE_OPENED
		end
		
		
end
DROP TABLE #TEMP

END

GO
