USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Get_BatchBreakDownDetail]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BatchBreakDownDetail] 
(
	@provider_id int,
	@fromdate int

)
  
AS
	select provider_id,box_rec_date,batch_no,max(no_of_cases) as no_of_cases 
	,isnull((select count(provider_id) from tblcase where provider_id=tblproviderboxdetails.provider_id 
	and batchcode=tblproviderboxdetails.batch_no 
	),0) as file_scanned,(max(no_of_cases)-isnull((select count(provider_id) from tblcase where provider_id=tblproviderboxdetails.provider_id 
	and batchcode=tblproviderboxdetails.batch_no 
	),0)) as file_pending from tblproviderboxdetails 
	where provider_id=@provider_id and file_pending>0 
	and datediff(m,box_rec_date,getdate())<=@fromdate
	group by provider_id,batch_no,box_rec_date
GO
