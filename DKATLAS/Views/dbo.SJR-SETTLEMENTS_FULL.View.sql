USE [DKATLAS]
GO
/****** Object:  View [dbo].[SJR-SETTLEMENTS_FULL]    Script Date: 6/17/2019 2:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[SJR-SETTLEMENTS_FULL]
AS
SELECT     TOP (100) PERCENT dbo.tblSettlements.Case_Id, CASE WHEN dbo.TblInsurancecompany.InsuranceCompany_Type = '1' AND 
                      SUM(dbo.tblSettlements.Settlement_Amount) 
                      > 0 THEN SUM(dbo.tblSettlements.Settlement_Amount + dbo.tblSettlements.Settlement_Int + dbo.tblSettlements.Settlement_Af + dbo.tblSettlements.Settlement_Ff)
                       WHEN dbo.TblInsurancecompany.InsuranceCompany_Type = '0' AND SUM(dbo.tblSettlements.Settlement_Amount) 
                      > 0 THEN SUM(dbo.tblSettlements.Settlement_Amount + dbo.tblSettlements.Settlement_Int + dbo.tblSettlements.Settlement_Af + dbo.tblSettlements.Settlement_Ff)
                       - 30 WHEN SUM(dbo.tblSettlements.Settlement_Amount) = 0 THEN 0 END AS Sett_tot, dbo.tblcase.Status, MIN(dbo.tblSettlements.Settlement_Date) 
                      AS Settl_date, SUM(dbo.tblSettlements.Settlement_Amount) AS Settlement_Amount, SUM(dbo.tblSettlements.Settlement_Int) AS Settlement_Int, 
                      SUM(dbo.tblSettlements.Settlement_Af) AS Settlement_Af, SUM(dbo.tblSettlements.Settlement_Ff) AS Settlement_Ff, 
					  CONVERT(money, dbo.tblcase.Claim_Amount) AS Claim_Amount, CONVERT(money, dbo.tblcase.Paid_Amount) AS Paid_Amount, 
					  CONVERT(money, dbo.tblcase.Fee_Schedule) AS Fee_Schedule,
					  dbo.tblSettlements.User_Id, 
                      dbo.tblSettlements.SettledWith, dbo.tblSettlements.Settlement_Batch, 
                      SUM(dbo.tblSettlements.Settlement_Amount + dbo.tblSettlements.Settlement_Int + dbo.tblSettlements.Settlement_Af + dbo.tblSettlements.Settlement_Ff)
                       AS Sett_tot_full, COUNT(dbo.tblSettlements.Settlement_Id) AS COA, dbo.tblSettlements.Settlement_SubBatch
FROM         dbo.tblInsuranceCompany INNER JOIN
                      dbo.tblcase ON dbo.tblInsuranceCompany.InsuranceCompany_Id = dbo.tblcase.InsuranceCompany_Id INNER JOIN
                      dbo.tblSettlements ON dbo.tblcase.Case_Id = dbo.tblSettlements.Case_Id
GROUP BY dbo.tblSettlements.Case_Id, dbo.tblInsuranceCompany.InsuranceCompany_Type, dbo.tblcase.Status, CONVERT(money, dbo.tblcase.Claim_Amount), 
                      CONVERT(money, dbo.tblcase.Paid_Amount), dbo.tblSettlements.User_Id, dbo.tblSettlements.SettledWith, dbo.tblSettlements.Settlement_Batch, 
                      dbo.tblSettlements.Settlement_SubBatch,tblcase.Fee_Schedule
ORDER BY dbo.tblSettlements.Case_Id

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[37] 4[20] 2[24] 3) )"
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
         Configuration = "(H (1[75] 4) )"
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
         Top = -23
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblInsuranceCompany"
            Begin Extent = 
               Top = 143
               Left = 612
               Bottom = 258
               Right = 877
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblcase"
            Begin Extent = 
               Top = 6
               Left = 293
               Bottom = 211
               Right = 583
            End
            DisplayFlags = 280
            TopColumn = 57
         End
         Begin Table = "tblSettlements"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 333
               Right = 263
            End
            DisplayFlags = 280
            TopColumn = 2
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
         Width = 2550
         Width = 2175
         Width = 1500
         Width = 1965
         Width = 1800
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
         Column = 4845
         Alias = 2085
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SJR-SETTLEMENTS_FULL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SJR-SETTLEMENTS_FULL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=0x00 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SJR-SETTLEMENTS_FULL'
GO
