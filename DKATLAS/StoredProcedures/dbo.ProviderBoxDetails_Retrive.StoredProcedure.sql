USE [DKATLAS]
GO
/****** Object:  StoredProcedure [dbo].[ProviderBoxDetails_Retrive]    Script Date: 6/17/2019 2:54:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProviderBoxDetails_Retrive] 
(
	@i_a_BatchAuto_Id		INT = 0

)
AS        
BEGIN  
    SELECT 
			Batch_AutoId,batch_no,A.Provider_ID, Provider_Name,no_of_cases 
				
			, A.created_by_user	
			, CONVERT(VARCHAR(10), A.created_date, 101) AS created_date
			, A.modified_by_user	
			, CONVERT(VARCHAR(10), A.modified_date, 101) AS modified_date
	 FROM
		 tblProvListBoxDetails A 
		 LEFT JOIN tblProvider B
	
     ON  (A.Provider_ID = B.Provider_Id) order by Batch_No desc
		
		 
	 	
END




--Drop table tblProvListBoxDetails

--CREATE TABLE tblProvListBoxDetails ( 
--Batch_AutoId INT IDENTITY (1,1),
--Batch_No varchar(100),
--Provider_ID varchar(100),
--No_Of_Cases varchar(200),
--Created_By_User nvarchar(50) NOT NULL  DEFAULT ('admin'),
--Created_Date datetime NULL,
--Modified_By_User nvarchar(50) NULL,
--Modified_Date datetime NULL
-- )
GO
