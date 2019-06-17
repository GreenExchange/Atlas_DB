USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[procimagelist_initialbilling_noaob]    Script Date: 6/17/2019 2:54:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[procimagelist_initialbilling_noaob]  
(  
@case_id varchar(50)  
)  
as  
begin  
create table #temp(fileName varchar(100))  
insert into #temp  
select  Replace(imagepath,'/','\') + '\' + filename from tblimages where documentid in (13) and case_id = @case_id and deleteflag = 0 order by imageid asc
insert into #temp  
select Replace(imagepath,'/','\') + '\' + filename from tblimages where documentid in (29) and case_id = @case_id  and deleteflag = 0 order by imageid asc 

select  * from #temp  
drop table #temp  
end
GO
