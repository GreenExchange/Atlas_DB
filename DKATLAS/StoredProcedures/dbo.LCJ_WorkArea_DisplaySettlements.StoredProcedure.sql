USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_WorkArea_DisplaySettlements]    Script Date: 6/17/2019 2:54:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_WorkArea_DisplaySettlements] --[LCJ_WorkArea_DisplaySettlements] 'RFA14-170415'  
(    
@Case_Id NVARCHAR(300)    
)    
AS    
Select  b.Case_Id, a.Provider_Name, a.InjuredParty_Name, a.InsuranceCompany_Name,a.IndexOrAAA_Number,  
Claim_Amount, Paid_Amount,((Cast(Claim_Amount as money))-(cast(Paid_Amount as money))) as Balance,a.Status, b.Settlement_Amount, 
b.Settlement_Int,b.Settlement_Af, b.Settlement_Ff, b.Settlement_Total, b.Settlement_Date, b.SettledWith,b.User_id from LCJ_VW_CaseSearchDetails a inner  
 join tblsettlements b on a.case_id=b.case_id WHERE a.Case_Id = + @Case_Id
 
 --select distinct Case_Id from tblsettlements where Case_Id='RFA14-170415'
 --select Case_Id,* from LCJ_VW_CaseSearchDetails where Case_Id='RFA14-170415'
GO
