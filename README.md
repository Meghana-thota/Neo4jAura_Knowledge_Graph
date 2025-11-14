# Neo4jAura_Knowledge_Graph

---

# Data Import into Neo4j Aura

Neo4j Aura provides multiple options for importing data into a graph database, including flat files, cloud storage platforms, and external databases. In this project, data is imported using the **Import** tool inside Aura Console.

## 1. Importing Local CSV Files (Used in This Project)

Aura allows you to upload `.csv` files directly through:

**Console → Data Services → Import**

Steps:

1. Upload local CSV files (e.g., `customers.csv`, `orders.csv`, `products.csv`).
2. Define **Node Labels** (Customer, Order, Product, Category, Supplier).
3. Select the **Primary Key** for each node (e.g., `customerID`, `orderID`).
4. Map relationship files or shared identifiers to create edges in the graph.
5. Click **Run Import** to load data into the database.
   <img width="1710" height="902" alt="image" src="https://github.com/user-attachments/assets/726fd220-419c-4065-8928-da4ae18f4cbe" />


This method is ideal for smaller datasets and quick modeling.

---

## 2. Importing from Cloud Storage (AWS, GCP, Azure)

Neo4j Aura also supports importing data from cloud object storage:

* **AWS S3**
* **Google Cloud Storage (GCS)**
* **Azure Blob Storage / Data Lake**

Using the Import tool, you can connect a cloud bucket and pull CSV files directly into Aura.
This is recommended when working with larger files or automated workflows.

---

## 3. Importing from External Databases & Warehouses

Aura’s Import tool supports direct connections to structured data sources, including:

* PostgreSQL
* MySQL
* SQL Server
* Oracle
* BigQuery
* Databricks
* Snowflake

You can map tables to nodes and relationships in the same way as CSVs.
Aura automatically generates Cypher to load the graph structure.

---

## 4. How Import Works Behind the Scenes

Regardless of the data source, the Import tool:

* Reads your file/table structure
* Maps fields to **nodes**, **properties**, and **relationships**
* Generates Cypher equivalent to `LOAD CSV` or database connectors
* Creates all graph entities inside your Aura instance

This makes the process **code-free, visual, and beginner-friendly** while still generating a fully reusable model.

---
### Full Graph Overview (All Entities & Relationships)

This visualization presents the complete Northwind Knowledge Graph after importing all dataset tables into Neo4j Aura. The force-based layout highlights the natural clustering of customers, orders, products, categories, and suppliers, along with all associated relationships. It provides a clear, structural view of how transactional and categorical data interconnect within the graph.

To view this representation in Neo4j Aura, navigate to Tools → Explore, where you can explore all nodes and relationships interactively using the graph exploration interface.

<img width="1710" height="900" alt="image" src="https://github.com/user-attachments/assets/7cbc089f-c6f0-49a4-bdbf-af561eb2e4dd" />

