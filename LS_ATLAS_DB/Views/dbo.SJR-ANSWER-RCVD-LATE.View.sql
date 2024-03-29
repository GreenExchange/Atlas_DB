USE [LS_ATLAS_DB]
GO
/****** Object:  View [dbo].[SJR-ANSWER-RCVD-LATE]    Script Date: 6/17/2019 2:29:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SJR-ANSWER-RCVD-LATE]
AS
SELECT     dbo.tblcase.Case_Id, dbo.tblcase.Case_Code, dbo.tblInsuranceCompany.InsuranceCompany_Name, dbo.tblProvider.Provider_Name, 
                      dbo.tblcase.InjuredParty_FirstName + N' ' + dbo.tblcase.InjuredParty_LastName AS PATIENT, dbo.tblcase.Status, dbo.tblCase_Date_Details.Date_Answer_Received, 
                      CASE WHEN (Date_Ext_Of_Time_3 IS NOT NULL) THEN Date_Ext_Of_Time_3 WHEN (Date_Ext_Of_Time_2 IS NOT NULL) AND 
                      (Date_Ext_Of_Time_3 IS NULL) THEN Date_Ext_Of_Time_2 WHEN (Date_Ext_Of_Time IS NOT NULL) AND (Date_Ext_Of_Time_2 IS NULL) 
                      THEN Date_Ext_Of_Time WHEN (Date_Ext_Of_Time IS NULL) AND (InsuranceCompany_Name NOT LIKE '%GEICO%') THEN (Served_on_date + 35) 
                      WHEN (Date_Ext_Of_Time IS NULL) AND (InsuranceCompany_Name LIKE '%GEICO%') THEN (Served_on_date + 60) END AS ANS_EXPECT
FROM         dbo.tblcase INNER JOIN
                      dbo.tblInsuranceCompany ON dbo.tblcase.InsuranceCompany_Id = dbo.tblInsuranceCompany.InsuranceCompany_Id INNER JOIN
                      dbo.tblProvider ON dbo.tblcase.Provider_Id = dbo.tblProvider.Provider_Id
					  LEFT OUTER JOIN dbo.tblCase_Date_Details ON tblcase.Case_Id = dbo.tblCase_Date_Details.Case_Id
WHERE     (dbo.tblcase.Status = N'ANSWER-RCVD-LATE')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[28] 2[12] 3) )"
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
               Bottom = 252
               Right = 312
            End
            DisplayFlags = 280
            TopColumn = 36
         End
         Begin Table = "tblInsuranceCompany"
            Begin Extent = 
               Top = 6
               Left = 350
               Bottom = 121
               Right = 599
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblProvider"
            Begin Extent = 
               Top = 6
               Left = 637
               Bottom = 121
               Right = 833
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
         Width = 2265
         Width = 2100
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 5820
         Alias = 1860
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 2280
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SJR-ANSWER-RCVD-LATE'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SJR-ANSWER-RCVD-LATE'
GO
