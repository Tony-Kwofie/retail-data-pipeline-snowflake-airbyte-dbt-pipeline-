![Snowflake](https://img.shields.io/badge/Snowflake-Cloud%20Data%20Warehouse-blue?logo=snowflake)
![Airbyte](https://img.shields.io/badge/Airbyte-Data%20Ingestion-blue)
![dbt](https://img.shields.io/badge/dbt-Data%20Transformation-orange)
![Power BI](https://img.shields.io/badge/Power%20BI-Analytics-yellow?logo=powerbi)

---

# 🛒 AcmeMart Transaction Analytics ELT Pipeline

## 🧠 Project Overview

This project implements a production-style **ELT data pipeline** for retail transaction data, transforming raw datasets into analytics-ready models.

Data is ingested from **Google Drive via Airbyte**, stored in **Snowflake**, and transformed using **dbt** following the **Medallion Architecture (Bronze → Silver → Gold)**.

---

## 🏗 Architecture

![Pipeline Architecture](IMG/pipeline_architecture.png)

---

## 🔄 Data Ingestion (Airbyte)

### ✅ Data Sync Status
![Airbyte Sync](IMG/airbyte_data_sync.png)

- Automated ingestion from Google Drive  
- Incremental loading with deduplication  
- 11,268 records successfully loaded  

---

### ⚙️ Schema Configuration
![Airbyte Schema](IMG/airbyte_schema_config.png)

- Incremental + Append + Deduped mode  
- Primary key: `transaction_id`  

---

## 🟤 Bronze Layer (Raw Data)

- Raw ingested data stored in Snowflake  
- Table: `AIRBYTE_DATABASE.BRONZE.ACME`

---

## ⚪ Silver Layer (Staging)

![Silver Layer](IMG/silver_staging_view.png)

- Cleaned and standardized dataset  
- Data type casting and null handling  
- Model: `stg_acme` (view)  

---

## 🟡 Gold Layer (Marts)

![Gold Layer](IMG/gold_fact_transactions.png)

### 📊 Fact Table: `fct_transactions`

- transaction_id  
- customer_id  
- product_id  
- store_id  
- quantity  
- unit_price  
- total_amount  
- transaction_timestamp  

---

### 📦 Dimension Tables

**dim_product**
- product_id  
- product_name  
- category  

**dim_store**
- store_id  

---

## 🔗 Data Lineage

```text
stg_acme
   ↓
fct_transactions
   ↓
dim_product   dim_store

✅ Data Quality

Data integrity is enforced using dbt tests:

Primary key validation (unique, not null)
Referential integrity between fact and dimension tables
✔ Test Results
6 tests passed
0 failures
📊 Data Validation

Verified record count consistency (11,268 rows)
Confirms successful ingestion and transformation
🚀 How to Run
dbt run
dbt test
dbt docs generate
dbt docs serve
🛠 Tech Stack
Snowflake (Cloud Data Warehouse)
Airbyte (Data Ingestion)
dbt (Data Transformation)
SQL
Power BI (Analytics)
📊 Business Impact
Eliminates manual data consolidation workflows
Centralizes transactional data into a single source of truth
Improves data consistency and reliability
Enables scalable and efficient analytics
🎯 Skills Demonstrated
ELT Pipeline Design
Medallion Architecture (Bronze → Silver → Gold)
Dimensional Modeling (Star Schema)
Snowflake Data Warehousing
dbt Transformations & Testing
Data Quality Assurance
🔐 Notes

Sensitive information (credentials, account IDs, and configurations) has been removed or anonymized.

👤 Author

Anthony Eddei Kwofie
Data Engineer

🔗 GitHub: https://github.com/Tony-Kwofie
