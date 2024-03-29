USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_Packeted_Cases]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_Packeted_Cases] 
	@s_a_CaseId varchar(50),
	@s_a_DomainId varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;

	Declare @PacketId int

	Select @PacketId = isnull(FK_Packet_ID, 0) from tblCase(NOLOCK) where Case_Id = @s_a_CaseId and DomainId = @s_a_DomainId

	Select Case_Id from tblCase(NOLOCK) 
	where (Case_Id=@s_a_CaseId or (@PacketId != 0 and FK_Packet_ID=@PacketId)) and DomainId = @s_a_DomainId

END
GO
