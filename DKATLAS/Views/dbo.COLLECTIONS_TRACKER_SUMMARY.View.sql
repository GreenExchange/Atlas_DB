USE [DKATLAS]
GO
/****** Object:  View [dbo].[COLLECTIONS_TRACKER_SUMMARY]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[COLLECTIONS_TRACKER_SUMMARY]
AS
SELECT     TOP (100) PERCENT COUNT(Case_Id) AS TRANSACTION_COUNT, COUNT(DISTINCT Case_Id) AS CASE_COUNT, 
                      SUM(CASE WHEN Transactions_Type = 'C' THEN Transactions_Amount END) AS PRINCIPAL, 
                      SUM(CASE WHEN Transactions_Type = 'I' THEN Transactions_Amount END) AS INTEREST, 
                      SUM(CASE WHEN Transactions_Type = 'AF' THEN Transactions_Amount END) AS ATTORNEY_FEES, 
                      SUM(CASE WHEN Transactions_Type = 'FFC' THEN Transactions_Amount END) AS FILING_FEES, DATENAME(mm, Transactions_Date) 
                      + '-' + CONVERT(varchar(4), YEAR(Transactions_Date)) AS MONTH, CONVERT(int, CONVERT(VARCHAR(4), YEAR(Transactions_Date)) 
                      + CONVERT(VARCHAR(2), MONTH(Transactions_Date))) AS DATE, SUM(Transactions_Amount) AS Total, YEAR(Transactions_Date) AS YEAR_D, 
                      MONTH(Transactions_Date) AS MONTH_D
FROM         dbo.SJR_COLLECTION_TRACKER_DETAILS
GROUP BY DATENAME(mm, Transactions_Date) + '-' + CONVERT(varchar(4), YEAR(Transactions_Date)), CONVERT(int, CONVERT(VARCHAR(4), 
                      YEAR(Transactions_Date)) + CONVERT(VARCHAR(2), MONTH(Transactions_Date))), YEAR(Transactions_Date), MONTH(Transactions_Date)
ORDER BY YEAR_D, MONTH_D
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=0x02 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'COLLECTIONS_TRACKER_SUMMARY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[22] 4[22] 2[20] 3) )"
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
         Begin Table = "SJR_COLLECTION_TRACKER_DETAILS"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 171
               Right = 239
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
      Begin ColumnWidths = 9
         Width = 284
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
         Column = 5715
         Alias = 1620
         Table = 825
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 75
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'COLLECTIONS_TRACKER_SUMMARY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'COLLECTIONS_TRACKER_SUMMARY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=NULL , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'COLLECTIONS_TRACKER_SUMMARY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_FilterOnLoad', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'COLLECTIONS_TRACKER_SUMMARY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_HideNewField', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'COLLECTIONS_TRACKER_SUMMARY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderBy', @value=N'[COLLECTIONS_TRACKER_SUMMARY].[DATE]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'COLLECTIONS_TRACKER_SUMMARY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'COLLECTIONS_TRACKER_SUMMARY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOnLoad', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'COLLECTIONS_TRACKER_SUMMARY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'COLLECTIONS_TRACKER_SUMMARY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TableMaxRecords', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'COLLECTIONS_TRACKER_SUMMARY'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_TotalsRow', @value=0 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'COLLECTIONS_TRACKER_SUMMARY'
GO
