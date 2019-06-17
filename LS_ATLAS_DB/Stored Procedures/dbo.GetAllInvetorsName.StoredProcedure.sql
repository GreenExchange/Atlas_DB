USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[GetAllInvetorsName]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllInvetorsName]        
(    
@DomainId VARCHAR(50)   
 )     
AS        
BEGIN      
    
   SELECT   Name as Name,  
   InvestorId AS InvestorId   
   FROM tbl_Investor    
   WHERE DomainId =@DomainId     
      
    
END
GO
