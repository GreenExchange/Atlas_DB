USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[getProviderChecks]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--getProviderChecks @pid = '40753',@iid = '8623'

CREATE PROCEDURE [dbo].[getProviderChecks](
@DomainId NVARCHAR(50),
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
and NodeName ='PAYMENTS - PROVIDER'
and tblDocImages.imageid not in(295161,293736)
and tblDocImages.DomainId=@DomainId

end

GO
