USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[F_Template_Default_Node_Id_Template_Name_Retrieve]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[F_Template_Default_Node_Id_Template_Name_Retrieve]
(
	 @i_a_template_name varchar(800)=''
)
AS  
BEGIN  
SET NOCOUNT ON 

	SELECT
	I_TEMPLATE_ID,
	SZ_TEMPLATE_NAME,
	'G:\LawSpades\Application\DK_Atlas\CASEMANAGER\IISDOCS\RTF\' + SZ_TEMPLATE_PATH[SZ_TEMPLATE_PATH],
	nodes.NodeName
	FROM MST_TEMPLATES temp left join MST_DOCUMENT_NODES nodes
	on temp.fk_default_node_id=nodes.NodeID
	WHERE SZ_TEMPLATE_NAME=@i_a_template_name
	
 SET NOCOUNT OFF  
END

GO
