-- Switch to the 'master' database to perform server-level operations
USE master;
GO

-- Check if the 'DataWarehouse' database already exists
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'DataWarehouse')
BEGIN
    PRINT 'Database exists. Dropping...'
    
    -- Force the database into SINGLE_USER mode to safely drop it
    ALTER DATABASE [DataWarehouse] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    -- Drop the existing 'DataWarehouse' database
    DROP DATABASE [DataWarehouse];
    PRINT 'Database dropped.'
END
GO

-- Create a new database named 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

-- Switch context to the new 'DataWarehouse' database
USE DataWarehouse;
GO

-- Create the 'bronze' schema for raw data (landing zone)
CREATE SCHEMA bronze;
GO

-- Create the 'silver' schema for cleansed/transformed data
CREATE SCHEMA silver;
GO

-- Create the 'gold' schema for curated/aggregated data used for analytics or reporting
CREATE SCHEMA gold;
GO
