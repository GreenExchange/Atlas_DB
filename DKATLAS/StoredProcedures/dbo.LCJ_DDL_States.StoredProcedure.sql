USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_States]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[LCJ_DDL_States]
	
AS

BEGIN
create table #temp(State_Abr varchar(50), State_Name varchar(100))
insert into #temp VALUES ('NY','NY')
insert into #temp VALUES ('New Jersey','New Jersey')

insert into #temp 
SELECT   State_Abr, State_Name FROM tblStates ORDER BY 1 asc
SELECT * FROM #temp 
END
GO
