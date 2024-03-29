USE [DKATLAS]
GO
/****** Object:  View [dbo].[BX_MAIL_RANK]    Script Date: 6/17/2019 2:53:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BX_MAIL_RANK]
AS
SELECT     tblInsuranceCompany.InsuranceCompany_Name, tblProvider.Provider_Name, tblInsuranceCompany.BILLING_ADDRESS, 
                      tblInsuranceCompany.BILLING_CITY + ',' + tblInsuranceCompany.BILLING_STATE + ' ' + tblInsuranceCompany.BILLING_ZIP AS BILLING_ADDRESS2, 
                      CONVERT(VARCHAR(20), BX_SERVICES.DOS_START, 101) + ' - ' + CONVERT(VARCHAR(20), BX_SERVICES.DOS_END, 101) AS DOS, 
                      BX_SERVICES.DATE_SENT, BX_SERVICES.AMOUNT, BX_CASE.CASE_ID_LONG, 
                      BX_CASE.PATIENT_LASTNAME + ', ' + BX_CASE.PATIENT_FIRSTNAME AS PATIENT, BX_CASE.CLAIM_NUMBER, tblProvider.Provider_Local_Address, 
                      tblProvider.Provider_Local_City + ', ' + tblProvider.Provider_Local_State + ' ' + tblProvider.Provider_Local_Zip AS Provider_Local_Address2, 
                      BX_SERVICES.REFERENCE, (RANK() OVER (PARTITION BY CONVERT(VARCHAR(20),BX_SERVICES.DATE_SENT,1),tblProvider.Provider_id ORDER BY BX_SERVICES.CASE_ID,BX_SERVICES.ID)) AS RANK_ABS,BX_SERVICES.ID
FROM         BX_CASE INNER JOIN
                      BX_SERVICES ON BX_CASE.CASE_ID = BX_SERVICES.CASE_ID INNER JOIN
                      tblProvider ON BX_CASE.PROVIDER = tblProvider.Provider_Id INNER JOIN
                      tblInsuranceCompany ON BX_CASE.INSURANCE = tblInsuranceCompany.InsuranceCompany_Id
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
         Begin Table = "BX_CASE"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 238
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BX_MAIL_RANK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BX_MAIL_RANK'
GO
