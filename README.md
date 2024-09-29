# AI-Powered Job Market Insights

## Introduction
This project focuses on analyzing the AI-Powered Job Market, providing insights into the impact of artificial intelligence (AI) and automation on various job roles across different industries. The goal of this project is to understand the automation risk, required skills, and salary trends associated with AI-related jobs in the modern workforce. The analysis aims to highlight which roles are at higher risk of automation and the skill sets in demand, as well as to offer insights into the salary trends across these roles.

## Background
The "AI-Powered Job Market Insights" dataset provides a synthetic but realistic snapshot of the modern job market, with a particular focus on AI and automation's impact on various job roles. The dataset includes information on 500 unique job listings, categorized by factors such as industry, company size, AI adoption level, automation risk, required skills, and projected salary ranges.

The motivation for this analysis stems from the increasing role of AI in the workplace and the need to understand its implications. As AI technology evolves, certain jobs face higher automation risk, while others require advanced technical skills that AI cannot easily replicate. This project seeks to provide data-driven insights for policymakers, companies, and individuals seeking to navigate the future job market.

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

### Insights

The analysis of the AI-powered job market yielded several insights based on the visualizations, particularly in the areas of automation risk, salary trends, and required skills for various job roles. Below are the key conclusions:
![AI Job Market Dashboard](https://github.com/1XD233/AI-Powered-Job-Market/blob/604d6ee25b28ce28ea35c9845930ab2c0d804c75/Dashboard%20Screenshot%20(2).png)

### 1. Automation Risk by Job Title
   - The **bar chart** on the top left shows that job roles such as **Marketing Specialist** has the highest average automation risk. In contrast, more managerial roles such as **Operations Manager** show lower automation risk.
   - **Conclusion**: Jobs that require advanced technical skills are less vulnerable to automation, while roles involving routine or managerial tasks are at a higher risk of being automated.

### 2. Salary Distribution by AI Adoption Level
   - The **box plot** on the top right highlights that jobs with a higher AI adoption level, such as **AI Researcher**, **Cybersecurity Analyst**, and **Data Scientist**, tend to have higher salary ranges. Conversely, roles with lower AI adoption levels see more modest salary ranges.
   - **Conclusion**: Higher AI adoption correlates with higher compensation. Positions that involve the use of advanced AI technologies are more lucrative due to the specialized skills required.

### 3. AI Adoption Level by Job Title
   - The **stacked bar chart** on the right demonstrates the AI adoption levels across various job titles. Roles like **AI Researcher** and **Cybersecurity Analyst** have higher percentages of high AI adoption, while roles such as **Operations Manager** and **HR Manager** show lower AI adoption levels.
   - **Conclusion**: Technical roles are more aligned with AI adoption compared to non-technical managerial roles. This suggests that AI is more deeply integrated into tech-driven roles, reinforcing the importance of AI proficiency for tech professionals.

### 4. Required Skills by Job Title
   - The **clustered bar chart** on the bottom left provides insights into the frequency of required skills for various job titles. For example, **Data Analysis**, **Cybersecurity**, and **Machine Learning** are frequently required for technical roles, whereas soft skills like **Communication** and **Project Management** are more common in non-technical roles.
   - **Conclusion**: The most in-demand skills for AI-related jobs are technical, especially for roles like **Data Scientist** and **AI Researcher**. Non-technical roles such as **HR Manager** and **Sales Manager** place a greater emphasis on communication and management skills.

### 5. Average Salary by Job Title and AI Adoption Level
   - The **heatmap** on the bottom right shows the average salaries for different job titles at varying AI adoption levels. **AI Researchers** and **Cybersecurity Analysts** with high AI adoption earn the highest salaries, while **HR Managers** and other non-technical roles with lower AI adoption levels earn less.
   - **Conclusion**: There is a strong link between AI adoption and salary. Positions that require a high degree of AI adoption, particularly in technical roles, command the highest salaries, while roles with minimal AI adoption offer lower pay.

### Final Thoughts
The findings from this analysis clearly indicate that the future job market is heavily influenced by AI adoption. Roles with higher levels of AI integration, particularly technical positions like **AI Researcher** and **Cybersecurity Analyst**, are more secure from automation and offer higher salaries. On the other hand, jobs that lack AI integration, especially those in non-technical fields, face higher automation risks and lower compensation.

For professionals looking to remain competitive in the job market, gaining proficiency in AI-related skills such as **Data Analysis**, **Cybersecurity**, and **Machine Learning** is crucial. The insights from this analysis provide a roadmap for both job seekers and employers in navigating the rapidly evolving AI landscape.
