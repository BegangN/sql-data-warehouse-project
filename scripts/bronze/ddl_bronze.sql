/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
    Run this script to re-define the DDL structure of 'bronze' Tables
    - Bronze layer stores raw, untransformed data ingested from source systems.
===============================================================================
*/

-- Drop and create customer information table from CRM source
IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;
GO

CREATE TABLE bronze.crm_cust_info (
    cst_id              INT,            -- Customer unique ID
    cst_key             NVARCHAR(50),   -- Source key from CRM system
    cst_firstname       NVARCHAR(50),   -- Customer first name
    cst_lastname        NVARCHAR(50),   -- Customer last name
    cst_marital_status  NVARCHAR(50),   -- Marital status (e.g., Single, Married)
    cst_gndr            NVARCHAR(50),   -- Gender
    cst_create_date     DATE            -- Record creation date in CRM
);
GO

-- Drop and create product information table from CRM source
IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;
GO

CREATE TABLE bronze.crm_prd_info (
    prd_id       INT,            -- Product ID
    prd_key      NVARCHAR(50),   -- Product key from CRM
    prd_nm       NVARCHAR(50),   -- Product name
    prd_cost     INT,            -- Product cost
    prd_line     NVARCHAR(50),   -- Product line/category
    prd_start_dt DATETIME,       -- Product availability start date
    prd_end_dt   DATETIME        -- Product end-of-life or end date
);
GO

-- Drop and create sales details table from CRM source
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
GO

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num  NVARCHAR(50),   -- Sales order number
    sls_prd_key  NVARCHAR(50),   -- Product key
    sls_cust_id  INT,            -- Customer ID
    sls_order_dt INT,            -- Order date (as int, likely YYYYMMDD)
    sls_ship_dt  INT,            -- Shipment date (as int)
    sls_due_dt   INT,            -- Due date for delivery (as int)
    sls_sales    INT,            -- Sales amount
    sls_quantity INT,            -- Quantity sold
    sls_price    INT             -- Unit price
);
GO

-- Drop and create location data from ERP system
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;
GO

CREATE TABLE bronze.erp_loc_a101 (
    cid    NVARCHAR(50),         -- Customer/location ID
    cntry  NVARCHAR(50)          -- Country
);
GO

-- Drop and create customer demographics from ERP system
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;
GO

CREATE TABLE bronze.erp_cust_az12 (
    cid    NVARCHAR(50),         -- Customer ID
    bdate  DATE,                 -- Birthdate
    gen    NVARCHAR(50)          -- Gender
);
GO

-- Drop and create product category mapping from ERP system
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
GO

CREATE TABLE bronze.erp_px_cat_g1v2 (
    id           NVARCHAR(50),   -- Product ID
    cat          NVARCHAR(50),   -- Product category
    subcat       NVARCHAR(50),   -- Product subcategory
    maintenance  NVARCHAR(50)    -- Maintenance category/type
);
GO
