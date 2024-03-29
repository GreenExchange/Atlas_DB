USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[MONTHLY_REPORT]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MONTHLY_REPORT](@FIRST_DATE SMALLDATETIME,@SECOND_DATE SMALLDATETIME)
AS
BEGIN
	CREATE TABLE #OMKAR2(USERNAME VARCHAR(20),SUIT_ID INT,IMAGES_COUNT INT,ANSWERID_COUNT INT,DISC_COUNT INT,AFF_SERV INT,DEFAULT_MOTION INT, USER_DATE1 SMALLDATETIME,USER_DATE2 SMALLDATETIME)
DECLARE
	@USERNAME VARCHAR(20)
END

DECLARE MYCUR CURSOR FAST_FORWARD LOCAL FOR
	SELECT USERNAME FROM ISSUETRACKER_USERS WHERE USERNAME LIKE 'OSW-%' AND USERNAME <> 'OSW-AVINASH'
OPEN MYCUR
	FETCH NEXT FROM MYCUR INTO @USERNAME
WHILE @@FETCH_STATUS=0

BEGIN
DECLARE
	@SUIT_ID INT,
	@IMAGES_COUNT INT,
	@ANSWERID_COUNT INT,
	@DISC_COUNT INT,
	@AFF_SERV INT,
	@DEFAULT_MOTION INT
	
	SET @SUIT_ID=0
	SET @IMAGES_COUNT=0
	SET @ANSWERID_COUNT=0
	SET @DISC_COUNT=0
	SET @AFF_SERV=0
	SET @DEFAULT_MOTION=0

select @SUIT_ID=count(distinct i.case_id)from tblcase c, tblimages i where c.case_id=i.case_id and c.status='open' and c.initial_status='lit' and c.date_opened BETWEEN @FIRST_DATE AND @SECOND_DATE and i.userid=@USERNAME group by i.userid order by i.userid asc
select @IMAGES_COUNT=count(distinct i.filename)from tblcase c, tblimages i where c.case_id=i.case_id and c.status='open' and c.initial_status='lit' and c.date_opened BETWEEN @FIRST_DATE AND @SECOND_DATE and i.userid=@USERNAME group by i.userid order by i.userid asc
select @ANSWERID_COUNT=count(distinct c.case_id) from tblcase c,tblimages i where c.case_id=i.case_id and i.documentid=15 and i.SCANDATE between @FIRST_DATE AND @SECOND_DATE  and i.userid=@USERNAME group by i.userid order by i.userid asc
Select @DISC_COUNT=count(distinct c.case_id)from tblcase c,tblnotes n Where c.Case_id=n.Case_id and n.NOTES_DATE between @FIRST_DATE AND @SECOND_DATE and n.notes_desc = 'Discovery demands completed and uploaded' and n.user_id=@USERNAME group by n.user_id order by n.user_id asc
select @AFF_SERV=count(distinct i.case_id) from tblcase c,tblimages i where c.case_id=i.case_id and i.documentid=9 and i.SCANDATE between @FIRST_DATE AND @SECOND_DATE and i.userid=@USERNAME group by i.userid order by i.userid asc
select @DEFAULT_MOTION=count(distinct c.case_id) from tblcase c,tblnotes n where c.case_id=n.case_id and c.status='DEFAULT DRAFTED'and n.notes_desc='Default motion completed' and n.NOTES_DATE between @FIRST_DATE AND @SECOND_DATE  and n.user_id=@USERNAME group by n.user_id order by n.user_id asc

INSERT INTO #OMKAR2 VALUES (UPPER(LTRIM(RTRIM(@USERNAME))),@SUIT_ID,@IMAGES_COUNT,@ANSWERID_COUNT,@DISC_COUNT,@AFF_SERV,@DEFAULT_MOTION,@FIRST_DATE,@SECOND_DATE)

FETCH NEXT FROM MYCUR INTO @USERNAME
END
CLOSE MYCUR
DEALLOCATE MYCUR
SELECT USERNAME,SUIT_ID,IMAGES_COUNT,ANSWERID_COUNT,DISC_COUNT,AFF_SERV,DEFAULT_MOTION FROM #OMKAR2 ORDER BY USERNAME ASC
DROP TABLE #OMKAR2
GO
