USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[LCJ_Payments_DataGrid]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LCJ_Payments_DataGrid]

(
@DomainId nvarchar(50),
@Case_Id NVARCHAR(100)

)
AS

Select * from LCJ_VW_PaymentsGrid where Case_Id= + @Case_Id and DomainId=@DomainId

GO
