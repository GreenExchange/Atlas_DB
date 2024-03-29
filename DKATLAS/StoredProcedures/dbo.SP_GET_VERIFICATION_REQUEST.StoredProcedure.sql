USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[SP_GET_VERIFICATION_REQUEST]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GET_VERIFICATION_REQUEST]
	@SZ_CASE_ID NVARCHAR(20)
as
begin
	select i_verification_id,isnull(convert(nvarchar(10),dt_verification_received,101),'') [date_received],
	isnull(convert(nvarchar(10),dt_verification_replied,101),'') [date_replied], 
	sz_notes,sz_user_id
	from TXN_VERIFICATION_REQUEST where sz_case_id = @SZ_CASE_ID
end
GO
