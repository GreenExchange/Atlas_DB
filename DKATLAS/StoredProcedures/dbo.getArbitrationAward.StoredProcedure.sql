USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[getArbitrationAward]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--getArbitrationAward @pid = '40654',@iid = '8626'

CREATE PROCEDURE  [dbo].[getArbitrationAward](
@pid varchar(50),
@iid int
)
as
begin

seLect * fRoM tblDocImages 
left outer join tblImageTag 
on tblDocImages.imageid=tblImageTag.imageid
left outer join tblTags 
on tblTags.NodeID = tblImageTag.TagID
inner join dbo.tbltransactions 
on tblTags.CaseID =tbltransactions.case_id 
where provider_id = @pid and invoice_id = @iid and transactions_type = 'C'
and NodeName ='Arbitration Awards'


end
GO
