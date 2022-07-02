create database SuperstoreCube;
go
use SuperstoreCube;
go
create table DimTime (
	TimeID int primary key,
	OrderYear int,
	OrderQuarter int,
	OrderMonth int,
	OrderDay int,
	ShipYear int,
	ShipQuarter int,
	ShipMonth int,
	ShipDay int
);
go
create table DimLocations(
	Martket nvarchar(255),
	Region nvarchar(255),
	Country nvarchar(255),
	State nvarchar(255),
	City nvarchar(255),
	PostalCode float(8),
	LocationID int primary key
);
go
create table DimCustomer (
	CustomerID nvarchar(255) primary key,
	CustomerName nvarchar(255),
	Segment nvarchar(255)
);
go
create table DimProduct(
	ProductID nvarchar(255) primary key,
	Category nvarchar(255),
	SubCategory	nvarchar(255),
	ProductName nvarchar(255)
);
go
CREATE TABLE FactOrders(
	RowID float(16) primary key,
	OrderID nvarchar(255) not null,
	CustomerID nvarchar(255) not null,
	FOREIGN KEY(CustomerID) REFERENCES dbo.DimCustomer(CustomerID),
	ProductID nvarchar(255) not null,
	FOREIGN KEY(ProductID) REFERENCES dbo.DimProduct(ProductID),
	TimeID int not null,
	FOREIGN KEY(TimeID) references dbo.DimTime(TimeID),
	LocationID int not null,
	foreign key (LocationID) references dbo.DimLocations(LocationID),
	Sales float,
	Quantity float NULL,
	Discount float NULL,
	Profit float NULL,
	ShippingCost float NULL,
	OrderPriority nvarchar(255) NULL,
	ShipMode nvarchar(255)
);
