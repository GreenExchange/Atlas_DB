USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Get_Denial_Reasons]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Denial_Reasons]
	@Treatment_Id int  
as
	/*Select I_txn_Treatment_Id,
		Treatment_Id,
			(Select DenialReasons_Type From tblDenialReasons Where DenialReasons_Id=TXN_tblTreatment.DenialReasons_Id) [DenialReasons_Type],
			(Select i_category_id From tblDenialReasons Where DenialReasons_Id=TXN_tblTreatment.DenialReasons_Id) [Category_id],
				DenialReasons_Id
				From TXN_tblTreatment
				Where Treatment_Id = @Treatment_Id
	*/
	select i_txn_treatment_id,treatment_id,DenialReasons_Type,sz_category_color,Action_type from txn_tbltreatment
		join tblDenialReasons on tblDenialReasons.denialreasons_id = txn_tbltreatment.denialreasons_id
		join MST_DENIAL_CATEGORY on MST_DENIAL_CATEGORY.i_category_id = tblDenialReasons.i_category_id
		where txn_tbltreatment.treatment_id = @Treatment_Id
GO
