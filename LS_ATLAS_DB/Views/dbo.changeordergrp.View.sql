USE [LS_ATLAS_DB]
GO
/****** Object:  View [dbo].[changeordergrp]    Script Date: 6/17/2019 2:29:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[changeordergrp]
AS
SELECT     Case_Id, InjuredParty_LastName, InjuredParty_FirstName, Policy_Number, Ins_Claim_Number, Accident_Date, Claim_Amount, Paid_Amount, 
                      Group_All, Caption, Group_Accident, Group_InsClaimNo, Group_PolicyNum, Group_ClaimAmt
FROM         dbo.tblCase
WHERE     (Group_Id IN
                          (SELECT     group_id
                            FROM          tblcase
                            WHERE      Case_Id LIKE '%250.119%'))
GO
