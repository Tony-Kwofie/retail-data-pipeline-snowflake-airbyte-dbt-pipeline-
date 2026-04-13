![Snowflake](https://img.shields.io/badge/Snowflake-Cloud%20Data%20Warehouse-blue?logo=snowflake)
![Airbyte](https://img.shields.io/badge/Airbyte-Data%20Ingestion-blue)
![dbt](https://img.shields.io/badge/dbt-Data%20Transformation-orange)
![Power BI](https://img.shields.io/badge/Power%20BI-Analytics-yellow?logo=powerbi)

---

# 🛒 AcmeMart Transaction Analytics ELT Pipeline

## 🚀 What This Project Demonstrates
- End-to-end ELT pipeline design  
- Cloud data warehousing with Snowflake  
- Data ingestion using Airbyte  
- Data transformation and testing with dbt  
- Medallion architecture (Bronze → Silver → Gold)  
- Data quality validation and monitoring  

---

## 🧠 Project Overview

This project implements a production-style **ELT data pipeline** for retail transaction data, transforming raw datasets into analytics-ready models.

Data is ingested from **Google Drive via Airbyte**, stored in **Snowflake**, and transformed using **dbt** following the **Medallion Architecture (Bronze → Silver → Gold)**.

---

## 🏗 Architecture

![Pipeline Architecture](IMG/pipeline_architecture.PNG)

---

## 🔄 Pipeline Walkthrough

### 1️⃣ Data Ingestion (Airbyte)

![Airbyte Sync](IMG/airbyte_data_sync.jpg)

- Automated ingestion from Google Drive  
- Incremental loading with deduplication  
- **11,268+ records successfully loaded**

---

### 2️⃣ Schema Configuration

![Airbyte Schema](IMG/airbyte_schema_config.jpg)

- Incremental + Append + Deduped mode  
- Primary key: `transaction_id`  

---

### 3️⃣ Data Validation

![Validation](IMG/data_validation_rowcount.jpg)

- Verified record count consistency (11,268 rows)  
- Confirms successful ingestion  

---

## 🟤 Bronze Layer (Raw Data)

- Raw ingested data stored in Snowflake  
- Table: `AIRBYTE_DATABASE.BRONZE.ACME`

---

## ⚪ Silver Layer (Staging)

![Silver Layer](IMG/silver_staging_view.jpg)

- Cleaned and standardized dataset  
- Data type casting and null handling  
- Model: `stg_acme` (view)  

---

## 🟡 Gold Layer (Analytics)

![Gold Layer](IMG/gold_fact_transactions.jpg)

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
