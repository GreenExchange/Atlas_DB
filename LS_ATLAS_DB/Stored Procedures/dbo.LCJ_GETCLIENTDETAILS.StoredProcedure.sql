USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_GETCLIENTDETAILS]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_GETCLIENTDETAILS]
(
@DomainId NVARCHAR(50),
@clientid varchar(50)
)
AS

select tblprovider.* ,ISNULL(LawFirmName,'') AS LawFirmName
,ISNULL(Client_Billing_Address,'') AS Client_Billing_Address
,ISNULL(Client_Billing_City,'') AS Client_Billing_City
,ISNULL(Client_Billing_State,'') AS Client_Billing_State
,ISNULL(Client_Billing_Zip ,'') AS Client_Billing_Zip
,ISNULL(Client_Billing_Phone,'') AS Client_Billing_Phone
,ISNULL(Client_Billing_Fax,'') AS Client_Billing_Fax
,ISNULL(client_header,'') AS client_header
 from tblprovider 
left outer join tbl_Client ON tbl_Client.DomainId = tblprovider.DomainId 
where PROVIDER_ID=@clientid and tblprovider.DomainId=@DomainId

GO
