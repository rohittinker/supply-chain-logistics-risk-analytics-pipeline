# Supply Chain & Logistics Risk Analytics Pipeline

## 🚀 Project Overview
An end-to-end data engineering and analytics pipeline built to solve critical supply chain bottlenecks, predict delivery disruption probabilities, and optimize freight logistics.

## 🎯 Problem Statement & Business Context

### 1. Context & Background
A global manufacturing and logistics enterprise is facing severe operational bottlenecks across its supply chain network. Management is struggling with unpredictable transit delays, fluctuating inventory levels in warehouses, and rising freight costs. With multiple variables impacting shipments—such as weather severity, port congestion, equipment availability, and route risks—leadership lacks a centralized, data-driven mechanism to monitor and mitigate these disruptions in real-time.

### 2. Key Business Pain Points
* **Unpredictable Transit Delays:** Shipments frequently miss ETAs due to unmonitored weather conditions, port congestion, and high traffic levels, leading to poor customer satisfaction.
* **Escalating Shipping Costs:** Inefficient route selection and sudden risk factors are driving up fuel rates and overall freight expenses.
* **Warehouse & Inventory Imbalances:** Poor visibility into lead days, supplier reliability, and historical demand creates stockouts or excess holding costs.
* **Reactive Risk Management:** The logistics team identifies disruptions *after* they occur rather than predicting them using historical and real-time operational data.

### 3. Overarching Business Question
> *"How can the company leverage integrated transit, warehouse, and risk data to identify operational bottlenecks, predict delivery disruption probabilities, and optimize logistics strategies to minimize shipping costs and improve fulfillment reliability?"*

## 🛠️ Tech Stack & Architecture
* **Data Ingestion & Processing:** Python
* **Database & Cloud Storage:** PostgreSQL (Neon Cloud)
* **Visualization & BI:** Power BI
* **Domain:** Supply Chain & Logistics

## 🔄 Pipeline Workflow
1. **Extraction & Processing:** Used Python to clean, process, and structure raw supply chain logistics data.
2. **Cloud Database:** Loaded the relational data into a **PostgreSQL database hosted on Neon**.
3. **Business Intelligence:** Connected Power BI directly to the Neon PostgreSQL database to create dynamic dashboards tracking transit delays, shipping costs, and inventory risks.

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

## 🏆 Conclusion & Business Impact (Dashboard Insights)
* **Lead Days Consistency:** Dashboard analysis indicates that average lead days remain nearly identical across all risk categories (approximately 5.1 to 5.3 days), proving that operational speed itself is not the primary bottleneck.
* **High-Risk Dominance:** The core issue is the massive volume of **High Risk shipments**, which account for **74.67% (23,944 records)** of total shipments and consume the vast majority of total shipping costs (**₹1,47,29,841.63** out of **14.73M** total cost) alongside an average port congestion of **6.98**.
* **Strategic Recommendation:** Management should shift focus from operational speed to High-Risk route optimization, port congestion mitigation, and rigorous cost control.

## 📊 Dashboard Preview
![Supply Chain Dashboard](https://github.com/rohittinker/supply-chain-logistics-risk-analytics-pipeline/blob/main/Supply-Chain-Dashboard.png)
