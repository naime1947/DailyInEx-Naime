CREATE TABLE [dbo].[Company]
(
	[Id] INT NOT NULL PRIMARY KEY Identity, 
    [CompanyName] NVARCHAR(50) NOT NULL, 
    [CompanyEmail] NVARCHAR(50) NOT NULL, 
    [Password] NVARCHAR(50) NOT NULL, 
    [Address] NVARCHAR(200) NOT NULL, 
    [CountryId] INT NOT NULL, 
    CONSTRAINT [FK_Company_ToTable] FOREIGN KEY (CountryId) REFERENCES [Country]([Id])
)
