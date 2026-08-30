# HR Analytics Dashboard

An HR analytics project focused on analyzing employee workforce, resignation, salary, overtime, and performance data using Excel, PostgreSQL, SQL, and Power BI.

## 📊 Project Overview

This project analyzes an employee dataset containing 100,000 records to understand workforce distribution, employee resignations, salary patterns, overtime categories, and performance.

The project follows a structured data analytics workflow:

**Raw Data → Excel Data Cleaning & Validation → PostgreSQL → SQL Analysis → Power BI & DAX → Interactive HR Dashboard**

The final dashboard provides an executive-level view of workforce and resignation metrics with interactive filters for deeper analysis.

---

## 🎯 Business Objective

The objective of this project is to analyze employee data and provide insights that can help understand:

- Overall workforce distribution
- Employee resignation patterns
- Resignation rates across departments
- Resignation rates by overtime category
- Resignation rates across salary bands
- Overall salary levels
- Employee performance
- Workforce segments using interactive filters

---

## 📁 Dataset

The project uses an employee dataset containing:

- **100,000 employee records**
- Employee demographics
- Department and job information
- Salary information
- Overtime information
- Performance information
- Resignation status
- Tenure-related information

The raw dataset is stored separately from the cleaned dataset to maintain a clear data workflow.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| Microsoft Excel | Data inspection, cleaning, validation and preparation |
| PostgreSQL | Database storage and structured querying |
| SQL | Data analysis and business queries |
| Power BI | Interactive dashboard and visualization |
| DAX | KPI and analytical measures |

---

## 🔄 Project Workflow

### 1. Raw Data

The original employee dataset was collected and stored separately as the raw source data.

### 2. Excel Data Preparation

The employee dataset was inspected and prepared in Excel.

Basic data-quality checks were performed to review:

- Employee IDs
- Missing values
- Field consistency
- Data structure
- Duplicate records
- Data types and formatting

The cleaned employee dataset was then prepared for further analysis.

### 3. PostgreSQL

The cleaned employee dataset was loaded into PostgreSQL.

PostgreSQL was used to store the prepared data and support structured SQL analysis.

### 4. SQL Analysis

SQL queries were used to analyze employee workforce and resignation patterns.

The analysis focused on:

- Employee counts
- Resigned employee counts
- Resignation rates
- Department-level resignation
- Overtime-related resignation
- Salary-band resignation
- Employee salary and performance metrics

### 5. Power BI

The prepared data was connected to Power BI to create an interactive HR analytics dashboard.

DAX measures were used to calculate the key performance indicators.

### 6. Dashboard

The final dashboard presents the analysis in an executive-friendly format with KPI cards, charts, and interactive filters.

---

## 📈 Key KPIs

| KPI | Value |
|---|---:|
| Total Employees | 100,000 |
| Resigned Employees | 10,010 |
| Resignation Rate | 10.01% |
| Average Salary | 6,403.21 |
| Average Performance | 3.00 |

---

## 📊 Dashboard Visualizations

The dashboard contains four main analytical visualizations:

### 1. Total Employees by Department

Shows workforce distribution across departments.

### 2. Resignation Rate by Department

Compares employee resignation rates across departments.

The highest observed department resignation rate in the dashboard is:

**Finance — 10.54%**

### 3. Resignation Rate by Overtime Category

Compares resignation rates across:

- High Overtime — 10.15%
- Moderate Overtime — 9.88%
- No Overtime — 9.65%

### 4. Resignation Rate by Salary Band

Compares resignation rates across:

- Low — 10.10%
- Medium — 9.99%
- High — 9.95%

---

## 🎛️ Interactive Filters

The Power BI dashboard includes interactive filters for:

- Department
- Job Title
- Gender
- Age Group
- Overtime Category
- Salary Band

These filters allow users to explore the workforce and resignation metrics from different employee segments.

---

## 🔍 Key Insights

The analysis identified several notable patterns:

- The overall resignation rate is **10.01%** across 100,000 employees.
- Finance has the highest displayed department resignation rate at **10.54%**.
- The High Overtime category has a resignation rate of **10.15%**, compared with **9.65%** for employees with No Overtime.
- The Low Salary Band has a resignation rate of **10.10%**, compared with **9.95%** for the High Salary Band.
- The relatively small differences between salary bands indicate that salary alone should not be treated as a definitive explanation for resignation.
- Overtime and department-level differences can be used to identify areas for further HR investigation.

---

## 💡 Business Recommendations

Based on the analysis, the following areas could be considered for further HR investigation:

- Review resignation patterns within departments with relatively higher resignation rates.
- Investigate workload and employee experience among high-overtime employees.
- Review compensation patterns alongside other employee factors.
- Analyze resignation patterns across different employee segments using the dashboard filters.
- Combine resignation analysis with additional HR factors for deeper employee-retention analysis.

---

## 📂 Repository Structure

```text
hr-analytics-dashboard/
│
├── data/
│   └── Raw and cleaned employee datasets
│
├── excel/
│   └── Excel analysis and working files
│
├── sql/
│   └── SQL analysis queries
│
├── powerbi/
│   └── Power BI dashboard files
│
├── documentation/
│   └── HR Analytics project documentation
│
└── README.md
