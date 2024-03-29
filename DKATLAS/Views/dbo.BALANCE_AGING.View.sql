USE [DKATLAS]
GO
/****** Object:  View [dbo].[BALANCE_AGING]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BALANCE_AGING]
AS
SELECT     dbo.tblcase.Case_Id, dbo.tblcase.Case_Code, dbo.tblProvider.Provider_Name, dbo.tblInsuranceCompany.InsuranceCompany_Name, 
                      ISNULL(SUM(dbo.tblTransactions.Transactions_Amount), 0) AS PAYMT_TOTAL, dbo.tblSettlements.Settlement_Total, 
                      dbo.tblSettlements.Settlement_Total - ISNULL(SUM(dbo.tblTransactions.Transactions_Amount), 0) AS BALANCE, CONVERT(char, 
                      dbo.tblSettlements.Settlement_Date, 3) AS Settlemet_Date, DATEDIFF(DAY, dbo.tblSettlements.Settlement_Date, GETDATE()) AS AGING, DATEDIFF(DAY, 
                      dbo.tblSettlements.Settlement_Date, GETDATE()) / 90 AS AGING_TRIM, dbo.tblcase.Status, dbo.tblProvider.Provider_Code
FROM         dbo.tblTransactions INNER JOIN
                      dbo.tblcase ON dbo.tblTransactions.Case_Id = dbo.tblcase.Case_Id INNER JOIN
                      dbo.tblInsuranceCompany ON dbo.tblcase.InsuranceCompany_Id = dbo.tblInsuranceCompany.InsuranceCompany_Id INNER JOIN
                      dbo.tblProvider ON dbo.tblcase.Provider_Id = dbo.tblProvider.Provider_Id INNER JOIN
                      dbo.tblSettlements ON dbo.tblcase.Case_Id = dbo.tblSettlements.Case_Id
WHERE     (dbo.tblcase.Case_Code IS NULL) AND (dbo.tblcase.Status = N'SETTLED') AND (dbo.tblTransactions.Transactions_Type = N'ffc' OR
                      dbo.tblTransactions.Transactions_Type = N'af' OR
                      dbo.tblTransactions.Transactions_Type = N'I' OR
                      dbo.tblTransactions.Transactions_Type = N'c')
GROUP BY dbo.tblcase.Case_Id, dbo.tblcase.Case_Code, dbo.tblProvider.Provider_Name, dbo.tblInsuranceCompany.InsuranceCompany_Name, 
                      dbo.tblSettlements.Settlement_Total, dbo.tblSettlements.Settlement_Date, DATEDIFF(DAY, dbo.tblSettlements.Settlement_Date, GETDATE()) / 90, 
                      dbo.tblcase.Status, dbo.tblProvider.Provider_Code
HAVING      (SUM(dbo.tblTransactions.Transactions_Amount) <= dbo.tblSettlements.Settlement_Total) AND (DATEDIFF(DAY, dbo.tblSettlements.Settlement_Date, 
                      GETDATE()) > 30) AND (dbo.tblSettlements.Settlement_Total - ISNULL(SUM(dbo.tblTransactions.Transactions_Amount), 0) > 31)
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
         Begin Table = "tblTransactions"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblcase"
            Begin Extent = 
               Top = 6
               Left = 292
               Bottom = 114
               Right = 581
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblInsuranceCompany"
            Begin Extent = 
               Top = 114
               Left = 38
               Bottom = 222
               Right = 302
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblProvider"
            Begin Extent = 
               Top = 114
               Left = 340
               Bottom = 222
               Right = 551
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblSettlements"
            Begin Extent = 
               Top = 222
               Left = 38
               Bottom = 330
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1875
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      En' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BALANCE_AGING'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'd
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
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
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BALANCE_AGING'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BALANCE_AGING'
GO
