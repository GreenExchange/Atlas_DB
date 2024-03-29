USE [DKATLAS]
GO
/****** Object:  View [dbo].[BX_PAYMENTS_VIEW]    Script Date: 6/17/2019 2:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BX_PAYMENTS_VIEW]
AS
SELECT     TOP (100) PERCENT dbo.BX_PAYMENTS.SERVICE_ID, SUM(dbo.BX_PAYMENTS.AMOUNT) AS AMOUNT, dbo.BX_PAYMENT_TYPE.IS_FOR_INS, 
                      dbo.BX_PAYMENT_TYPE.PROVIDER_FEE, dbo.BX_PAYMENTS.INVOICE_ID, dbo.BX_PAYMENTS.FREEZED, dbo.tblProvider.BX_FEE_SCHEDULE, 
                      SUM(dbo.BX_FEE_GRID.FEE) AS FEE, dbo.BX_FEE_GRID.DESCRIPTION, dbo.BX_FEE_GRID.SCHEDULE_ID, COUNT(dbo.BX_PAYMENTS.ID) 
                      AS PAYMENT_COUNT, dbo.BX_PAYMENT_TYPE.APPLY_TO_INVOICE
FROM         dbo.BX_CASE INNER JOIN
                      dbo.BX_SERVICES ON dbo.BX_CASE.CASE_ID = dbo.BX_SERVICES.CASE_ID INNER JOIN
                      dbo.BX_PAYMENTS INNER JOIN
                      dbo.BX_PAYMENT_TYPE ON dbo.BX_PAYMENTS.TYPE = dbo.BX_PAYMENT_TYPE.ID ON 
                      dbo.BX_SERVICES.ID = dbo.BX_PAYMENTS.SERVICE_ID INNER JOIN
                      dbo.tblProvider ON dbo.BX_CASE.PROVIDER = dbo.tblProvider.Provider_Id INNER JOIN
                      dbo.BX_FEE_GRID ON dbo.tblProvider.BX_FEE_SCHEDULE = dbo.BX_FEE_GRID.SCHEDULE_ID
WHERE     (ISNULL(dbo.BX_PAYMENTS.AMOUNT, 0) BETWEEN dbo.BX_FEE_GRID.RANGE_MIN AND dbo.BX_FEE_GRID.RANGE_MAX) AND 
                      (dbo.BX_FEE_GRID.ACTIVE = 1)
GROUP BY dbo.BX_PAYMENTS.SERVICE_ID, dbo.BX_PAYMENTS.INVOICE_ID, dbo.BX_PAYMENT_TYPE.IS_FOR_INS, 
                      dbo.BX_PAYMENT_TYPE.PROVIDER_FEE, dbo.BX_PAYMENTS.FREEZED, dbo.tblProvider.BX_FEE_SCHEDULE, dbo.BX_FEE_GRID.DESCRIPTION, 
                      dbo.BX_FEE_GRID.SCHEDULE_ID, dbo.BX_PAYMENT_TYPE.APPLY_TO_INVOICE
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[24] 4[26] 2[16] 3) )"
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
         Begin Table = "BX_CASE"
            Begin Extent = 
               Top = 21
               Left = 42
               Bottom = 136
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BX_SERVICES"
            Begin Extent = 
               Top = 0
               Left = 223
               Bottom = 115
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BX_PAYMENTS"
            Begin Extent = 
               Top = 8
               Left = 406
               Bottom = 229
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BX_PAYMENT_TYPE"
            Begin Extent = 
               Top = 1
               Left = 547
               Bottom = 180
               Right = 773
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblProvider"
            Begin Extent = 
               Top = 37
               Left = 3
               Bottom = 152
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 35
         End
         Begin Table = "BX_FEE_GRID"
            Begin Extent = 
               Top = 143
               Left = 177
               Bottom = 258
               Right = 345
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
       ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BX_PAYMENTS_VIEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  Width = 1500
         Width = 2475
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
         Column = 1440
         Alias = 2100
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BX_PAYMENTS_VIEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BX_PAYMENTS_VIEW'
GO
