USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_DDL_SettlementScreen_AdjusterNames]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LCJ_DDL_SettlementScreen_AdjusterNames]
@DomainId NVARCHAR(50)
AS

begin

	SELECT '0' AS Adjuster_Id, ' --- Select Adjuster --- ' AS Adjuster_Name_Details
	UNION
	SELECT    Adjuster_Id, Upper(ISNULL(Adjuster_FirstName + ' ' + Adjuster_LastName, '') + ' =>' + '[Adj.Ph#: ' + Adjuster_Phone +' / ' + 'Ins.Cpy: ' + ISNULL(InsuranceCompany_Name, '') + ' / ' + 'Adj fax#: ' + Adjuster_Fax + ']') AS Adjuster_Name_Details
	FROM         tbladjusters INNER JOIN  tblinsurancecompany on tbladjusters.insurancecompany_id=tblinsurancecompany.insurancecompany_id
	WHERE     (1 = 1 ) and tbladjusters.DomainId=@DomainId order by 2 -- AND (LastName <> '= ""') AND (FirstName <> '= ""')

	
end

GO
