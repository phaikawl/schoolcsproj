USE [TSQLFundamentals2008]
GO
/****** Object:  StoredProcedure [dbo].[addOrder]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addOrder] 
	@custid int,
	@empid int,
	@orderdate datetime,
	@requireddate datetime,
	@shippeddate datetime,
	@shipperid int,
	@freight money,
	@shipname Nvarchar(40),
	@shipaddress Nvarchar(60),
	@shipcity Nvarchar(15),
	@shipregion Nvarchar(15),
	@shippostalcode Nvarchar(10),
	@shipcountry Nvarchar(15)
AS
BEGIN
	INSERT INTO Orders (custid,empid,orderdate,requireddate,shippeddate,shiperid,freight,shipname,shipaddress,shipcity,shipregion,shippostalcode,shipcountry)
	VALUES (@custid,@empid,@orderdate,@requireddate,@shippeddate,@shipperid,@freight,@shipname,@shipaddress,@shipcity,@shipregion,@shippostalcode,@shipcountry)
END
GO
/****** Object:  StoredProcedure [dbo].[addNewShipper]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addNewShipper]
	@companyname nvarchar(40),
	@phone nvarchar(24)
AS
BEGIN
	INSERT INTO Sales.Shippers (companyname, phone) VALUES (@companyname, @phone)
END
GO
/****** Object:  StoredProcedure [dbo].[loadCustomersInfo]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[loadCustomersInfo] 

AS
BEGIN
	SELECT * FROM Sales.Customers
END
GO
/****** Object:  StoredProcedure [dbo].[insertSupplier]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertSupplier] 
	@companyname nvarchar(40),
	@contactname nvarchar(30),
	@contacttitle nvarchar(30),
	@address nvarchar(60),
	@city nvarchar(15),
	@region nvarchar(15),
	@postalcode nvarchar(10),
	@country nvarchar(15),
	@phone nvarchar(24),
	@fax nvarchar(24)
AS
BEGIN
	INSERT INTO Production.Suppliers(companyname,contactname,contacttitle,address,city,region,postalcode,country,phone,fax)
	VALUES (
	@companyname ,
	@contactname ,
	@contacttitle,
	@address,
	@city,
	@region ,
	@postalcode,
	@country,
	@phone,
	@fax )
END
GO
/****** Object:  StoredProcedure [dbo].[insertCategories]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertCategories] 

	@categoryname nvarchar(15),
	@description nvarchar(200)
AS
BEGIN
	INSERT INTO Production.Categories(categoryname,description)
	VALUES (
	
	@categoryname,
	@description
	)
	
END
GO
/****** Object:  StoredProcedure [dbo].[getSupplier]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getSupplier] 

	
AS
BEGIN
	SELECT * FROM Production.Suppliers
END
GO
/****** Object:  StoredProcedure [HR].[getEmployee]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [HR].[getEmployee]
	
AS
BEGIN
	
	SELECT * FROM Employees
END
GO
/****** Object:  StoredProcedure [dbo].[getCategories]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getCategories] 

	
AS
BEGIN
	SELECT * FROM Production.Categories
END
GO
/****** Object:  StoredProcedure [HR].[deleteEmployee]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [HR].[deleteEmployee]
	@empid INT

AS
BEGIN
	DELETE HR.Employees
	WHERE empid = @empid
END
GO
/****** Object:  StoredProcedure [dbo].[deleteCustomer]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteCustomer]
	@custid int
AS
BEGIN
	DELETE FROM Sales.Customers WHERE custid = @custid
END
GO
/****** Object:  StoredProcedure [dbo].[deleteCategories]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteCategories] 
@categoryid int
	
AS
BEGIN
	DELETE FROM Production.Categories WHERE categoryid=@categoryid
END
GO
/****** Object:  StoredProcedure [dbo].[addNewCustomer]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addNewCustomer] 
	@companyname nvarchar(40),
	@contactname nvarchar(30),
	@contacttitle nvarchar(30),
	@address nvarchar(60),
	@city nvarchar(15),
	@region nvarchar(15),
	@postalcode nvarchar(10),
	@country nvarchar(15),
	@phone nvarchar(24),
	@fax nvarchar(24)
AS
BEGIN
	INSERT INTO Sales.Customers (companyname, contactname, contacttitle, [address], city,
					region, postalcode, country, phone, fax)
			VALUES (@companyname, @contactname, @contacttitle, @address, @city, @region,
					@postalcode, @country, @phone, @fax)
END
GO
/****** Object:  StoredProcedure [HR].[addEmployee]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--

CREATE PROCEDURE [HR].[addEmployee] 
	-- Add the parameters for the stored procedure here
	@lastname NVARCHAR(30),
	@firstname NVARCHAR(30),
	@title NVARCHAR(30),
	@titleofcourtesy NVARCHAR(25),
	@birthdate datetime,
	@hiredate DATETIME,
	@address NVARCHAR(60),
	@city NVARCHAR(15),
	@region NVARCHAR(15),
	@postalcode NVARCHAR(10),
	@country NVARCHAR(15),
	@phone NVARCHAR(24),
	@mgrid INT
	
AS
BEGIN
	INSERT INTO HR.Employees( 
	lastname, 
	firstname, 
	title, 
	titleofcourtesy, 
	birthdate, 
	hiredate, 
	[address], 
	city, 
	region, 
	postalcode,
	country, 
	phone, 
	mgrid)
	VALUES ( @lastname , @firstname, @title, @titleofcourtesy, @birthdate, @hiredate,
			@address, @city, @region, @postalcode, @country, @phone, @mgrid)
END
GO
/****** Object:  StoredProcedure [dbo].[addEmployee]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--

CREATE PROCEDURE [dbo].[addEmployee] 
	-- Add the parameters for the stored procedure here
	@firstname NVARCHAR(30),
	@title NVARCHAR(30),
	@titleofcourtesy NVARCHAR(25),
	@birthdate datetime,
	@hiredate DATETIME,
	@address NVARCHAR(60),
	@city NVARCHAR(15),
	@region NVARCHAR(15),
	@postalcode NVARCHAR(10),
	@country NVARCHAR(15),
	@phone NVARCHAR(24),
	@mgrid INT
	
AS
BEGIN
	INSERT INTO HR.Employees( 
	lastname, 
	firstname, 
	title, 
	titleofcourtesy, 
	birthdate, 
	hiredate, 
	[address], 
	city, 
	region, 
	postalcode,
	country, 
	phone, 
	mgrid)
	VALUES ( 'zzz' , @firstname, @title, @titleofcourtesy, @birthdate, @hiredate,
			@address, @city, @region, @postalcode, @country, @phone, @mgrid)
END
GO
/****** Object:  StoredProcedure [dbo].[deleteSupplier]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteSupplier] 
@supplierID int
	
AS
BEGIN
	DELETE FROM Production.Suppliers WHERE supplierid=@supplierID
END
GO
/****** Object:  StoredProcedure [dbo].[deleteShipper]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteShipper]
	@shipperid int
AS
BEGIN
	DELETE FROM Sales.Shippers WHERE shipperid = @shipperid
END
GO
/****** Object:  StoredProcedure [dbo].[searchBySupID]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[searchBySupID] 
@supplierID int
	
AS
BEGIN
	SELECT * FROM Production.Suppliers
	WHERE supplierid=@supplierID
END
GO
/****** Object:  StoredProcedure [dbo].[searchByShipperName]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[searchByShipperName]
	@companyname nvarchar (40)
AS
BEGIN
	SELECT * FROM Sales.Shippers WHERE companyname LIKE '%' + @companyname + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[searchByCustomerName]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[searchByCustomerName]
	@contactname nvarchar (40)
AS
BEGIN
	SELECT * FROM Sales.Customers WHERE contactname LIKE '%' + @contactname + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[searchByContactName]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[searchByContactName] 
@contactname nvarchar(30)
	
AS
BEGIN
	SELECT * FROM Production.Suppliers
	WHERE contactname=@contactname
END
GO
/****** Object:  StoredProcedure [dbo].[searchByCompanyName]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[searchByCompanyName]
	@companyname nvarchar (40)
AS
BEGIN
	SELECT * FROM Sales.Customers WHERE companyname LIKE '%' + @companyname + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[searchByCatName]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[searchByCatName] 
@categoryname nvarchar(15)
	
AS
BEGIN
	SELECT * FROM Production.Categories
	WHERE categoryname LIKE '%' + @categoryname + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[searchByCatID]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[searchByCatID] 
@categoryid int
	
AS
BEGIN
	SELECT * FROM Production.Categories
	WHERE categoryid=@categoryid
END
GO
/****** Object:  StoredProcedure [HR].[updateEmployee]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [HR].[updateEmployee]
	@empid INT,
	@lastname NVARCHAR(20),
	@firstname NVARCHAR(10),
	@title NVARCHAR(30),
	@titleofcourtesy NVARCHAR(25),
	@birthdate DATETIME,
	@hiredate DATETIME,
	@address NVARCHAR(60),
	@city NVARCHAR(15),
	@region NVARCHAR(15),
	@postalcode NVARCHAR(10),
	@country NVARCHAR(15),
	@phone NVARCHAR(24),
	@mgrid INT
	
AS
BEGIN
	UPDATE HR.Employees
	SET lastname = @lastname,
		firstname = @firstname,
		title = @title,
		titleofcourtesy = @titleofcourtesy,
		birthdate = @birthdate,
		hiredate = @hiredate,
		[address] = @address,
		city = @city,
		region = @region,
		postalcode = @postalcode,
		country = @country,
		phone = @phone,
		mgrid = @mgrid
	WHERE empid = @empid
END
GO
/****** Object:  StoredProcedure [dbo].[updateCustomer]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateCustomer]
	@custid int,
	@companyname nvarchar(40),
	@contactname nvarchar(30),
	@contacttitle nvarchar(30),
	@address nvarchar(60),
	@city nvarchar(15),
	@region nvarchar(15),
	@postalcode nvarchar(10),
	@country nvarchar(15),
	@phone nvarchar(24),
	@fax nvarchar(24)
AS
BEGIN
	UPDATE Sales.Customers SET companyname = @companyname, contactname = @contactname,contacttitle = @contacttitle,
							[address] = @address, city = @city, region = @region, postalcode = @postalcode, country = @country,
							phone = @phone, fax = @fax WHERE custid = @custid
END
GO
/****** Object:  StoredProcedure [dbo].[updateCategories]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateCategories] 
	@categoryid int,
	@categoryname nvarchar(15),
	@description nvarchar(200)
AS
BEGIN
	UPDATE Production.Categories
	SET 
	categoryname=@categoryname,
	description=@description
	
	WHERE categoryid=@categoryid
END
GO
/****** Object:  StoredProcedure [dbo].[loadShipperInfo]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[loadShipperInfo]
AS
BEGIN

	SELECT * FROM Sales.Shippers
END
GO
/****** Object:  StoredProcedure [dbo].[updateSupplier]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateSupplier] 
	@supplierid int,
	@companyname nvarchar(40),
	@contactname nvarchar(30),
	@contacttitle nvarchar(30),
	@address nvarchar(60),
	@city nvarchar(15),
	@region nvarchar(15),
	@postalcode nvarchar(10),
	@country nvarchar(15),
	@phone nvarchar(24),
	@fax nvarchar(24)
AS
BEGIN
	UPDATE Production.Suppliers 
	SET 
	companyname=@companyname ,
	contactname=@contactname ,
	contacttitle=@contacttitle,
	address= @address,
	city=@city,
	region=@region ,
	postalcode=@postalcode,
	country=@country,
	phone=@phone,
	fax=@fax 
	
	WHERE supplierid=@supplierid
END
GO
/****** Object:  StoredProcedure [dbo].[updateShipper]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateShipper]
	@shipperid int,
	@companyname nvarchar(40),
	@phone nvarchar(24)
AS
BEGIN
	UPDATE Sales.Shippers SET companyname = @companyname, phone = @phone WHERE shipperid = @shipperid
END
GO
/****** Object:  StoredProcedure [dbo].[updateProduct]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateProduct]
	@id int,
	@name varchar(50),
	@supplierid int,
	@catid int,
	@unitprice money,
	@discontinued bit
AS
BEGIN
	UPDATE Production.Products SET
		productname = @name, supplierid = @supplierid,
		categoryid = @catid, unitprice = @unitprice,
		discontinued = @discontinued		
	WHERE productid = @id
END
GO
/****** Object:  StoredProcedure [dbo].[updateOrder]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateOrder]
	@orderid int, 
	@custid int,
	@empid int,
	@orderdate datetime,
	@requireddate datetime,
	@shippeddate datetime,
	@shipperid int,
	@freight money,
	@shipname Nvarchar(40),
	@shipaddress Nvarchar(60),
	@shipcity Nvarchar(15),
	@shipregion Nvarchar(15),
	@shippostalcode Nvarchar(10),
	@shipcountry Nvarchar(15)
AS
BEGIN
	UPDATE Sales.Orders SET
	custid = @custid,
	empid = @empid,
	orderdate = @orderdate,
	requireddate = @requireddate,
	shippeddate = @shippeddate,
	shipperid = @shipperid,
	freight = @freight,
	shipname = @shipname,
	shipaddress = @shipaddress,
	shipcity = @shipcity,
	shipregion = @shipregion,
	shippostalcode = @shippostalcode,
	shipcountry = @shipcountry
	WHERE orderid = @orderid
END
GO
/****** Object:  StoredProcedure [dbo].[loadOrdersInfo]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[loadOrdersInfo]
AS
BEGIN
	SELECT * FROM Sales.Orders
END
GO
/****** Object:  StoredProcedure [dbo].[searchProduct]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[searchProduct]
	@name nvarchar (50)
AS
BEGIN
	SELECT productid, productname, companyname, categoryname, unitprice, discontinued, S.supplierid, C.categoryid
	FROM Production.Products P
	INNER JOIN Production.Suppliers S ON P.supplierid = S.supplierid
	INNER JOIN Production.Categories C ON P.categoryid = C.categoryid
	WHERE productname LIKE '%' + @name + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[deleteProduct]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deleteProduct]
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Production.Products WHERE productid = @id
END
GO
/****** Object:  StoredProcedure [dbo].[deleteOrder]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteOrder]
	@orderid int
AS
BEGIN
	DELETE FROM Sales.Orders WHERE orderid = @orderid
END
GO
/****** Object:  StoredProcedure [dbo].[addNewProduct]    Script Date: 03/30/2015 20:00:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addNewProduct]
	-- Add the parameters for the stored procedure here
	@name varchar(50),
	@supplierid int,
	@catid int,
	@unitprice money,
	@discontinued bit
AS
BEGIN
	SET NOCOUNT ON;

    INSERT Production.Products (productName, supplierid, categoryid, unitprice, discontinued)
    VALUES (@name, @supplierid, @catid, @unitprice, @discontinued)
END
GO
