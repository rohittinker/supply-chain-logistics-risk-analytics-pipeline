# Supply Chain & Logistics Data Pipeline: Data Validation & Quality Assurance

## 🚀 Project Overview
An end-to-end data pipeline (Python → PostgreSQL → Power BI) for supply chain and logistics data, with a strong focus on **data quality, validation, and verifying that the data loaded into the database is accurate and consistent** before it reaches the dashboard.

The goal: make sure the numbers leadership sees in the dashboard can be trusted, by cleaning, validating, and reconciling data at every stage of the pipeline.

## 🎯 Problem Statement & QA Context

A global manufacturing and logistics enterprise relies on transit, warehouse, and risk data to monitor shipments. Wrong or inconsistent data leads to wrong business decisions, so the pipeline must be reliable.

### Data Quality Risks Addressed
* **Raw data inconsistencies:** missing values, duplicates, and incorrect data types in the source datasets.
* **Referential integrity issues:** transit, warehouse, and risk tables are related, and reloading data can break foreign key relationships.
* **Stale or duplicate loads:** re-running the pipeline can create duplicate records if the old data is not cleared properly.
* **Reporting accuracy:** dashboard metrics must match what is actually stored in the database.

### Core Question
> *"How can we ensure the integrated transit, warehouse, and risk data is clean, consistent, and accurately loaded, so that the dashboard insights can be trusted?"*

## 🛠️ Tech Stack
* **Data Cleaning & Validation:** Python (Pandas)
* **Database:** PostgreSQL (Neon Cloud), SQLAlchemy, psycopg2
* **Reporting & Verification:** Power BI
* **Domain:** Supply Chain & Logistics

## 🔄 Pipeline Workflow & Validation Stages

| Stage | What happens | QA focus |
|-------|--------------|----------|
| 1. Data Cleaning | Raw supply chain data is cleaned and structured with Pandas | Handle missing values, duplicates, data type issues |
| 2. Safe Reload | Existing tables are cleared using `TRUNCATE ... CASCADE` | Avoid foreign key conflicts and duplicate records on re-runs |
| 3. Database Load | Clean data is loaded into PostgreSQL (Neon) | Confirm tables are loaded correctly and relationships hold |
| 4. Reporting | Power BI connects directly to the database | Dashboard numbers are driven from the validated database data |

## ✅ Data Validation Checks

Sample SQL queries to verify the load after running the pipeline (adjust column names to your schema):

```sql
-- 1. Row count check: confirm every table loaded data
SELECT 'transit' AS table_name, COUNT(*) AS total_rows FROM supply_chain_transit
UNION ALL
SELECT 'warehouse', COUNT(*) FROM supply_chain_warehouse
UNION ALL
SELECT 'risk', COUNT(*) FROM supply_chain_risk;

-- 2. Duplicate check: should return no rows
SELECT shipment_id, COUNT(*)
FROM supply_chain_transit
GROUP BY shipment_id
HAVING COUNT(*) > 1;

-- 3. Null check on important columns: should return 0
SELECT COUNT(*) FROM supply_chain_transit WHERE shipment_id IS NULL;
```

## ⚙️ How to Run Locally

### 1. Clone the Repository
```bash
git clone https://github.com/rohittinker/supply-chain-logistics-risk-analytics-pipeline.git
cd supply-chain-logistics-risk-analytics-pipeline
```

### 2. Install Required Libraries
```bash
pip install pandas sqlalchemy psycopg2-binary jupyter
```

### 3. Configure Database Connection
* Open the `supply_chain.ipynb` notebook in Jupyter.
* Find the cell where the SQLAlchemy engine is created.
* Add your Neon PostgreSQL connection string securely (do not commit credentials to GitHub).

### 4. Execute the Pipeline
Run the notebook cells from top to bottom. The script will:
* Clean and process the supply chain datasets using Pandas.
* Connect to your Neon PostgreSQL database.
* Clear existing tables using `TRUNCATE CASCADE` to avoid foreign key conflicts.
* Load the fresh data into the database.

### 5. Verify the Load
Run the validation queries from the **Data Validation Checks** section above to confirm row counts, duplicates, and null values.

### 6. Connect Power BI
* Open Power BI Desktop → **Get Data > PostgreSQL database**.
* Enter your Neon server details.
* Import `supply_chain_transit`, `supply_chain_warehouse`, `supply_chain_risk` and refresh the dashboard.

## 🏆 Findings from the Validated Data
* **Lead days are consistent:** average lead days are nearly identical across risk categories (about 5.1 to 5.3 days), so speed is not the main bottleneck.
* **High Risk shipments dominate:** they make up **74.67% (23,944 records)** of all shipments and account for most of the total shipping cost (**₹1,47,29,841.63** of the **14.73M** total), with average port congestion of **6.98**.
* **Recommendation:** focus on high-risk route optimization, port congestion mitigation, and cost control.

## 📊 Dashboard Preview
![Supply Chain Dashboard](https://github.com/rohittinker/supply-chain-logistics-risk-analytics-pipeline/blob/main/Supply-Chain-Dashboard.png)
