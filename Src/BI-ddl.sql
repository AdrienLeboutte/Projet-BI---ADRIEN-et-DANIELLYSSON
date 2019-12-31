
USE [DataWarehouse]
GO



DROP TABLE FactSale
GO

DROP TABLE DimCustomer
GO

DROP TABLE DimDate
GO

DROP TABLE DimProduct
GO

DROP TABLE DimSeller
GO

DROP TABLE DimStore
GO




create table DimCustomer (
	Id nvarchar(250) not null ,
	CompanyName nvarchar(250),
	ContactName nvarchar(250),
	ContactTitle nvarchar(250),
	Adress nvarchar(250),
	City nvarchar(250),
	Region nvarchar(250),
	PostalCode nvarchar(250),
	Country nvarchar(250),
	Phone nvarchar(250),
	fax nvarchar(250)
	
    constraint DimCustomer_Id_Pk primary key(Id)
);

create table DimSeller (
	Id int not null  ,    
    LastName nvarchar(250),
    FirstName nvarchar(250),
	Title nvarchar(250),
	TitleOfCourtesy nvarchar(250),
	Adress nvarchar(250),
	City nvarchar(250),
	Region nvarchar(250),
	PostalCode nvarchar (250),
	Country nvarchar(250),
	ReportsTo int,
	HomePhone nvarchar(250),
	Notes ntext,
	TerritoryDescription nvarchar(250),
	RegionDescription nvarchar(250)
	
	constraint DimSeller_Id_Pk primary key(Id)

);


create table DimProduct (
	Id int not null identity,
    
	Name nvarchar(250),
	SupplierCompanyName nvarchar(250),
	SupplierContactName nvarchar(250),
	SupplierContactTitle nvarchar(250),
	SupplierAdress nvarchar(250),
	SupplierPostal nvarchar(250),
	SupplierCountry nvarchar(250),
	SupplierPhone nvarchar(250),
	SupplierFax nvarchar(250),
	SupplierHomePage ntext,
	CategoryName nvarchar(250),
	CategoryDescription ntext,
	QuantityPerUnit nvarchar(250),
	UnitPrice money,
	UnitsInStock smallInt,
	UnitsOnOrder smallInt,
	ReorderLevel smallInt,
	Discontinued bit,
	
	constraint DimProduct_Id_Pk primary key(Id)

);

create table DimStore (
	Id int not null identity ,
    
    Name nvarchar(250),
    Size int 
);

create table DimDate (
	Id int not null identity,
	Date datetime,
	DayNumber nvarchar(250),
	WeekNumber nvarchar(250),
	MonthNumber nvarchar(250),
	YearNumber nvarchar(250),
	DayFrenchName nvarchar(250),
    DayEnglishName nvarchar(250),
    MonthFrenchName nvarchar(250),
    MonthEnglishName nvarchar(250),
    DayOfWeekNumber nvarchar(250),
    DayOfYearNumber nvarchar(250)
	
	constraint DimDate_Id_Pk primary key(Id)
);

create table FactSale (
	Id int not null identity ,
    
    UnitPrice decimal(5,2),
    Quantity int,
    Discount decimal(4,2),
    TotalPrice decimal (10,2),
	TotalPriceWithDiscount decimal (10,2),
	Mark nvarchar(250),
	ShipperCompanyName nvarchar(250),
	ShipperPhone nvarchar(250),
	Freight  money,
	ShipName nvarchar(250),
	ShipAdress nvarchar(250),
	ShipCity nvarchar (250),
	ShipRegion nvarchar(250),
	ShipPostalCode nvarchar(250),
	ShipCountry nvarchar(250),
	IsOnline bit,
	Customer nvarchar(250),
	DateSale int,
    Product int,
	Seller int,
	
	
	constraint FactSale_Id_Pk primary key(Id,Product)
);

alter table FactSale add constraint Customer_FK
     foreign key (Customer)
     references DimCustomer
	 
alter table FactSale add constraint DateSale_FK
     foreign key (DateSale)
     references DimDate
	 
alter table FactSale add constraint Product_FK
     foreign key (Product)
     references DimProduct
	 
alter table FactSale add constraint Seller_FK
     foreign key (Seller)
     references DimSeller

ALTER TABLE DimSeller  WITH NOCHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([ReportsTo])
REFERENCES DimSeller (Id)