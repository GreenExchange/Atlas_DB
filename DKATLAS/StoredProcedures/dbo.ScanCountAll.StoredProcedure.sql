USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[ScanCountAll]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ScanCountAll] (@Case_Id varchar(50) )
as
begin
declare
 @st varchar(200),
 @cn int,
 @doc_id int,
 @doc_name varchar(40)
 create table #doctype (document_id int,document_type varchar(100),cnt int)
 set @cn = 0
 DECLARE docid CURSOR FOR
  select document_id,document_Type  from tblDocumentType order by document_Type asc
 open docid
 
 FETCH NEXT FROM docid into @doc_id,@doc_name
 WHILE @@FETCH_STATUS = 0
 BEGIN
     Insert into #doctype values (@doc_id,@doc_name,@cn)
 FETCH NEXT FROM docid into @doc_id,@doc_name
 END
 
CLOSE docid
DEALLOCATE docid
select * from #doctype order by document_id asc
drop table #doctype
end
GO
