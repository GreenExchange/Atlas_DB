USE [DKATLAS]
GO
/****** Object:  View [dbo].[SJR-Case_report_Extended]    Script Date: 6/17/2019 2:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SJR-Case_report_Extended]
AS
SELECT     dbo.tblcase.Case_AutoId, dbo.tblcase.Case_Id, dbo.tblcase.Case_Code, 
                      dbo.tblcase.InjuredParty_LastName + N', ' + dbo.tblcase.InjuredParty_FirstName AS InjuredParty_Name, REPLACE(dbo.tblProvider.Provider_Name, '--', '##') 
                      AS Provider_Name, dbo.tblProvider.Provider_GroupName, dbo.tblInsuranceCompany.InsuranceCompany_Name, ISNULL(CONVERT(money, 
                      dbo.tblcase.Claim_Amount), 0) - ISNULL(CONVERT(money, dbo.tblcase.Paid_Amount), 0) AS Balance, dbo.tblcase.IndexOrAAA_Number AS [Index], dbo.tblcase.Status, 
                      dbo.tblcase.Initial_Status, CASE WHEN TBLCASE.STATUS LIKE '%CLOSED%' OR
                      TBLCASE.STATUS LIKE '%PAID%' THEN 'CLOSED' WHEN TBLCASE.STATUS LIKE '%WITHDRAWN%' THEN 'WITHDRAWN' ELSE 'ACTIVE' END AS GLOBAL_STATUS, 
                      ISNULL(CONVERT(varchar(12), dbo.tblcase.DateOfService_Start, 110) + ' - ' + CONVERT(varchar(12), dbo.tblcase.DateOfService_End, 110), N'-') AS DOS, 
                      dbo.tblcase.Ins_Claim_Number AS Claim#, dbo.tblcase.Policy_Number, dbo.tblcase.Date_Opened, dbo.tblStatus.Status_Hierarchy, dbo.tblcase.Provider_Id, 
                      dbo.tblcase.InsuranceCompany_Id, dbo.tblcase.IndexOrAAA_Number, SUM(ISNULL(CONVERT(money, dbo.tblcase.Claim_Amount), 0)) AS Claim_Amount, 
                      SUM(ISNULL(CONVERT(money, dbo.tblcase.Paid_Amount), 0)) AS Paid_Amount, 
                      SUM(ISNULL(dbo.[SJR-SETTLEMENTS_FULL].Settlement_Amount + dbo.[SJR-SETTLEMENTS_FULL].Settlement_Int, 0)) AS Settlement_total, 
                      SUM(ISNULL(dbo.[SJR-SETTLEMENTS_FULL].Settlement_Af, 0)) AS Settlement_AF, SUM(ISNULL(dbo.[SJR-SETTLEMENTS_FULL].Settlement_Ff, 0)) AS Settlement_FF, 
                      SUM(ISNULL(dbo.[SJR-SETTLED_PAYMENTS_FULL].Payments, 0)) AS Settlement_Payments, 
                      SUM(ISNULL(dbo.[SJR-SETTLEMENTS_FULL].Settlement_Amount + dbo.[SJR-SETTLEMENTS_FULL].Settlement_Int + dbo.[SJR-SETTLEMENTS_FULL].Settlement_Af + dbo.[SJR-SETTLEMENTS_FULL].Settlement_Ff,
                       ISNULL(CONVERT(money, dbo.tblcase.Claim_Amount), 0) - ISNULL(CONVERT(money, dbo.tblcase.Paid_Amount), 0)) 
                      - ISNULL(dbo.[SJR-SETTLED_PAYMENTS_FULL].Payments, 0)) AS Settlement_balance, dbo.tblDefendant.Defendant_Name, dbo.tblCourt.Court_Misc AS County, 
                      dbo.tblcase.Served_On_Date, dbo.tblcase.Accident_Date, dbo.tblcase.Date_Answer_Received, SUM(ISNULL(dbo.[SJR-SETTLED_PAYMENTS_FULL].PRINC, 0) 
                      + ISNULL(dbo.[SJR-SETTLED_PAYMENTS_FULL].INT, 0)) AS PROVIDER_PAYMENT, 
                      SUM(ISNULL(dbo.[SJR-SETTLEMENTS_FULL].Settlement_Amount + dbo.[SJR-SETTLEMENTS_FULL].Settlement_Int, ISNULL(CONVERT(money, 
                      dbo.tblcase.Claim_Amount), 0) - ISNULL(CONVERT(money, dbo.tblcase.Paid_Amount), 0)) - ISNULL(dbo.[SJR-SETTLED_PAYMENTS_FULL].PRINC, 0) 
                      - ISNULL(dbo.[SJR-SETTLED_PAYMENTS_FULL].INT, 0)) AS PROVIDER_BALANCE, MAX(dbo.[SJR-SETTLEMENTS_FULL].Settl_date) AS MAX_SETT_DATE, 
                      dbo.[SJR-SETTLED_PAYMENTS_FULL].Max_Date AS MAX_PAY_DATE, dbo.tblProvider.Provider_Billing, dbo.[SJR-SETTLEMENTS_FULL].Settlement_Batch, 
                      SUM(ISNULL(dbo.[SJR-SETTLED_PAYMENTS_FULL].PRINC, 0) + ISNULL(dbo.[SJR-SETTLED_PAYMENTS_FULL].INT, 0)) AS PAYMENT_SETT, 
                      SUM(ISNULL(dbo.[SJR-SETTLED_PAYMENTS_FULL].AF, 0)) AS PAYMENT_AF, SUM(ISNULL(dbo.[SJR-SETTLED_PAYMENTS_FULL].FFC, 0)) AS PAYMENT_FF, 
                      SUM(ISNULL(dbo.[SJR-SETTLEMENTS_FULL].Settlement_Amount + dbo.[SJR-SETTLEMENTS_FULL].Settlement_Int, 0) 
                      - (ISNULL(dbo.[SJR-SETTLED_PAYMENTS_FULL].PRINC, 0) + ISNULL(dbo.[SJR-SETTLED_PAYMENTS_FULL].INT, 0))) AS BALANCE_SETT, 
                      SUM(ISNULL(dbo.[SJR-SETTLEMENTS_FULL].Settlement_Af, 0) - ISNULL(dbo.[SJR-SETTLED_PAYMENTS_FULL].AF, 0)) AS BALANCE_AF, 
                      SUM(ISNULL(dbo.[SJR-SETTLEMENTS_FULL].Settlement_Ff, 0) - ISNULL(dbo.[SJR-SETTLED_PAYMENTS_FULL].FFC, 0)) AS BALANCE_FF, 
                      dbo.[SJR-SETTLEMENTS_FULL].Settlement_SubBatch, dbo.[SJR-SETTLEMENTS_FULL].User_Id AS SETTLED_BY, dbo.[SJR-SETTLEMENTS_FULL].COA, 
                      CASE WHEN (ISNULL(CONVERT(money, dbo.tblcase.Claim_Amount), 0) - ISNULL(CONVERT(money, dbo.tblcase.Paid_Amount), 0)) 
                      = 0 THEN '-1' ELSE SUM(ISNULL(dbo.[SJR-SETTLEMENTS_FULL].Settlement_Amount + dbo.[SJR-SETTLEMENTS_FULL].Settlement_Int, 0)) / (ISNULL(CONVERT(money,
                       dbo.tblcase.Claim_Amount), 0) - ISNULL(CONVERT(money, dbo.tblcase.Paid_Amount), 0)) END AS SETT_RATIO, dbo.tblcase.Defendant_Id, 
                      dbo.tblProvider.Provider_Suitname,
                          (SELECT     COUNT(Treatment_Id) AS Expr1
                            FROM          dbo.tblTreatment
                            WHERE      (Case_Id = Case_Id)) AS Bills, dbo.tblcase.Last_Status, dbo.tblcase.Date_Status_Changed, dbo.tblcase.Date_Closed, 
                      dbo.tblcase.DateAAA_ResponceRecieved, dbo.tblcase.DateAAA_packagePrinting, dbo.tblcase.AAA_Confirmed_Date, dbo.tblcase.Date_AAA_Arb_Filed, 
                      dbo.tblcase.Date_AAA_Concilation_Over, ISNULL(dbo.tblcase.Fee_Schedule,0)AS Fee_Schedule
FROM         dbo.tblcase LEFT OUTER JOIN
                      dbo.tblProvider ON dbo.tblcase.Provider_Id = dbo.tblProvider.Provider_Id LEFT OUTER JOIN
                      dbo.tblInsuranceCompany ON dbo.tblcase.InsuranceCompany_Id = dbo.tblInsuranceCompany.InsuranceCompany_Id LEFT OUTER JOIN
                      dbo.tblStatus ON dbo.tblcase.Status = dbo.tblStatus.Status_Type LEFT OUTER JOIN
                      dbo.tblCourt ON dbo.tblcase.Court_Id = dbo.tblCourt.Court_Id LEFT OUTER JOIN
                      dbo.tblDefendant ON dbo.tblcase.Defendant_Id = dbo.tblDefendant.Defendant_id LEFT OUTER JOIN
                      dbo.[SJR-SETTLED_PAYMENTS_FULL] ON dbo.tblcase.Case_Id = dbo.[SJR-SETTLED_PAYMENTS_FULL].Case_Id LEFT OUTER JOIN
                      dbo.[SJR-SETTLEMENTS_FULL] ON dbo.tblcase.Case_Id = dbo.[SJR-SETTLEMENTS_FULL].Case_Id
GROUP BY dbo.tblcase.Case_Id, ISNULL(CONVERT(money, dbo.tblcase.Claim_Amount), 0) - ISNULL(CONVERT(money, dbo.tblcase.Paid_Amount), 0), 
                      dbo.tblInsuranceCompany.InsuranceCompany_Name, dbo.tblcase.InjuredParty_LastName + N', ' + dbo.tblcase.InjuredParty_FirstName, 
                      dbo.tblcase.IndexOrAAA_Number, dbo.tblcase.Status, CONVERT(varchar(12), dbo.tblcase.DateOfService_Start, 110) + ' - ' + CONVERT(varchar(12), 
                      dbo.tblcase.DateOfService_End, 110), dbo.tblcase.Ins_Claim_Number, REPLACE(dbo.tblProvider.Provider_Name, '--', '##'), dbo.tblcase.Date_Opened, 
                      dbo.tblcase.Case_Code, dbo.tblcase.Initial_Status, dbo.tblcase.Provider_Id, dbo.tblcase.InsuranceCompany_Id, dbo.tblDefendant.Defendant_Name, 
                      dbo.tblCourt.Court_Misc, dbo.tblcase.Served_On_Date, dbo.tblProvider.Provider_GroupName, dbo.tblcase.Accident_Date, dbo.tblcase.Date_Answer_Received, 
                      dbo.tblcase.Policy_Number, dbo.tblProvider.Provider_Billing, dbo.[SJR-SETTLEMENTS_FULL].Settlement_Batch, 
                      dbo.[SJR-SETTLEMENTS_FULL].Settlement_SubBatch, dbo.[SJR-SETTLEMENTS_FULL].User_Id, dbo.[SJR-SETTLEMENTS_FULL].COA, 
                      dbo.[SJR-SETTLED_PAYMENTS_FULL].Max_Date, dbo.tblcase.Defendant_Id, dbo.tblcase.Case_AutoId, dbo.tblProvider.Provider_Suitname, 
                      dbo.tblStatus.Status_Hierarchy, dbo.tblcase.Last_Status, dbo.tblcase.Date_Status_Changed, dbo.tblcase.Date_Closed, dbo.tblcase.DateAAA_ResponceRecieved, 
                      dbo.tblcase.DateAAA_packagePrinting, dbo.tblcase.AAA_Confirmed_Date, dbo.tblcase.Date_AAA_Arb_Filed, dbo.tblcase.Date_AAA_Concilation_Over, 
                      dbo.tblcase.Fee_Schedule
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SJR-Case_report_Extended'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[53] 4[17] 2[18] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
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
         Configuration = "(H (1[65] 4) )"
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
         Left = -288
      End
      Begin Tables = 
         Begin Table = "tblcase"
            Begin Extent = 
               Top = 0
               Left = 514
               Bottom = 321
               Right = 803
            End
            DisplayFlags = 280
            TopColumn = 99
         End
         Begin Table = "tblInsuranceCompany"
            Begin Extent = 
               Top = 19
               Left = 98
               Bottom = 132
               Right = 368
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblProvider"
            Begin Extent = 
               Top = 158
               Left = 40
               Bottom = 271
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblStatus"
            Begin Extent = 
               Top = 5
               Left = 901
               Bottom = 157
               Right = 1080
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblCourt"
            Begin Extent = 
               Top = 161
               Left = 908
               Bottom = 269
               Right = 1121
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tblDefendant"
            Begin Extent = 
               Top = 281
               Left = 910
               Bottom = 389
               Right = 1124
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SJR-SETTLED_PAYMENTS_FULL"
            Begin Extent = 
               Top = 132
               Left = 326
               Bottom = 240
               Right = 493
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SJR-Case_report_Extended'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'           End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SJR-SETTLEMENTS_FULL"
            Begin Extent = 
               Top = 324
               Left = 326
               Bottom = 432
               Right = 525
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
      Begin ColumnWidths = 46
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
         Width = 1920
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
      Begin ColumnWidths = 12
         Column = 12420
         Alias = 1950
         Table = 3060
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SJR-Case_report_Extended'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SJR-Case_report_Extended'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SJR-Case_report_Extended'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SJR-Case_report_Extended'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SJR-Case_report_Extended'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SJR-Case_report_Extended'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SJR-Case_report_Extended'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SJR-Case_report_Extended'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SJR-Case_report_Extended'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SJR-Case_report_Extended'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SJR-Case_report_Extended'
GO
