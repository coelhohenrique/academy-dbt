# 🧱 Modern Data Stack: dbt + Snowflake + Power BI

This project is a complete **end-to-end data stack implementation** using **dbt**, **Snowflake**, and **Power BI**. The goal was to design and build a modern analytics pipeline that transforms raw data into meaningful insights using a **star schema dimensional model**. This project was developed as part of a data challenge, with all data modeling, testing, and dashboarding done by me.

---

## 🚀 Project Overview

This project demonstrates a complete **end-to-end analytics pipeline** using modern data stack, built with **dbt**, **Snowflake**, and **Power BI**. It was developed to solve a business case challenge from Indicium Academy, by transforming raw data into actionable insights.

The repository was initially **forked from a base challenge repository**, which provided only **raw tables and seed data without any transformations**. From there, I independently designed and implemented the entire **dimensional data model** using a **star schema approach**, created robust **data quality tests** in dbt, and developed a **focused Power BI dashboard** to deliver clear, business-relevant insights.

This implementation showcases best practices in data modeling, transformation logic, testing, and visualization—all integrated into a clean and scalable architecture.

![image](https://github.com/user-attachments/assets/d56c34ed-fafe-4b4a-b8cc-a09729597f64)

---

## 🛠️ Tech Stack

| Tool         | Purpose                                          |
|--------------|--------------------------------------------------|
| **dbt**      | Transformations, testing, and documentation       |
| **Snowflake**| Cloud data warehouse for scalable storage & compute |
| **Power BI** | Interactive business dashboard for data analysis  |

---

## 📐 Key Developments

### ⭐ Dimensional Modeling

- Designed a **star schema** with **fact** and **dimension** tables to support analytical queries.
- Structured the model to answer a defined set of business questions efficiently.
- Emphasis was placed on **performance**, **clarity**, and **scalability**.

### ✅ Data Quality with dbt Tests

- Implemented **data validation tests** using dbt to ensure:
  - Not null constraints  
  - Uniqueness checks  
  - Referential integrity  
- Developed **custom tests** where applicable to validate business logic.

### 📊 Power BI Dashboard

- Built a **dynamic, user-friendly Power BI dashboard** to answer business questions from the challenge.
- Visualized KPIs and business metrics derived from the star schema.
- Ensured all visuals are **driven by curated dbt models** for traceability and consistency.

---

## ✅ Benefits of This Implementation

- **End-to-End Visibility**: Clear lineage from raw data to final dashboard.
- **Data Quality Assurance**: Built-in data testing for trusted insights.
- **Scalable & Maintainable**: Modular design using dbt enables easy future expansion.
- **Analytical Efficiency**: Star schema optimized for fast querying and reporting.
- **Seamless Integration**: Smooth interoperability between Snowflake, dbt, and Power BI.

---

## 📌 Notes

- This project began as a **fork** of the original challenge repository.
- The forked repo contained **only untransformed seed data** and raw tables.
- All **data modeling, testing, and dashboarding** in this repo was developed **from scratch** by me.
- The main focus of the challenge was on **data modeling and transformation**, rather than data visualization. As such, the Power BI dashboard includes only the **essential visuals necessary to answer the business questions** effectively.


---

## 📄 Documentation & Assets

All relevant documentation and assets related to this project are included within the repository:

- **dbt Models and Tests**: Located in the `/models` and `/tests` directories.
- **Data Seeds**: Available in the `/seeds` directory.
- **Power BI Dashboard**: Included in the main folder as a `.pbix` file.
- **Data Modelling Diagram**: Included in the main folder as a `.pdf` file.
- **Figma Dashboard Mockup**: Included in the main folder as a `.png` file.

Please refer to these files and folders for full visibility into the modeling, testing, and reporting components of this implementation.

