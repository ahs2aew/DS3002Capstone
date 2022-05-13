select * from dbo.[Categories];


-- here's the query for part 1.3 in Databricks: 
SELECT ccd.CustomerID -- should be selecting table.columns here 
    , ccd.CustomerTypeID   
    , c.CustomerID 
    , c.CompanyName 
    , c.ContactName
    , c.ContactTitle
    , c.Address  
    , c.City
    , c.Region
    , c.PostalCode
    , c.Country
    , c.Phone
    , c.Fax
    , cd.CustomerTypeID
    , cd.CustomerDesc
FROM dbo.CustomerCustomerDemo AS ccd
INNER JOIN dbo.Customers AS c 
ON ccd.CustomerID = c.CustomerID
INNER JOIN dbo.CustomerDemographics AS cd
ON cd.CustomerTypeID = ccd.CustomerTypeID;

INSERT INTO [dbo].[fact_customers]
([CustomerID],
[CustomerTypeID],
[CustomerDesc],
[CompanyName],
[ContactName],
[ContactTitle],
[Address],
[City],
[Region],
[PostalCode],
[Country],
[Phone],
[Fax])
SELECT ccd.CustomerID,
    ccd.CustomerTypeID,
    c.CustomerID,
    c.CompanyName,
    c.ContactName,
    c.ContactTitle,
    c.Address,
    c.City,
    c.Region,
    c.PostalCode,
    c.Country,
    c.Phone,
    c.Fax,
    cd.CustomerDesc,
FROM [dbo].[CustomerCustomerDemo] AS ccd4
INNER JOIN [dbo].[Customers] AS c 
ON c.CustomerID = ccd.CustomerID
INNER JOIN [dbo].[CustomerDemographics] AS cd 
ON ccd.CustomerTypeID = cd.CustomerTypeID; 

CREATE TABLE [dbo].[fact_customers] (
[CustomerID] INT NULL DEFAULT NULL,
[CustomerTypeID] INT NULL DEFAULT NULL, 
[CompanyName] VARCHAR(200) DEFAULT NULL, 
[ContactName] VARCHAR(200) DEFAULT NULL,
[ContactTitle] VARCHAR(200) DEFAULT NULL,  
[Address] TEXT NULL DEFAULT NULL, 
[City] VARCHAR(50) DEFAULT NULL, 
[Region] VARCHAR(100) DEFAULT NULL, 
[PostalCode] VARCHAR(50) DEFAULT NULL, 
[Country] VARCHAR(50) DEFAULT NULL, 
[Phone] VARCHAR(50) DEFAULT NULL, 
[Fax] VARCHAR(50) DEFAULT NULL, 
[CustomerDesc] TEXT NULL DEFAULT NULL)
;
