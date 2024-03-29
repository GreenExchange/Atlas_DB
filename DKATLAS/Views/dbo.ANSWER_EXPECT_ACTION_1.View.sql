USE [DKATLAS]
GO
/****** Object:  View [dbo].[ANSWER_EXPECT_ACTION_1]    Script Date: 6/17/2019 2:53:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ANSWER_EXPECT_ACTION_1]
AS
SELECT     dbo.[SJR-ANSWER_EXPECT].Case_Id, dbo.[SJR-ANSWER_EXPECT].Case_Code, CASE WHEN ANS_EXPECT IS NULL THEN 'ERROR' WHEN GETDATE() 
                      BETWEEN ANS_EXPECT AND (ANS_EXPECT + 0) THEN 'LATE ANSWER' WHEN GETDATE() > (ANS_EXPECT + 0) THEN 'DEFAULT' WHEN GETDATE() 
                      < ANS_EXPECT THEN 'WAITING' END AS ACTION, dbo.[SJR-ANSWER_EXPECT].ANS_EXPECT, CONVERT(VARCHAR(4), 
                      YEAR(dbo.[SJR-ANSWER_EXPECT].ANS_EXPECT)) + '-' + CONVERT(VARCHAR(2), MONTH(dbo.[SJR-ANSWER_EXPECT].ANS_EXPECT)) AS MONTH, 
                      dbo.tblInsuranceCompany.InsuranceCompany_Name, dbo.tblProvider.Provider_Name, 
                      dbo.tblcase.InjuredParty_FirstName + N' ' + dbo.tblcase.InjuredParty_LastName AS Injured_Party, dbo.tblcase.Ins_Claim_Number, 
                      dbo.tblcase.IndexOrAAA_Number, dbo.[SJR-ANSWER_EXPECT].Served_On_Date, 
                      CASE WHEN dbo.[SJR-ANSWER_EXPECT].STATUS = 'ANSWER-RCVD-LATE' THEN 'RCVD' ELSE NULL END AS LAR
FROM         dbo.tblProvider INNER JOIN
                      dbo.tblcase ON dbo.tblProvider.Provider_Id = dbo.tblcase.Provider_Id INNER JOIN
                      dbo.tblInsuranceCompany ON dbo.tblcase.InsuranceCompany_Id = dbo.tblInsuranceCompany.InsuranceCompany_Id INNER JOIN
                      dbo.[SJR-ANSWER_EXPECT] ON dbo.tblcase.Case_Id = dbo.[SJR-ANSWER_EXPECT].Case_Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[17] 3) )"
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
         Begin Table = "tblProvider"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblcase"
            Begin Extent = 
               Top = 6
               Left = 272
               Bottom = 121
               Right = 546
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblInsuranceCompany"
            Begin Extent = 
               Top = 6
               Left = 584
               Bottom = 121
               Right = 833
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SJR-ANSWER_EXPECT"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 241
               Right = 245
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
      Begin ColumnWidths = 13
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1155
         Alias = 990
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ANSWER_EXPECT_ACTION_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ANSWER_EXPECT_ACTION_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ANSWER_EXPECT_ACTION_1'
GO
