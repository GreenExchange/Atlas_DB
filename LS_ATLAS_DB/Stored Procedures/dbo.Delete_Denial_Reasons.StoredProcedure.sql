USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Denial_Reasons]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_Denial_Reasons]
	@DomainId NVARCHAR(50),
	@I_txn_Treatment_Id int
as
	Delete From TXN_tblTreatment 
	Where I_txn_Treatment_Id =@I_txn_Treatment_Id and DomainId=@DomainId

GO
