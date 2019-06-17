USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[EDIDATA]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[EDIDATA] AS
begin

INSERT into LCJEDI.dbo.EDIDATA
select Case_Id,injuredparty_name,Court_Name,Court_Venue,Provider_Name,
InsuranceCompany_Name,Indexoraaa_number,Date_Opened 
from LCJ.dbo.LCJ_VW_CaseSearchDetails where Datediff(d,Date_opened,getdate())=0 

end

GO
