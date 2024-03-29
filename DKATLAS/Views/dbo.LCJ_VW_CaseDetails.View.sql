USE [DKATLAS]
GO
/****** Object:  View [dbo].[LCJ_VW_CaseDetails]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LCJ_VW_CaseDetails]
AS
SELECT     dbo.tblcase.Case_AutoId, dbo.tblcase.Case_Id, dbo.tblcase.Case_Code, dbo.tblcase.Provider_Code, dbo.tblcase.InsuranceCompany_Code, 
                      dbo.tblcase.Provider_Id, dbo.tblcase.InsuranceCompany_Id, dbo.tblcase.InjuredParty_LastName, dbo.tblcase.InjuredParty_FirstName, 
                      dbo.tblcase.InjuredParty_Address, dbo.tblcase.InjuredParty_City, dbo.tblcase.InjuredParty_State, dbo.tblcase.InjuredParty_Zip, 
                      dbo.tblcase.InjuredParty_Phone, dbo.tblcase.InjuredParty_Misc, dbo.tblcase.InsuredParty_LastName, dbo.tblcase.InsuredParty_FirstName, 
                      dbo.tblcase.InsuredParty_Address, dbo.tblcase.InsuredParty_City, dbo.tblcase.InsuredParty_State, dbo.tblcase.InsuredParty_Zip, 
                      dbo.tblcase.InsuredParty_Misc, dbo.tblcase.Accident_Date, dbo.tblcase.Accident_Address, dbo.tblcase.Accident_City, dbo.tblcase.Accident_State, 
                      dbo.tblcase.Accident_Zip, dbo.tblcase.Policy_Number, dbo.tblcase.Ins_Claim_Number, dbo.tblcase.IndexOrAAA_Number, dbo.tblcase.Status, 
                      dbo.tblcase.Old_Status, dbo.tblcase.Defendant_Id, dbo.tblcase.Date_Opened, dbo.tblcase.Last_Status, dbo.tblcase.Initial_Status, dbo.tblcase.Memo, 
                      dbo.tblcase.InjuredParty_Type, dbo.tblcase.InsuredParty_Type, dbo.tblcase.Adjuster_Id, dbo.tblcase.DenialReasons_Type, dbo.tblcase.Court_Id, 
                      dbo.tblcase.Attorney_FileNumber, dbo.tblcase.Group_Data, dbo.tblcase.Group_Id, dbo.tblcase.Date_Status_Changed, 
                      dbo.tblcase.Date_Answer_Received, dbo.tblcase.Motion_Date, dbo.tblcase.Trial_Date, dbo.tblcase.Attorney_Id, dbo.tblcase.Date_Answer_Expected, 
                      dbo.tblcase.Reply_Date, dbo.tblcase.Calendar_Part, dbo.tblcase.Motion_Type, dbo.tblcase.Whose_Motion, dbo.tblcase.Defense_Opp_Due, 
                      dbo.tblcase.Date_Ext_Of_Time_2, dbo.tblcase.XMotion_Type, dbo.tblcase.Case_Billing, dbo.tblcase.DateOfService_Start, 
                      dbo.tblcase.DateOfService_End, dbo.tblcase.Claim_Amount, dbo.tblcase.Paid_Amount, dbo.tblcase.Date_BillSent, dbo.tblcase.Caption, 
                      dbo.tblcase.Group_ClaimAmt, dbo.tblcase.Group_PaidAmt, dbo.tblcase.Group_Balance, dbo.tblcase.Group_InsClaimNo, dbo.tblcase.Group_All, 
                      dbo.tblcase.Date_Packeted, dbo.tblcase.Group_Accident, dbo.tblcase.Group_PolicyNum, dbo.tblcase.GROUP_CASE_SEQUENCE, 
                      dbo.tblcase.Our_SJ_Motion_Activity, dbo.tblcase.Their_SJ_Motion_Activity, dbo.tblcase.Our_Discovery_Demands, 
                      dbo.tblcase.Our_Discovery_Responses, dbo.tblcase.Date_Summons_Printed, dbo.tblcase.Plaintiff_Discovery_Due_Date, 
                      dbo.tblcase.Defendant_Discovery_Due_Date, dbo.tblcase.Date_Bill_Submitted, dbo.tblcase.Date_Index_Number_Purchased, 
                      dbo.tblcase.Date_Afidavit_Filed, dbo.tblcase.Date_Ext_Of_Time, dbo.tblcase.Date_Summons_Sent_Court, dbo.tblcase.Date_Ext_Of_Time_3, 
                      dbo.tblcase.Served_To, dbo.tblcase.Served_On_Date, dbo.tblcase.Served_On_Time, dbo.tblcase.Date_Closed, dbo.tblcase.Notary_id, 
                      dbo.tblcase.stips_signed_and_returned, dbo.tblcase.stips_signed_and_returned_2, dbo.tblcase.stips_signed_and_returned_3, 
                      dbo.tblcase.Date_Demands_Printed, dbo.tblcase.Date_Disc_Conf_Letter_Printed, dbo.tblcase.Date_Reply_To_Disc_Conf_Letter_Recd, 
                      dbo.tblcase.psid, dbo.tblTreatment.Treatment_Id, dbo.tblTreatment.Case_Id AS Expr1, dbo.tblTreatment.DateOfService_Start AS Expr2, 
                      dbo.tblTreatment.DateOfService_End AS Expr3, dbo.tblTreatment.Claim_Amount AS Expr4, dbo.tblTreatment.Paid_Amount AS Expr5, 
                      dbo.tblTreatment.Date_BillSent AS Expr6, dbo.tblTreatment.SERVICE_TYPE, '' AS Expr7, 
                      dbo.tblTreatment.Settlement_Pctg, dbo.tblTreatment.Interest_Pctg, dbo.tblTreatment.AttorneyFee, dbo.tblTreatment.FilingFeeAmt, 
                      dbo.tblTreatment.SettlementInt, dbo.tblTreatment.CPT_Id, dbo.tblcase.Served_On_Date AS date_summons_Served,
					  dbo.tblcase.batchcode AS batchcode,dbo.tblcase.location_id as location_id, isnull (mst.Location_Address,'') as Location_Address, isnull (mst.Location_City,'') as Location_City, isnull (mst.Location_State,'') as Location_State, isnull (mst.Location_Zip,'') as Location_Zip

FROM         dbo.tblcase LEFT OUTER JOIN
                      dbo.tblTreatment ON dbo.tblcase.Case_Id = dbo.tblTreatment.Case_Id
LEFT OUTER JOIN
					  dbo.MST_Service_Rendered_Location mst on dbo.tblcase.Location_Id = mst.Location_Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Configuration = "(H (1[56] 4[18] 2) )"
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblcase"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 311
            End
            DisplayFlags = 280
            TopColumn = 85
         End
         Begin Table = "tblTreatment"
            Begin Extent = 
               Top = 6
               Left = 349
               Bottom = 114
               Right = 542
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
      Begin ColumnWidths = 115
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
         Width = 1500
         Width = 1500
         Width = 1500
         Widt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LCJ_VW_CaseDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'h = 1500
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
         Column = 1440
         Alias = 900
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LCJ_VW_CaseDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LCJ_VW_CaseDetails'
GO
