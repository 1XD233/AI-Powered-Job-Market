# AI-Powered Job Market Insights

## Introduction
This project focuses on analyzing the AI-Powered Job Market, providing insights into the impact of artificial intelligence (AI) and automation on various job roles across different industries. The goal of this project is to understand the automation risk, required skills, and salary trends associated with AI-related jobs in the modern workforce. The analysis aims to highlight which roles are at higher risk of automation and the skill sets in demand, as well as to offer insights into the salary trends across these roles.

## Background
The "AI-Powered Job Market Insights" dataset provides a synthetic but realistic snapshot of the modern job market, with a particular focus on AI and automation's impact on various job roles. The dataset includes information on 500 unique job listings, categorized by factors such as industry, company size, AI adoption level, automation risk, required skills, and projected salary ranges.

The motivation for this analysis stems from the increasing role of AI in the workplace and the need to understand its implications. As AI technology evolves, certain jobs face higher automation risk, while others require advanced technical skills that AI cannot easily replicate. This project seeks to provide data-driven insights for individuals seeking to navigate the future job market.

### Key Terms
AI_Adoption_Level: The extent to which the company has adopted AI in its operations.

Automation_Risk: The estimated risk that the job could be automated within the next 10 years.

Job_Growth_Projection: The projected growth or decline of the job role over the next five years.

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

## Conclusion

The analysis of the AI-powered job market yielded several insights based on the visualizations, particularly in the areas of automation risk, salary trends, and required skills for various job roles. Below are my description of each chart in the Tableau Dashboard:
![AI Job Market Dashboard](https://github.com/1XD233/AI-Powered-Job-Market/blob/604d6ee25b28ce28ea35c9845930ab2c0d804c75/Dashboard%20Screenshot%20(2).png)

### 1. Automation Risk by Job Title
   - The **bar chart** on the top left shows the automation risk across various job titles.

### 2. Salary Distribution by AI Adoption Level
   - The **box-and-whisker plot** on the top right compares salaries for different roles across different AI adoption levels (High, Medium, Low).

### 3. AI Adoption Level by Job Title
   - The **stacked bar chart** on the right demonstrates the AI adoption levels across various job titles. 

### 4. Required Skills by Job Title
   - The **clustered bar chart** on the bottom left provides insights into the frequency of required skills for various job titles.

### 5. Average Salary by Job Title and AI Adoption Level
   - The **heatmap** on the bottom right shows the average salaries for different job titles at varying AI adoption levels. 

## Insights

### For Job Seekers

1. **Understanding Automation Risk**:
   - Fields such as **Data Scientist** and **Operations Manager** have a relatively lower risk of automation, making them promising fields for a stable, long-term career.
   - Roles like **Marketing Specialist** and **UX Designer** have higher automation risks. Consider upskilling or transitioning to safer roles in other domains.

2. **Salary Trends**:
   - Job seekers can expect their average salaries ranging from **$76K to over $100K** for these 10 roles.
   - Depending on their selected job position, the average salary may increase or decrease based on its company's AI adoption level.

3. **Required Skills for AI-Powered Roles**:
   - Technical roles such as **Data Scientist** and **Cybersecurity Analyst** require proficiency **Cybersecurity**.

### For Current Professionals

1. **Staying Competitive**:
   - If you're already in a technical role (e.g., **Data Scientist**, **AI Researcher**), maintaining and expanding your skill set is crucial for staying relevant. Staying up-to-date with the latest tools (e.g., **Machine Learning**) will ensure continued job security.

2. **Comparing Compensation**:
   - Use this dashboard to benchmark your salary. For example, the average salary for a **Cybersecurity Analyst** is **$90K**. If you're making below this benchmark, it may be time to negotiate a raise, especially in companies with high AI adoption.

3. **Upskilling and Transitioning**:
   - For those looking to transition into more technical AI-powered roles, focus on building skills like **Data Analysis**, **Python**, and **Machine Learning**.
   - If you're currently in creative or managerial roles, learning these hard technical skills can open up opportunities for higher pay and better job security.
