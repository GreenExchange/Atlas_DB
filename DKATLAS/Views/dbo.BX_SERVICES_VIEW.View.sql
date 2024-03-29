USE [DKATLAS]
GO
/****** Object:  View [dbo].[BX_SERVICES_VIEW]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BX_SERVICES_VIEW]
AS
SELECT     dbo.BX_SERVICES.ID AS SERVICE_ID, dbo.BX_SERVICES.CASE_ID, dbo.BX_SERVICES.AMOUNT, SUM(ISNULL(dbo.BX_PAYMENTS_VIEW.AMOUNT, 
                      0)) AS PAYMENTS, dbo.BX_SERVICES.AMOUNT - SUM(ISNULL(dbo.BX_PAYMENTS_VIEW.AMOUNT, 0)) AS BALANCE, dbo.BX_SERVICES.DATE_SENT, 
                      dbo.BX_SERVICE_STATUS.NAME, dbo.BX_SERVICES.LITIGATED, dbo.BX_SERVICES.COMPLETE, dbo.BX_PHYSICIANS.NAME AS RENDERED_BY, 
                      dbo.tblServiceType.ServiceType, dbo.BX_SERVICES.DATE_CREATED, dbo.BX_SERVICES.CREATED_BY, dbo.BX_SERVICES.MEMO, 
                      dbo.BX_SERVICES.DATE_CLOSED, dbo.BX_SERVICES.CLOSED_BY, dbo.BX_SERVICES.DATE_LITIGATED, dbo.BX_SERVICES.LITIGATED_BY, 
                      dbo.BX_SERVICES.PREP_BY, dbo.BX_SERVICES.REFERENCE, dbo.BX_SERVICES.BATCH_ID, dbo.BX_SERVICES.ARBITRATED_BY, 
                      dbo.BX_SERVICES.DATE_ARBITRATED, dbo.BX_SERVICES.ARBITRATED, dbo.BX_SERVICES.VREQ2_RESP_DATE, 
                      dbo.BX_SERVICES.VREQ1_RESP_DATE, dbo.BX_SERVICES.FREEZE_BY, dbo.BX_SERVICES.FREEZE_DATE, dbo.BX_SERVICES.FREEZED, 
                      dbo.BX_SERVICES.INVOICE_ID, dbo.BX_SERVICES.LIT_PRCSS, dbo.BX_SERVICES.DENIAL_REASON, dbo.BX_SERVICES.DENIAL_DATE, 
                      dbo.BX_SERVICES.PREP_FOR_LIT
FROM         dbo.BX_SERVICES INNER JOIN
                      dbo.BX_SERVICE_STATUS ON dbo.BX_SERVICES.STATUS = dbo.BX_SERVICE_STATUS.ID INNER JOIN
                      dbo.BX_PHYSICIANS ON dbo.BX_SERVICES.RENDERED_BY = dbo.BX_PHYSICIANS.ID INNER JOIN
                      dbo.tblServiceType ON dbo.BX_SERVICES.TYPE = dbo.tblServiceType.ServiceType_ID LEFT OUTER JOIN
                      dbo.BX_PAYMENTS_VIEW ON dbo.BX_SERVICES.ID = dbo.BX_PAYMENTS_VIEW.SERVICE_ID
GROUP BY dbo.BX_SERVICES.AMOUNT, dbo.BX_SERVICES.DATE_SENT, dbo.BX_SERVICE_STATUS.NAME, dbo.BX_PHYSICIANS.NAME, 
                      dbo.tblServiceType.ServiceType, dbo.BX_SERVICES.DATE_CREATED, dbo.BX_SERVICES.CREATED_BY, dbo.BX_SERVICES.MEMO, 
                      dbo.BX_SERVICES.DATE_CLOSED, dbo.BX_SERVICES.CLOSED_BY, dbo.BX_SERVICES.DATE_LITIGATED, dbo.BX_SERVICES.LITIGATED_BY, 
                      dbo.BX_SERVICES.PREP_BY, dbo.BX_SERVICES.REFERENCE, dbo.BX_SERVICES.BATCH_ID, dbo.BX_SERVICES.ARBITRATED_BY, 
                      dbo.BX_SERVICES.DATE_ARBITRATED, dbo.BX_SERVICES.VREQ2_RESP_DATE, dbo.BX_SERVICES.VREQ1_RESP_DATE, 
                      dbo.BX_SERVICES.FREEZE_BY, dbo.BX_SERVICES.FREEZE_DATE, dbo.BX_SERVICES.INVOICE_ID, dbo.BX_SERVICES.LIT_PRCSS, 
                      dbo.BX_SERVICES.DENIAL_REASON, dbo.BX_SERVICES.DENIAL_DATE, dbo.BX_SERVICES.LITIGATED, dbo.BX_SERVICES.COMPLETE, 
                      dbo.BX_SERVICES.ARBITRATED, dbo.BX_SERVICES.FREEZED, dbo.BX_SERVICES.PREP_FOR_LIT, dbo.BX_SERVICES.ID, dbo.BX_SERVICES.CASE_ID
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
         Begin Table = "BX_SERVICES"
            Begin Extent = 
               Top = 0
               Left = 234
               Bottom = 322
               Right = 426
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BX_SERVICE_STATUS"
            Begin Extent = 
               Top = 52
               Left = 463
               Bottom = 160
               Right = 633
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "BX_PHYSICIANS"
            Begin Extent = 
               Top = 184
               Left = 455
               Bottom = 292
               Right = 622
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblServiceType"
            Begin Extent = 
               Top = 197
               Left = 7
               Bottom = 290
               Right = 179
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BX_PAYMENTS_VIEW"
            Begin Extent = 
               Top = 5
               Left = 677
               Bottom = 113
               Right = 871
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
   Beg' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BX_SERVICES_VIEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'in CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 3645
         Alias = 900
         Table = 1995
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BX_SERVICES_VIEW'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BX_SERVICES_VIEW'
GO
