CREATE TABLE employee_data (
    employee_id INTEGER,
    department VARCHAR(50),
    gender VARCHAR(20),
    age INTEGER,
    job_title VARCHAR(50),
    hire_date DATE,
    years_at_company INTEGER,
    education_level VARCHAR(50),
    performance_score INTEGER,
    monthly_salary NUMERIC(10,2),
    work_hours_per_week INTEGER,
    projects_handled INTEGER,
    overtime_hours INTEGER,
    sick_days INTEGER,
    remote_work_frequency INTEGER,
    team_size INTEGER,
    training_hours INTEGER,
    promotions INTEGER,
    employee_satisfaction_score NUMERIC(3,2),
    resigned BOOLEAN,
    age_group VARCHAR(20),
    tenure_group VARCHAR(20),
    salary_band VARCHAR(20),
    overtime_category VARCHAR(30),
    performance_category VARCHAR(20),
    resigned_flag INTEGER
);

SELECT COUNT(*)
FROM employee_data;

SELECT *
FROM employee_data
LIMIT 10;

SELECT employee_id, COUNT(*) AS employee_count
FROM employee_data
GROUP BY employee_id
HAVING COUNT(*) > 1;

SELECT
    COUNT(*) FILTER (WHERE employee_id IS NULL) AS missing_employee_id,
    COUNT(*) FILTER (WHERE department IS NULL) AS missing_department,
    COUNT(*) FILTER (WHERE age IS NULL) AS missing_age,
    COUNT(*) FILTER (WHERE job_title IS NULL) AS missing_job_title,
    COUNT(*) FILTER (WHERE monthly_salary IS NULL) AS missing_salary,
    COUNT(*) FILTER (WHERE performance_score IS NULL) AS missing_performance,
    COUNT(*) FILTER (WHERE employee_satisfaction_score IS NULL) AS missing_satisfaction,
    COUNT(*) FILTER (WHERE resigned IS NULL) AS missing_resigned
FROM employee_data;

-- =====================================================
-- 02. OVERALL HR KPIs
-- =====================================================
SELECT
    COUNT(*) AS total_employees,
    COUNT(DISTINCT employee_id) AS unique_employees,
    ROUND(AVG(age), 2) AS average_age,
    ROUND(AVG(monthly_salary), 2) AS average_monthly_salary,
    ROUND(AVG(years_at_company), 2) AS average_years_at_company,
    ROUND(AVG(performance_score), 2) AS average_performance_score,
    ROUND(AVG(employee_satisfaction_score), 2) AS average_satisfaction_score
FROM employee_data;

-- =====================================================
-- 03. WORKFORCE ANALYSIS
-- 03.1 Employees by Department
-- =====================================================

SELECT
    department,
    COUNT(*) AS employee_count
FROM employee_data
GROUP BY department
ORDER BY employee_count DESC;

-- =====================================================
-- 03.2 Employees by Job Title
-- =====================================================

SELECT
    job_title,
    COUNT(*) AS employee_count
FROM employee_data
GROUP BY job_title
ORDER BY employee_count DESC;

-- =====================================================
-- 04. RETENTION ANALYSIS
-- 04.1 Overall Resignation Rate
-- =====================================================

SELECT
    COUNT(*) AS total_employees,
    SUM(resigned_flag) AS resigned_employees,
    ROUND(AVG(resigned_flag) * 100, 2) AS resignation_rate
FROM employee_data;

-- =====================================================
-- 04.2 Resignation Rate by Tenure Group
-- =====================================================

SELECT
    tenure_group,
    COUNT(*) AS total_employees,
    SUM(resigned_flag) AS resigned_employees,
    ROUND(AVG(resigned_flag) * 100, 2) AS resignation_rate
FROM employee_data
GROUP BY tenure_group
ORDER BY resignation_rate DESC;

-- =====================================================
-- 04.3 Resignation Rate by Overtime Category
-- =====================================================

SELECT
    overtime_category,
    COUNT(*) AS total_employees,
    SUM(resigned_flag) AS resigned_employees,
    ROUND(AVG(resigned_flag) * 100, 2) AS resignation_rate
FROM employee_data
GROUP BY overtime_category
ORDER BY resignation_rate DESC;

-- =====================================================
-- 04.4 Resignation Rate by Satisfaction Band
-- =====================================================

SELECT
    CASE
        WHEN employee_satisfaction_score < 2 THEN 'Low'
        WHEN employee_satisfaction_score < 3 THEN 'Moderate'
        WHEN employee_satisfaction_score < 4 THEN 'High'
        ELSE 'Very High'
    END AS satisfaction_band,
    
    COUNT(*) AS total_employees,
    SUM(resigned_flag) AS resigned_employees,
    ROUND(AVG(resigned_flag) * 100, 2) AS resignation_rate

FROM employee_data

GROUP BY
    CASE
        WHEN employee_satisfaction_score < 2 THEN 'Low'
        WHEN employee_satisfaction_score < 3 THEN 'Moderate'
        WHEN employee_satisfaction_score < 4 THEN 'High'
        ELSE 'Very High'
    END

ORDER BY resignation_rate DESC;

-- =====================================================
-- 04.5 Resignation Rate by Salary Band
-- =====================================================

SELECT
    salary_band,
    COUNT(*) AS total_employees,
    SUM(resigned_flag) AS resigned_employees,
    ROUND(AVG(resigned_flag) * 100, 2) AS resignation_rate
FROM employee_data
GROUP BY salary_band
ORDER BY resignation_rate DESC;

-- =====================================================
-- 04.6 Resignation Rate by Performance Category
-- =====================================================

SELECT
    performance_category,
    COUNT(*) AS total_employees,
    SUM(resigned_flag) AS resigned_employees,
    ROUND(AVG(resigned_flag) * 100, 2) AS resignation_rate
FROM employee_data
GROUP BY performance_category
ORDER BY resignation_rate DESC;

-- =====================================================
-- 04.7 Resignation Rate by Overtime and Satisfaction
-- =====================================================

SELECT
    overtime_category,
    
    CASE
        WHEN employee_satisfaction_score < 2 THEN 'Low'
        WHEN employee_satisfaction_score < 3 THEN 'Moderate'
        WHEN employee_satisfaction_score < 4 THEN 'High'
        ELSE 'Very High'
    END AS satisfaction_band,
    
    COUNT(*) AS total_employees,
    SUM(resigned_flag) AS resigned_employees,
    ROUND(AVG(resigned_flag) * 100, 2) AS resignation_rate

FROM employee_data

GROUP BY
    overtime_category,
    CASE
        WHEN employee_satisfaction_score < 2 THEN 'Low'
        WHEN employee_satisfaction_score < 3 THEN 'Moderate'
        WHEN employee_satisfaction_score < 4 THEN 'High'
        ELSE 'Very High'
    END

ORDER BY resignation_rate DESC;

-- =====================================================
-- 04.8 Highest-Risk Overtime + Satisfaction Group
-- =====================================================

SELECT
    overtime_category,

    CASE
        WHEN employee_satisfaction_score < 2 THEN 'Low'
        WHEN employee_satisfaction_score < 3 THEN 'Moderate'
        WHEN employee_satisfaction_score < 4 THEN 'High'
        ELSE 'Very High'
    END AS satisfaction_band,

    COUNT(*) AS total_employees,
    SUM(resigned_flag) AS resigned_employees,
    ROUND(AVG(resigned_flag) * 100, 2) AS resignation_rate

FROM employee_data

GROUP BY
    overtime_category,
    CASE
        WHEN employee_satisfaction_score < 2 THEN 'Low'
        WHEN employee_satisfaction_score < 3 THEN 'Moderate'
        WHEN employee_satisfaction_score < 4 THEN 'High'
        ELSE 'Very High'
    END

ORDER BY resignation_rate DESC
LIMIT 1;

-- =====================================================
-- 04.9 Resignation Rate by Salary Band and Overtime
-- =====================================================

SELECT
    salary_band,
    overtime_category,
    COUNT(*) AS total_employees,
    SUM(resigned_flag) AS resigned_employees,
    ROUND(AVG(resigned_flag) * 100, 2) AS resignation_rate
FROM employee_data
GROUP BY
    salary_band,
    overtime_category
ORDER BY
    resignation_rate DESC;

-- =====================================================
-- 04.10 Resignation Rate by Department and Overtime
-- =====================================================

SELECT
    department,
    overtime_category,
    COUNT(*) AS total_employees,
    SUM(resigned_flag) AS resigned_employees,
    ROUND(AVG(resigned_flag) * 100, 2) AS resignation_rate
FROM employee_data
GROUP BY
    department,
    overtime_category
ORDER BY
    resignation_rate DESC;


-- =====================================================
-- 04.11 High-Risk Department + Overtime Groups
-- =====================================================

SELECT
    department,
    overtime_category,
    COUNT(*) AS total_employees,
    SUM(resigned_flag) AS resigned_employees,
    ROUND(AVG(resigned_flag) * 100, 2) AS resignation_rate
FROM employee_data
GROUP BY
    department,
    overtime_category
HAVING COUNT(*) >= 1000
ORDER BY resignation_rate DESC;


-- =====================================================
-- 04.12 Resignation Rate by Department
-- =====================================================

SELECT
    department,
    COUNT(*) AS total_employees,
    SUM(resigned_flag) AS resigned_employees,
    ROUND(AVG(resigned_flag) * 100, 2) AS resignation_rate
FROM employee_data
GROUP BY department
ORDER BY resignation_rate DESC;