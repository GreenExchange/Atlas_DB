USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[Get_ProviderBoxDetails]    Script Date: 6/17/2019 2:54:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_ProviderBoxDetails] 
(
	@provider_name varchar(100)
)
  
AS  
BEGIN

	SELECT provider_name,batch_no,convert(varchar(10),box_rec_Date,101) as box_rec_Date,no_of_cases,ISNULL(UserName,'') AS UserName
	FROM tblProviderBoxDetails
	WHERE provider_name like @provider_name + '%' and box_rec_date is not null 
	ORDER BY provider_name

End
GO
