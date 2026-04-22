# Personal Finance Spending Analysis Dashboard

## Objective
Build a simple, data-driven dashboard to better understand my own spending habits, identify where most of my money goes, and track how my financial behaviour changes over time.

---

## Project Overview
- Analysed personal bank transaction data to understand spending patterns  
- Built a **refreshable workflow (Excel → MySQL → Power BI)**  
- Created an interactive dashboard to track categories, trends, and key metrics  

---

## Dashboard Preview
![Dashboard Preview](personal_finance.jpeg)

---

## Key Insights

- Total spending across the period was **$15,720**, with **Buy Now Pay Later (BNPL)** contributing **$5,081 (32.3%)**, making it my largest expense.
- Spending is quite concentrated, with the **top 5 categories** (BNPL, Convenience, Fast Food, Travel, Transport) making up **around 70%** of total spending.
- A large portion of BNPL spending is tied to **AfterPay**, which alone accounts for **$5,081 (32.3%)**.
- Spending peaked in **January 2026 ($4,444)** and dropped to **$721 in March 2026**, showing a sharp **83.8% decrease**.
- There was a rapid increase in late 2025, from **$468 in September to $3,896 in December (8.3× increase)**.
- BNPL usage was highest in late 2025 (**62.1% of monthly spending**) and reduced significantly by early 2026 (**21.6% in January**).
- Spending behaviour shifted in 2026:
  - **February** was driven by **Government Fees (21.8%)**
  - **March** was more focused on essentials, especially **Fuel (23.5%)**
- Core categories like **Transport, Food, and Travel** remained consistent across months.

---

## What I took from this
- A large portion of my spending is driven by BNPL, which can quickly add up if not monitored.  
- Most of my expenses come from a small number of categories, so focusing on these would have the biggest impact.  
- Spending spikes tend to happen in short periods, so tracking monthly trends is important to stay in control.  

---

## Tools Used
- MySQL  
- SQL (Views & Aggregations)  
- Power BI  
- Excel / CSV  

---

## Workflow
1. Exported transaction data as CSV.  
2. Cleaned and structured the data in Excel (including creating a category mapping for transactions).
3. Loaded the data into MySQL.
4. Created SQL views for:
   - Category-wise spending  
   - Monthly trends  
   - Merchant-level analysis  
   - Category share by month  
   - Year-based filtering  
5. Connected Power BI to the SQL outputs.  
6. Built an interactive dashboard with filters and visuals.  

---

## SQL Views
SQL views were used to organise and aggregate the data before visualisation.  
A `year` column was added to support consistent filtering across all dashboard views.
