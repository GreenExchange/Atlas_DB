USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GETREMITTANCECHECKS]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GETREMITTANCECHECKS](
@DomainId NVARCHAR(50),
@dt1 datetime,
@dt2 datetime
)
as
begin
select  a.provider_id,provider_name,b.*,a.Provider_Name + 
ISNULL(N' [Group: ' + a.Provider_GroupName + N' ]', N'') AS ProviderName_Long,last_printed as lp ,
ISNULL(b.VENDOR_FEE,0.00) AS VENDOR_FEE

from tblprovider a 
inner join tblclientaccount b on a.provider_id=b.provider_id 
where
cast(floor(convert( float,b.account_date)) as datetime)>= @dt1 and cast(floor(convert( float,b.account_date)) as datetime) <= @dt2
and a.DomainId=@DomainId
AND Account_Id in (select Invoice_Id from tblTransactions WHERE DomainId = @DomainId)
order by provider_name,Last_Printed
END

GO
