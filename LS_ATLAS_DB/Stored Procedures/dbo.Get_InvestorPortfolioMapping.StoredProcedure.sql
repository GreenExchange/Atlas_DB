USE [LS_ATLAS_DB]
GO
/****** Object:  StoredProcedure [dbo].[Get_InvestorPortfolioMapping]    Script Date: 6/17/2019 2:29:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_InvestorPortfolioMapping]  -- exec Get_InvestorPortfolioMapping  'priya'    
(     
   @InvestorId INT =0,     
   @DomainId   VARCHAR(50)       
)      
AS      
BEGIN      
   SELECT    inp.Id,    
             p.Name ,    
             inp.InvestmentAmount,    
             inp.InvestmentPercentage,  
          inp.PortfolioId  
          
   FROM        tbl_InvestorPortfolio inp    
   JOIN        tbl_Portfolio  p    
    
   ON          p.Id = inp.PortfolioId    
       
   WHERE       p.DomainId=@DomainId    
   AND         inp.DomainId= @DomainId     
   AND         inp.InvestorId=@InvestorId    
             
END 
GO
