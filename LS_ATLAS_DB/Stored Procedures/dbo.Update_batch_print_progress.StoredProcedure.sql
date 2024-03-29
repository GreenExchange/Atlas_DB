USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Update_batch_print_progress]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Update_batch_print_progress] 
	@i_a_pk_batch_print_Id int,
	@s_a_DomainId varchar(50),
	@b_a_in_progress bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from 1
	update tbl_batch_print_offline_queue set in_progress= @b_a_in_progress
	where pk_batch_print_Id= @i_a_pk_batch_print_Id and DomainId= @s_a_DomainId
END
GO
