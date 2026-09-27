# Supply Chain & Logistics Risk Analytics Pipeline

## 🚀 Project Overview
An end-to-end data engineering and analytics pipeline built to solve critical supply chain bottlenecks, predict delivery disruption probabilities, and optimize freight logistics.

## 🛠️ Tech Stack & Architecture
* **Data Ingestion & Processing:** Python
* **Database & Cloud Storage:** PostgreSQL (Neon Cloud)
* **Visualization & BI:** Power BI
* **Domain:** Supply Chain & Logistics

## 🔄 Pipeline Workflow
1. **Extraction & Processing:** Used Python to clean, process, and structure raw supply chain logistics data.
2. **Cloud Database:** Loaded the relational data into a **PostgreSQL database hosted on Neon**.
3. **Business Intelligence:** Connected Power BI directly to the Neon PostgreSQL database to create dynamic dashboards tracking transit delays, shipping costs, and inventory risks.

## 📌 Key Business Pain Points Addressed
* **Unpredictable Transit Delays:** Monitoring weather and port congestion impacts on ETAs.
* **Escalating Shipping Costs:** Analyzing route efficiency and fuel/freight expenses.
* **Warehouse & Inventory Imbalances:** Tracking supplier reliability and lead times.

## ⚙️ How to Use / Run Locally
To run or review this project on your local machine, follow these steps:

### 1. Clone the Repository
Open your terminal or command prompt and run the following command to clone the project:
```bash
git clone [https://github.com/rohittinker/supply-chain-logistics-risk-analytics-pipeline.git](https://github.com/rohittinker/supply-chain-logistics-risk-analytics-pipeline.git)
cd supply-chain-logistics-risk-analytics-pipeline
```
### 2. Install Required Libraries
Ensure you have Python installed, then install the necessary data manipulation and database connection packages by running:
```bash 
pip install pandas sqlalchemy psycopg2-binary jupyter
```
### 3. Configure Database Connection
* Open the supply_chain.ipynb notebook in Jupyter.
* Locate the database connection cell where the SQLAlchemy engine is created.
* Replace or configure your Neon PostgreSQL connection string securely.

### 4. Execute the Pipeline
Run the Jupyter Notebook cells sequentially from top to bottom. The script will:
* Process and clean the static supply chain datasets using Pandas.
* Establish a connection with your Neon PostgreSQL database.
* Safely truncate existing tables using the TRUNCATE CASCADE method to avoid foreign key conflicts.
* Load the fresh data cleanly into the database.

### 5. Connect Power BI for Visualization
Open Power BI Desktop.
* Click on Get Data > PostgreSQL database.
* Enter your Neon database credentials and server details.
* Import your tables (supply_chain_transit, supply_chain_warehouse, supply_chain_risk) and build or refresh your analytics dashboard.

## 📊 Dashboard Preview
![Supply Chain Dashboard](https://github.com/rohittinker/supply-chain-logistics-risk-analytics-pipeline/blob/main/Supply-Chain-Dashboard.png)
