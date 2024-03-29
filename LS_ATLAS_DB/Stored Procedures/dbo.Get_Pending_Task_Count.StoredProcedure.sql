USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_Pending_Task_Count]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_Pending_Task_Count]
	@s_a_DomainID varchar(50),
	@i_a_User_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

       Select 
	   Count(*) As TaskCount 
	   from Task T Left Join 
	   Task_Status TS on T.Task_Status_ID = TS.Task_Status_ID
	   Where 
	   T.DomainID = @s_a_DomainID and ISNULL(TS.Description,'') !='completed' and Assign_User_ID = @i_a_User_ID
END
GO
