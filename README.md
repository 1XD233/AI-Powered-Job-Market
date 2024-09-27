# AI-Powered Job Market Insights

## Introduction
This project focuses on analyzing the AI-Powered Job Market, providing insights into the impact of artificial intelligence (AI) and automation on various job roles across different industries. The goal of this project is to understand the automation risk, required skills, and salary trends associated with AI-related jobs in the modern workforce. The analysis aims to highlight which roles are at higher risk of automation and the skill sets in demand, as well as to offer insights into the salary trends across these roles.

## Background
The "AI-Powered Job Market Insights" dataset provides a synthetic but realistic snapshot of the modern job market, with a particular focus on AI and automation's impact on various job roles. The dataset includes information on 500 unique job listings, categorized by factors such as industry, company size, AI adoption level, automation risk, required skills, and projected salary ranges.

The motivation for this analysis stems from the increasing role of AI in the workplace and the need to understand its implications. As AI technology evolves, certain jobs face higher automation risk, while others require advanced technical skills that AI cannot easily replicate. This project seeks to provide data-driven insights for policymakers, companies, and individuals seeking to navigate the future job market.

## Tools I Used
For this project, I utilized a combination of tools for data analysis, manipulation, and visualization:
- **SQL**: To extract and analyze key insights from the dataset.
- **Tableau**: To create an interactive dashboard that visualizes key metrics like automation risk, salary trends, and required skills for AI-related jobs.
- **Excel**: For data cleaning and organization, ensuring the dataset was prepared for analysis.

## The Analysis
The analysis of the AI-powered job market was driven by specific questions, which were answered using SQL queries. Below is a breakdown of the queries used to explore key aspects of the dataset.

### 1. Job Roles at the Highest Risk of Automation
   - **Question**: Which job roles are at the highest risk of automation, and what are the most common skills required for those roles?
   - **SQL Query**:
     ```sql
     SELECT "Job_Title",
       AVG(CASE
         WHEN "Automation_Risk" = 'Low' THEN 20
         WHEN "Automation_Risk" = 'Medium' THEN 50
         WHEN "Automation_Risk" = 'High' THEN 80
       END) AS Average_Automation_Risk
     FROM job_market
     GROUP BY "Job_Title"
     ORDER BY Average_Automation_Risk;
     ```

   - **Required Skills**:
     ```sql
     SELECT "Job_Title", "Required_Skills", COUNT(*) AS Skill_Frequency
     FROM job_market
     GROUP BY "Job_Title", "Required_Skills"
     ORDER BY "Job_Title", Skill_Frequency DESC;
     ```

### 2. AI Adoption and Automation Risk by Job Title
   - **Question**: Are job roles in companies with high AI adoption at a higher or lower risk of automation compared to those with lower AI adoption?
   - **SQL Query**:
     ```sql
     SELECT "Job_Title", "AI_Adoption_Level",
       AVG(CASE
         WHEN "Automation_Risk" = 'Low' THEN 20
         WHEN "Automation_Risk" = 'Medium' THEN 50
         WHEN "Automation_Risk" = 'High' THEN 80
       END) AS Average_Automation_Risk
     FROM job_market
     GROUP BY "AI_Adoption_Level", "Job_Title"
     ORDER BY "AI_Adoption_Level", Average_Automation_Risk DESC;
     ```

### 3. Salary Distribution Across AI Adoption Levels and Job Roles
   - **Question**: What is the salary distribution across different AI adoption levels and job roles?
   - **SQL Query**:
     ```sql
     SELECT
       "AI_Adoption_Level",
       "Job_Title",
       AVG("Salary_USD") AS Avg_Salary,
       MIN("Salary_USD") AS Min_Salary,
       PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY "Salary_USD") AS Q1,
       PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY "Salary_USD") AS Median_Salary,
       PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY "Salary_USD") AS Q3,
       MAX("Salary_USD") AS Max_Salary
     FROM job_market
     GROUP BY "AI_Adoption_Level", "Job_Title"
     ORDER BY "AI_Adoption_Level", "Job_Title";
     ```

### 4. Skills in High Demand for AI-Driven Roles
   - **Question**: What are the most in-demand skills for AI-driven roles?
   - **SQL Query**:
     ```sql
     SELECT "Job_Title", "Required_Skills", COUNT(*) AS Skill_Frequency
     FROM job_market
     GROUP BY "Job_Title", "Required_Skills"
     ORDER BY Skill_Frequency DESC;
     ```

### Tableau Dashboard
The SQL queries helped extract valuable insights, which were further visualized in the Tableau dashboard. Key aspects explored in the dashboard include:
- **Automation Risk**: Job titles with higher automation risk, such as **Operations Manager**, and the skills required to navigate this risk.
- **Salary Trends**: Visualization of salary distribution across different AI adoption levels, highlighting the wage premium associated with higher AI adoption.
- **Skills**: Identification of the most common and in-demand skills required for AI-related job roles, helping both job seekers and employers understand the competencies needed in the current job market.

The Tableau dashboard offers an interactive way to explore these insights and trends, helping visualize the impact of AI and automation on the workforce.
