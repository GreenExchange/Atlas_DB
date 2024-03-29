USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[GET_ALL_TEMPLATES]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GET_ALL_TEMPLATES]--[GET_ALL_TEMPLATES] 'OSS'
	@user_type VARCHAR(10)
AS
BEGIN
	if (@user_type ='OSS')
		begin
			SELECT	m.I_TEMPLATE_ID [TEMPLATE_ID], m.SZ_TEMPLATE_NAME [TEMPLATE_NAME], m.SZ_TEMPLATE_FILENAME [TEMPLATE_FILE_NAME], t.user_type [user_type]
			FROM MST_TEMPLATES m 
			inner join TXN_TEMPLATES_ACCESS t on m.I_TEMPLATE_ID =t.template_id
			where t.user_type =@user_type
		end
	else	
		begin
			SELECT	m.I_TEMPLATE_ID [TEMPLATE_ID], m.SZ_TEMPLATE_NAME [TEMPLATE_NAME], m.SZ_TEMPLATE_FILENAME [TEMPLATE_FILE_NAME], t.user_type [user_type]
			FROM MST_TEMPLATES m 
			inner join TXN_TEMPLATES_ACCESS t on m.I_TEMPLATE_ID =t.template_id
		end
END
GO
