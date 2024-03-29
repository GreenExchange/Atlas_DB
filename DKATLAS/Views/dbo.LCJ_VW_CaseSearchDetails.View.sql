USE [DKATLAS]
GO
/****** Object:  View [dbo].[LCJ_VW_CaseSearchDetails]    Script Date: 6/17/2019 2:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[LCJ_VW_CaseSearchDetails]
AS
SELECT DISTINCT 
                      dbo.tblProvider.Provider_Name, dbo.tblProvider.Provider_Suitname, dbo.tblCourt.Court_Name, dbo.tblInsuranceCompany.InsuranceCompany_Name, 
                      dbo.tblStatus.Final_Status,dbo.tblStatus.forum, dbo.tblcase.fhkp_status, ISNULL(dbo.tblcase.InjuredParty_FirstName, N'') + N'  ' + ISNULL(dbo.tblcase.InjuredParty_LastName, N'') 
                      AS InjuredParty_Name, ISNULL(dbo.tblAttorney.Attorney_FirstName, N'') + N'  ' + ISNULL(dbo.tblAttorney.Attorney_LastName, N'') AS Attorney_Name, 
                      ISNULL(dbo.tblcase.InsuredParty_FirstName, N'') + N'  ' + ISNULL(dbo.tblcase.InsuredParty_LastName, N'') AS InsuredParty_Name, 
                      ISNULL(dbo.tblAdjusters.Adjuster_FirstName, N'') + N'  ' + ISNULL(dbo.tblAdjusters.Adjuster_LastName, N'') AS Adjuster_Name, dbo.tblcase.Case_Id, 
                      dbo.tblcase.Caption, dbo.tblcase.Provider_Id, dbo.tblcase.InsuranceCompany_Id, dbo.tblcase.InjuredParty_LastName, dbo.tblcase.InjuredParty_FirstName, 
                      dbo.tblcase.InjuredParty_Address, dbo.tblcase.InjuredParty_City, dbo.tblcase.InjuredParty_State, dbo.tblcase.InjuredParty_Zip, dbo.tblcase.InjuredParty_Phone, 
                      dbo.tblcase.InjuredParty_Misc, dbo.tblcase.InsuredParty_LastName, dbo.tblcase.InsuredParty_FirstName, dbo.tblcase.InsuredParty_Address, 
                      dbo.tblcase.InsuredParty_City, dbo.tblcase.InsuredParty_State, dbo.tblcase.InsuredParty_Zip, dbo.tblcase.InsuredParty_Misc, dbo.tblcase.Accident_Date, 
                      dbo.tblcase.Denial_Date, dbo.tblcase.Accident_Address, dbo.tblcase.Accident_City, dbo.tblcase.Accident_State, dbo.tblcase.Accident_Zip, dbo.tblcase.Policy_Number,dbo.tblcase.filing_batchcode, 
                      dbo.tblcase.Ins_Claim_Number, dbo.tblcase.IndexOrAAA_Number, dbo.tblcase.Status, dbo.tblcase.Defendant_Id, dbo.tblcase.Date_Opened, dbo.tblcase.Last_Status, 
                      dbo.tblcase.Initial_Status, dbo.tblcase.Old_Status, dbo.tblcase.Memo, dbo.tblcase.InjuredParty_Type, dbo.tblcase.InsuredParty_Type, dbo.tblcase.Adjuster_Id, 
                      dbo.tblcase.DenialReasons_Type, dbo.tblcase.Court_Id, dbo.tblcase.Group_Data, dbo.tblcase.Attorney_FileNumber, dbo.tblcase.Attorney_Id, dbo.tblcase.Group_Id, 
                      ISNULL(dbo.tblcase.Assigned_Attorney, '') AS Assigned_Attorney, dbo.tblcase.Date_Status_Changed, dbo.tblAdjusters.Adjuster_LastName, 
                      dbo.tblAdjusters.Adjuster_FirstName, dbo.tblAdjusters.Adjuster_Phone, dbo.tblAdjusters.Adjuster_Fax, dbo.tblAdjusters.Adjuster_Email, 
                      dbo.tblProvider.Provider_Type, dbo.tblProvider.Provider_Local_City, dbo.tblProvider.Provider_Local_Address, dbo.tblProvider.Provider_Local_State, 
                      dbo.tblProvider.Provider_Local_Zip, dbo.tblProvider.Provider_Local_Phone, dbo.tblProvider.Provider_Local_Fax, dbo.tblProvider.Provider_Contact, 
                      dbo.tblProvider.Provider_Perm_Address, dbo.tblProvider.Provider_Perm_City, dbo.tblProvider.Provider_Perm_State, dbo.tblProvider.Provider_Perm_Zip, 
                      dbo.tblProvider.Provider_Perm_Phone, dbo.tblProvider.Provider_Perm_Fax, dbo.tblProvider.Provider_Email, dbo.tblProvider.Provider_Billing, 
                      dbo.tblInsuranceCompany.InsuranceCompany_Type, dbo.tblInsuranceCompany.InsuranceCompany_Local_City, 
                      dbo.tblInsuranceCompany.InsuranceCompany_Local_Address, dbo.tblInsuranceCompany.InsuranceCompany_Local_State, 
                      dbo.tblInsuranceCompany.InsuranceCompany_Local_Zip, dbo.tblInsuranceCompany.InsuranceCompany_Local_Phone, 
                      dbo.tblInsuranceCompany.InsuranceCompany_Local_Fax, dbo.tblInsuranceCompany.InsuranceCompany_Perm_Address, 
                      dbo.tblInsuranceCompany.InsuranceCompany_Perm_City, dbo.tblInsuranceCompany.InsuranceCompany_Perm_State, 
                      dbo.tblInsuranceCompany.InsuranceCompany_Perm_Zip, dbo.tblInsuranceCompany.InsuranceCompany_Perm_Phone, 
                      dbo.tblInsuranceCompany.InsuranceCompany_Perm_Fax, dbo.tblInsuranceCompany.InsuranceCompany_Contact, 
                      dbo.tblInsuranceCompany.InsuranceCompany_Email, dbo.tblCourt.Court_Venue, dbo.tblCourt.Court_Address, dbo.tblCourt.Court_Basis, dbo.tblCourt.Court_Misc, 
                      dbo.tblAttorney.Attorney_LastName, dbo.tblAttorney.Attorney_FirstName, dbo.tblAttorney.Attorney_Address, dbo.tblAttorney.Attorney_City, 
                      dbo.tblAttorney.Attorney_State, dbo.tblAttorney.Attorney_Zip, dbo.tblAttorney.Attorney_Phone, dbo.tblAttorney.Attorney_Fax, dbo.tblAttorney.Attorney_Email, 
                      dbo.tblDefendant.Defendant_Name, dbo.tblDefendant.Defendant_Address, dbo.tblDefendant.Defendant_State, dbo.tblDefendant.Defendant_Zip, 
                      dbo.tblDefendant.Defendant_Phone, dbo.tblDefendant.Defendant_Fax, dbo.tblDefendant.Defendant_Email, dbo.tblDefendant.Defendant_City, 
                      dbo.tblcase.Date_Answer_Received, dbo.tblcase.Date_Summons_Sent_Court, dbo.tblcase.Date_Summons_Printed, dbo.tblcase.DateNotice_TrialFiled, 
                      dbo.tblcase.DateFile_Trial_DeNovo, dbo.tblcase.DateAAA_packagePrinting, dbo.tblcase.DateAAA_ResponceRecieved, dbo.tblcase.Date_Bill_Submitted, 
                      dbo.tblcase.Date_Index_Number_Purchased, dbo.tblcase.Date_Afidavit_Filed, dbo.tblcase.Date_Ext_Of_Time, dbo.tblcase.Plaintiff_Discovery_Due_Date, 
                      dbo.tblcase.Defendant_Discovery_Due_Date, dbo.tblcase.Motion_Date, dbo.tblcase.Trial_Date, dbo.tblcase.Case_Billing, CONVERT(varchar(12), 
                      dbo.tblcase.DateOfService_Start, 1) AS DateOfService_Start, CONVERT(varchar(12), dbo.tblcase.DateOfService_End, 1) AS DateOfService_End, 
                      dbo.tblcase.Claim_Amount, dbo.tblcase.Paid_Amount, dbo.tblcase.Date_BillSent, dbo.tblSettlements.Settlement_Id, dbo.tblSettlement_Type.Settlement_Type, 
                      ISNULL(dbo.tblSettlements.Settled_With_Name, N'') AS Settled_With_Name, Settled_Percent, ISNULL(SUBSTRING(dbo.tblSettlements.Settled_With_Name, 0, CHARINDEX(' ', 
                      LTRIM(RTRIM(dbo.tblSettlements.Settled_With_Name)), 0)), N'') AS Settled_With_First_Name, ISNULL(dbo.tblSettlements.Settled_With_Phone, N'') 
                      AS Settled_With_Phone, ISNULL(dbo.tblSettlements.Settled_With_Fax, N'') AS Settled_With_Fax, dbo.tblSettlements.Settlement_Amount, 
                      dbo.tblSettlements.Settlement_Int, dbo.tblSettlements.Settlement_Af, dbo.tblSettlements.Settlement_Ff, dbo.tblSettlements.Settlement_Total, CONVERT(MONEY, 
                      ISNULL(dbo.tblSettlements.Settlement_Amount, 0)) + CONVERT(MONEY, ISNULL(dbo.tblSettlements.Settlement_Int, 0)) AS Settlement_PI, Settled_by,
                      dbo.tblSettlements.Settlement_Date, dbo.tblSettlements.SettledWith, dbo.tblSettlements.Settlement_Rfund_PR, dbo.tblSettlements.Settlement_Rfund_Int, 
                      dbo.tblSettlements.Settlement_Rfund_Total, dbo.tblSettlements.Settlement_Rfund_date, dbo.tblSettlements.Settlement_Rfund_Batch, 
                      dbo.tblcase.Date_Answer_Expected, dbo.tblcase.Reply_Date, dbo.tblcase.Calendar_Part, dbo.tblcase.Motion_Type, dbo.tblcase.Whose_Motion, 
                      dbo.tblcase.Defense_Opp_Due, dbo.tblcase.XMotion_Type, dbo.tblcase.Group_ClaimAmt, dbo.tblcase.Group_PaidAmt, dbo.tblcase.Group_Balance, 
                      dbo.tblcase.Group_InsClaimNo, dbo.tblcase.Group_All, dbo.tblcase.Group_All AS Group_Case, dbo.tblcase.Date_Packeted, dbo.tblcase.Group_Accident, 
                      dbo.tblcase.Group_PolicyNum, dbo.tblcase.GROUP_CASE_SEQUENCE, dbo.tblcase.Case_Code, dbo.tblcase.Provider_Code, dbo.tblcase.InsuranceCompany_Code, 
                      dbo.tblcase.Our_Discovery_Responses, dbo.tblcase.Our_Discovery_Demands, dbo.tblcase.Their_SJ_Motion_Activity, dbo.tblcase.Our_SJ_Motion_Activity, 
                      dbo.tblcase.Date_Ext_Of_Time_2, dbo.tblcase.Case_AutoId, dbo.tblInsuranceCompany.InsuranceCompany_SuitName, dbo.tblSettlements.User_Id, 
                      dbo.tblSettlements.Settlement_Notes, dbo.tblcase.Date_Ext_Of_Time_3, dbo.tblcase.Served_On_Date, dbo.tblcase.Served_On_Time, dbo.tblcase.Date_Closed, 
                      dbo.tblcase.stips_signed_and_returned_2, dbo.tblcase.stips_signed_and_returned_3, dbo.tblProvider.Provider_Contact2, dbo.tblProvider.Provider_IntBilling, 
                      dbo.tblProvider.Invoice_Type, dbo.tblProvider.cost_balance, dbo.tblProvider.Provider_Notes, dbo.tblProvider.Provider_ReferredBy, dbo.tblcase.Notary_id, 
                      dbo.NotaryPublic.NotaryPublicID, dbo.NotaryPublic.NPFirstName, dbo.NotaryPublic.NPMiddle, dbo.NotaryPublic.NPLastName, dbo.NotaryPublic.NPCounty, 
                      dbo.NotaryPublic.NPRegistrationNo, dbo.NotaryPublic.NPExpDate, dbo.tblProvider.Provider_TaxID, dbo.tblProvider.Provider_President, 
                      dbo.tblProvider.Billing_Manager, dbo.tblProvider.Provider_FF, dbo.tblProvider.Provider_ReturnFF, dbo.tblProvider.provider_Rfunds, 
                      dbo.tblcase.Date_Demands_Printed, dbo.tblcase.Date_Disc_Conf_Letter_Printed, dbo.tblcase.Date_Reply_To_Disc_Conf_Letter_Recd, 
                      dbo.tblcase.stips_signed_and_returned, dbo.tblprocessserver.psid, dbo.tblprocessserver.psfirstname, dbo.tblprocessserver.pslastname, 
                      ISNULL('LIC#: ' + dbo.tblprocessserver.pslicense, N'') AS pslicense, dbo.tblSettlements.Treatment_Id, CONVERT(money, ISNULL(dbo.tblcase.Claim_Amount, 0)) 
                      - CONVERT(float, ISNULL(dbo.tblcase.Paid_Amount, 0)) AS Balance_Amount, ISNULL((CONVERT(float, dbo.tblcase.Claim_Amount) - CONVERT(float, 
                      dbo.tblcase.Paid_Amount)) * 0.8, N'') AS ClaimAmountPercentage, dbo.tblprocessserver.psfirstname + ' ' + dbo.tblprocessserver.pslastname AS Process_Server, 
                      --dbo.tblServed.Name AS Served_To_Name, dbo.tblServed.Name AS Served_Name, dbo.tblServed.Age AS Served_Age, dbo.tblServed.Weight AS Served_Weight, 
                      --dbo.tblServed.Height AS Served_Height, dbo.tblServed.skin AS Served_Skin, dbo.tblServed.hair AS Served_Hair, dbo.tblServed.sex AS Served_Sex, 
                      ISNULL(dbo.tblProvider.Provider_GroupName, '') AS Provider_GroupName, dbo.tblInsuranceCompany.Active, dbo.tblProvider.Provider_Collection_Agent, 
                      dbo.tblcase.Served_To, dbo.tblInsuranceCompany.InsuranceCompany_GroupName, dbo.tblcase.INSURANCECOMPANY_INITIAL_ADDRESS, 
                      dbo.tblcase.Representetive, dbo.tblcase.Representative_Contact_Number, 
                      dbo.tblProvider.Provider_Name + ISNULL(N' [Group: ' + dbo.tblProvider.Provider_GroupName + N' ]', N'') AS ProviderName_Long, dbo.tblProvider.Active AS Expr1, 
                      dbo.tblProvider.Provider_SeesFF, dbo.tblProvider.Provider_SeesRFF, dbo.tblProvider.Provider_Code AS Expr2, dbo.tblcase.Date_AAA_Arb_Filed, 
                      dbo.tblcase.Date_AAA_Concilation_Over, ISNULL(CONVERT(nvarchar(20), dbo.tblcase.AAA_Confirmed_Date), N'') AS AAA_Confirmed_Date, dbo.tblcase.GB_CASE_ID, 
                      dbo.tblcase.GB_CASE_NO, ISNULL(dbo.TblArbitrator.ARBITRATOR_NAME, N'') AS ARBITRATOR_NAME, dbo.tblProvider.Provider_InvoicedFF, 
                      dbo.tblProvider.Provider_attachChecks, ISNULL(dbo.tblProvider.isFromNassau, 0) AS isFromNassau, ISNULL(dbo.tblcase.Injured_Caption, '') AS Injured_Caption, 
                      ISNULL(dbo.tblcase.Provider_Caption, '') AS Provider_Caption,
                          (SELECT     Doctor_Name
                            FROM          dbo.TblReviewingDoctor
                            WHERE      (Doctor_id = dbo.tblcase.Doctor_id)) AS Doctor_Name, CASE WHEN CONVERT(nvarchar(20), datepart(dd, getdate())) 
                      = '11' THEN '11th' WHEN CONVERT(nvarchar(20), datepart(dd, getdate())) = '12' THEN '12th' WHEN CONVERT(nvarchar(20), datepart(dd, getdate())) 
                      = '13' THEN '13th' WHEN RIGHT(CONVERT(nvarchar(20), datepart(dd, getdate())), 1) = '1' THEN CONVERT(nvarchar(20), datepart(dd, getdate())) 
                      + 'st' WHEN RIGHT(CONVERT(nvarchar(20), datepart(dd, getdate())), 1) = '2' THEN CONVERT(nvarchar(20), datepart(dd, getdate())) 
                      + 'nd' WHEN RIGHT(CONVERT(nvarchar(20), datepart(dd, getdate())), 1) = '3' THEN CONVERT(nvarchar(20), datepart(dd, getdate())) + 'rd' ELSE CONVERT(nvarchar(20), 
                      datepart(dd, getdate())) + 'th' END AS SUMMONS_DAY, DATENAME(mm, GETDATE()) AS SUMMONS_MONTH, DATEPART(yy, GETDATE()) AS SUMMONS_YEAR, 
                      CONVERT(NVARCHAR(12), CONVERT(DATETIME, dbo.tblcase.DateOfService_Start), 101) AS DOS_Start, CONVERT(NVARCHAR(12), CONVERT(DATETIME, 
                      dbo.tblcase.DateOfService_End), 101) AS DOS_End, ISNULL
                          ((SELECT     TOP (1) SERVICE_TYPE
                              FROM         dbo.tblTreatment
                              WHERE     (Case_Id = dbo.tblcase.Case_Id)
                              ORDER BY DateOfService_Start), N'') AS Service_Type, ISNULL
                          ((SELECT     TOP (1) DateOfService_Start
                              FROM         dbo.tblTreatment AS tblTreatment_1
                              WHERE     (Case_Id = dbo.tblcase.Case_Id)
                              ORDER BY DateOfService_Start), N'') AS DateOfServiceStart, CONVERT(decimal(38, 2), ISNULL(CONVERT(float, dbo.tblSettlements.Settlement_Amount) 
                      / (CASE WHEN (CONVERT(float, ISNULL(dbo.tblcase.Claim_Amount, 1)) - CONVERT(float, ISNULL(dbo.tblcase.Paid_Amount, 1))) = 0 THEN 1 ELSE (CONVERT(float, 
                      ISNULL(dbo.tblcase.Claim_Amount, 1)) - CONVERT(float, ISNULL(dbo.tblcase.Paid_Amount, 1))) END) * 100, N'')) AS SettlementAmountPercentage, 
                      UPPER(DATENAME(mm, GETDATE())) + ' ' + DATENAME(dd, GETDATE()) + ', ' + DATENAME(yy, GETDATE()) AS todaydate, CASE WHEN RIGHT(CONVERT(nvarchar(20), 
                      datepart(dd, dateadd(dd, 10, getdate()))), 1) = '1' THEN CONVERT(nvarchar(20), datepart(dd, dateadd(dd, 10, getdate()))) + 'st' WHEN RIGHT(CONVERT(nvarchar(20), 
                      datepart(dd, dateadd(dd, 10, getdate()))), 1) = '2' THEN CONVERT(nvarchar(20), datepart(dd, dateadd(dd, 10, getdate()))) + 'nd' WHEN RIGHT(CONVERT(nvarchar(20), 
                      datepart(dd, dateadd(dd, 10, getdate()))), 1) = '3' THEN CONVERT(nvarchar(20), datepart(dd, dateadd(dd, 10, getdate()))) + 'rd' ELSE CONVERT(nvarchar(20), datepart(dd, 
                      dateadd(dd, 10, getdate()))) + 'th' END AS NOT_DAY, DATENAME(mm, DATEADD(dd, 10, GETDATE())) AS NOT_MONTH, DATEPART(yy, DATEADD(dd, 10, GETDATE())) 
                      AS NOT_YEAR, CONVERT(nvarchar(12), DATEADD(dd, 10, GETDATE()), 101) AS NOT_DATE, DATENAME(MM, GETDATE()) + RIGHT(CONVERT(VARCHAR(12), GETDATE(), 
                      107), 9) AS Today_Date, dbo.tblcase.batchcode, dbo.tblcase.location_id, ISNULL(mst.Location_Address, '') AS Location_Address, ISNULL(mst.Location_City, '') 
                      AS Location_City, ISNULL(mst.Location_State, '') AS Location_State, ISNULL(mst.Location_Zip, '') AS Location_Zip, (CASE WHEN Date_Ext_Of_Time_3 <> '' OR
                      Date_Ext_Of_Time_3 IS NOT NULL THEN CONVERT(NVARCHAR(12), Date_Ext_Of_Time_3, 101) WHEN Date_Ext_Of_Time_2 <> '' OR
                      Date_Ext_Of_Time_2 IS NOT NULL THEN CONVERT(NVARCHAR(12), Date_Ext_Of_Time_2, 101) WHEN Date_Ext_Of_Time <> '' OR
                      Date_Ext_Of_Time IS NOT NULL THEN CONVERT(NVARCHAR(12), Date_Ext_Of_Time, 101) ELSE '' END) AS Date_Ext_Template, 
                      dbo.tblInsuranceCompany.InsuranceCompany_Name AS INSURANCE_NAME, dbo.tblcase.AAA_Decisions, dbo.tblcase.Fee_Schedule, 
                      dbo.ProperCase(ISNULL(dbo.tblInsuranceCompany.InsuranceCompany_Local_Address, '')) AS FIRSTCAP_INSCOMPANY_LOCAL_ADDRESS, 
                      dbo.ProperCase(ISNULL(dbo.tblInsuranceCompany.InsuranceCompany_Local_City, '')) AS FIRSTCAP_INSCOMPANY_LOCAL_CITY, 
                      dbo.udfSplit(dbo.tblcase.IndexOrAAA_Number, '/') AS INDEX_YEAR,
					   dbo.udfSplit_First(dbo.tblcase.IndexOrAAA_Number, '/') AS INDEX_NO, 
                      dbo.tblcase.Date_of_AAA_Awards, dbo.tblcase.Date_Open_Verification_Response_Sent2, dbo.tblcase.Date_Open_Verification_Response_Sent1, 
                      dbo.tblcase.Date_NAM_Package_Printed, dbo.tblcase.Date_of_NAM_Awards, dbo.tblcase.Date_NAM_Response_Received, dbo.tblcase.Date_NAM_Confirmed, 
                      dbo.tblcase.Date_NAM_ARB_Filed, dbo.tblcase.OPENED_BY, dbo.tblcase.firm_split_percent,ecmc.Account as ECMC_Account ,dbo.tblcase.old_Case_id
FROM         dbo.tblcase LEFT OUTER JOIN
                      dbo.tblStatus ON dbo.tblcase.Status = dbo.tblStatus.Status_Abr LEFT OUTER JOIN
                      dbo.NotaryPublic ON dbo.tblcase.Notary_id = dbo.NotaryPublic.NotaryPublicID LEFT OUTER JOIN
                      dbo.tblprocessserver ON dbo.tblcase.psid = dbo.tblprocessserver.psid INNER JOIN
                      dbo.tblInsuranceCompany ON dbo.tblcase.InsuranceCompany_Id = dbo.tblInsuranceCompany.InsuranceCompany_Id INNER JOIN
                      dbo.tblProvider ON dbo.tblcase.Provider_Id = dbo.tblProvider.Provider_Id
					  -- LEFT OUTER JOIN dbo.tblServed ON dbo.tblcase.Served_To = dbo.tblServed.ID 
					  LEFT OUTER JOIN
                      dbo.tblAttorney ON dbo.tblcase.Attorney_Id = dbo.tblAttorney.Attorney_Id LEFT OUTER JOIN
                      dbo.tblDefendant ON dbo.tblcase.Defendant_Id = dbo.tblDefendant.Defendant_id LEFT OUTER JOIN
                      dbo.tblAdjusters ON dbo.tblcase.Adjuster_Id = dbo.tblAdjusters.Adjuster_Id LEFT OUTER JOIN
                      dbo.tblCourt ON dbo.tblcase.Court_Id = dbo.tblCourt.Court_Id LEFT OUTER JOIN
                      dbo.TblArbitrator ON dbo.tblcase.Arbitrator_ID = dbo.TblArbitrator.ARBITRATOR_ID LEFT OUTER JOIN
                      dbo.tblSettlements ON dbo.tblcase.Case_Id = dbo.tblSettlements.Case_Id LEFT OUTER JOIN
                      dbo.tblSettlement_Type ON dbo.tblSettlements.Settled_Type = dbo.tblSettlement_Type.SettlementType_Id LEFT OUTER JOIN
                      dbo.MST_Service_Rendered_Location AS mst ON dbo.tblcase.location_id = mst.Location_Id LEFT OUTER JOIN
                      dbo.ecmc on dbo.tblcase.Case_id= ecmc.fhkp_case_id


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[21] 4[29] 2[29] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[57] 4[29] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -194
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblcase"
            Begin Extent = 
               Top = 2
               Left = 261
               Bottom = 205
               Right = 534
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NotaryPublic"
            Begin Extent = 
               Top = 14
               Left = 455
               Bottom = 122
               Right = 619
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblprocessserver"
            Begin Extent = 
               Top = 326
               Left = 486
               Bottom = 434
               Right = 637
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblInsuranceCompany"
            Begin Extent = 
               Top = 95
               Left = 0
               Bottom = 203
               Right = 248
            End
            DisplayFlags = 280
            TopColumn = 16
         End
         Begin Table = "tblProvider"
            Begin Extent = 
               Top = 207
               Left = 38
               Bottom = 315
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 40
         End
         Begin Table = "tblServed"
            Begin Extent = 
               Top = 13
               Left = 668
               Bottom = 198
               Right = 857
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tblAttorney"
            Begin Extent = 
               Top = 222
               Left = 271
               Bottom = 330
               Right = 448
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LCJ_VW_CaseSearchDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblDefendant"
            Begin Extent = 
               Top = 330
               Left = 38
               Bottom = 438
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblAdjusters"
            Begin Extent = 
               Top = 330
               Left = 252
               Bottom = 438
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCourt"
            Begin Extent = 
               Top = 141
               Left = 436
               Bottom = 249
               Right = 588
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TblArbitrator"
            Begin Extent = 
               Top = 440
               Left = 38
               Bottom = 548
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblSettlements"
            Begin Extent = 
               Top = 438
               Left = 38
               Bottom = 546
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 9720
         Alias = 2805
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LCJ_VW_CaseSearchDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LCJ_VW_CaseSearchDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LCJ_VW_CaseSearchDetails'
GO
