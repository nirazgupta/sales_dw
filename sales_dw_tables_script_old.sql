create table dimbrand(
	brand_key int identity(1,1) not null primary key,
	brand_id int,
	brand_name varchar(50)
);

create table dimbranch(
	branch_key int identity(1,1) not null primary key,
	branch_id int,
	street_address varchar(40),
	postal_code varchar(15),
	city varchar(15),
	state_province varchar(15),
	region_id int
);

create table dimcategory(
	category_key int identity(1,1) not null primary key,
	category_id int,
	category_name varchar(50)
);

create table dimcommission(
	commission_key int identity(1,1) not null primary key,
	commission_id int,
	commission decimal(38,0),
	paid_date datetime2(7),
	employee_id int
);

create table dimcommission_audit(
	com_au_key int identity(1,1) not null primary key,
	com_au_id int,
	employee_id int,
	activity_date datetime2(7),
	orig_comm_amt numeric(20),
	new_comm_amt numeric(20)
);

create table dimcustomer(
	customer_key int identity(1,1) not null primary key,
	customer_id int,
	lname varchar(20),
	fname varchar(20),
	street_address varchar(30),
	city varchar(15),
	state_province varchar(15),
	postal_code int,
	branch_id int
);

create table dimdepartment(
	department_key int identity(1,1) not null primary key,
	department_id int,
	department_name varchar(30),
	branch_id int
);

create table dimemployee(
	employee_key int identity(1,1) not null primary key,
	employee_id int,
	lname varchar(15),
	fname varchar(15),
	street varchar(30),
	city varchar(15),
	state_province varchar(15),
	zip numeric(15,0),
	dob datetime2(7),
	hire_date datetime2(7),
	job_title_id int,
	department_id int,
	branch_id int
);

create table diminventory(
	inventory_key int identity(1,1) not null primary key,
	inventory_id int,
	qoh numeric(15,0),
	reorder_level numeric(15,0),
	reorder_quantity numeric(15),
	product_id int,
	warehouse_id int,
	backorder numeric(15,0)
);

create table dimjob_title(
	job_title_key int identity(1,1) not null primary key,
	job_title_id int,
	job_title varchar(50)
);

create table dim_monthly_commissions(
	employee_key int identity(1,1) not null primary key,
	employee_id int,
	v_year varchar(20),
	v_month varchar(20),
	comm_amt numeric(20,0)
);

create table dim_order_line(
	order_line_key int identity(1,1) not null primary key,
	order_line_id int,
	qty numeric(15,0),
	order_id int,
	product_id int
);

--not created
create table dim_orders(
	order_key int identity(1,1) not null primary key,
	order_id int,
	order_date datetime2(7),
	required_date datetime2(7),
	shipped_date datetime2(7),
	shipping_charge varchar(50),
	subtotal varchar(50),
	total varchar(50),
	s_m_id int,
	customer_id int,
	branch_id int,
	employee_id int,
	tax_id int
);

create table dim_phone(
	phone_key int identity(1,1) not null primary key,
	phone_id int,
	contact_name varchar(20),
	phone_number varchar(20),
	contact_type varchar(20),
	customer_id int
);

create table dim_prod_vend_ol(
	pv_ol_key int identity(1,1) not null primary key,
	pv_ol_id int,
	product_id int,
	pv_ord_id int,
	qty numeric(15,0)
);

create table dim_prod_vend_ord(
	pv_ord_key int identity(1,1) not null primary key,
	pv_ord_id int,
	order_date datetime2(7),
	expected_ship_date datetime2(7),
	shipped_date datetime2(7),
	total_cost numeric(15,0),
	vendor_id int
);

create table dim_product(
	product_key int identity(1,1) not null primary key,
	product_id int,
	product_name varchar(80),
	unit_price varchar(20),
	unit_cost varchar(20),
	brand_id int,
	category_id int
);

create table dim_product_discount(
	discount_key int identity(1,1) not null primary key,
	discount_id int,
	discount_percent decimal(3,2),
	discount_amt varchar(20),
	quantity numeric(15,0),
	product_id int
);

create table dim_promo_price(
	promo_price_key int identity(1,1) not null primary key,
	promo_price_id int,
	promo_price numeric(15,0),
	start_date datetime2(7),
	end_date datetime2(7),
	product_id int
);

create table dim_region(
	region_key int identity(1,1) not null primary key,
	region_id int,
	timezone varchar(40)
);

create table dim_return_category(
	ret_cat_key int identity(1,1) not null primary key,
	ret_cat_id int,
	description varchar(20)
);

create table dim_returnprod(
	return_key int identity(1,1) not null primary key,
	return_id int,
	order_line_id int,
	retr_qty numeric(15,0),
	date_returned datetime2(7),
	refund decimal(10,0),
	ret_cat_id int
);

create table dim_salary(
	job_title_key int identity(1,1) not null primary key,
	job_title_id int,
	salary varchar(20)
);

create table dim_shipping_method(
	s_m_key int identity(1,1) not null primary key,
	s_m_id int,
	ship_method_name varchar(30),
	price decimal(10,3)
);

create table dim_tax(
	tax_key int identity(1,1) not null primary key,
	tax_id int,
	tax_percent decimal(3,2)
);

create table dim_vend_ship(
	vend_ship_key int identity(1,1) not null primary key,
	vend_ship_id int,
	vendor_id int,
	s_m_id int
);

create table dim_vendor(
	vendor_key int identity(1,1) not null primary key,
	vendor_id int,
	vendor_name varchar(20),
	street_address varchar(30),
	city varchar(15),
	state varchar(15),
	zip varchar(15),
	phone_number varchar(15)
);

create table dim_vendor_price(
	vendor_price_key int identity(1,1) not null primary key,
	vendor_price_id int,
	vendor_price numeric(15,0),
	discount numeric(15,0),
	start_date datetime2(7),
	end_date datetime2(7),
	product_id int,
	vendor_id int
);

create table dim_warehouse(
	warehouse_key int identity(1,1) not null primary key,
	warehouse_id int,
	street_address varchar(30),
	city varchar(30),
	state varchar(5),
	postal_code numeric(15,0),
	phone varchar(15),
	region_id int
);

insert into dimbrand
select brand_id, brand_name from v3b.dbo.brand;

insert into dim_monthly_commissions
select * from v3b.dbo.MONTHLY_COMMISSIONS;

insert into dim_order_line
select * from v3b.dbo.ORDER_LINE;

insert into dim_phone
select * from v3b.dbo.PHONE;

insert into dim_prod_vend_ol
select PV_OL_ID, PRODUCT_ID, PV_ORD_ID, QTY from v3b.dbo.PROD_VEND_OL;

insert into dim_prod_vend_ord
select * from v3b.dbo.PROD_VEND_ORD;

insert into dim_product
select * from v3b.dbo.PRODUCT;

insert into dim_product_discount
select * from v3b.dbo.PRODUCT_DISCOUNT;

insert into dim_promo_price
select * from v3b.dbo.PROMO_PRICE;

insert into dim_region
select * from v3b.dbo.REGION;

insert into dim_return_category
select * from v3b.dbo.RETURN_CATEGORY;

insert into dim_returnprod
select * from v3b.dbo.RETURNPROD;

insert into dim_salary
select * from v3b.dbo.salary;

insert into dim_shipping_method
select * from v3b.dbo.shipping_method;

insert into dim_tax
select * from v3b.dbo.TAX;

insert into dim_vend_ship
select * from v3b.dbo.VEND_SHIP;

insert into dim_vendor
select * from v3b.dbo.VENDOR;

insert into dim_vendor_price
select * from v3b.dbo.VENDOR_PRICE;

insert into dim_warehouse
select * from v3b.dbo.WAREHOUSE;

insert into dimbranch
select * from v3b.dbo.branch;

insert into dimbrand
select * from v3b.dbo.BRAND;

insert into dimcategory
select * from v3b.dbo.CATEGORY;

insert into dimcommission
select * from v3b.dbo.COMMISSION;

insert into dimcommission_audit
select * from v3b.dbo.COMMISSION_AUDIT;

insert into dimcustomer
select * from v3b.dbo.CUSTOMER;

insert into dimdepartment
select * from v3b.dbo.DEPARTMENT;

insert into dimemployee
select * from v3b.dbo.EMPLOYEE;

insert into diminventory
select * from v3b.dbo.INVENTORY;

insert into dimjob_title
select * from v3b.dbo.JOB_TITLE;

