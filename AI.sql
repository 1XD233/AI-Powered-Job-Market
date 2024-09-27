-- Question 1: Which job roles are at the highest risk of automation, and what are the most common skills required for those roles?

SELECT "Job_Title",
AVG(CASE
    WHEN "Automation_Risk" = 'Low' THEN 20
    WHEN "Automation_Risk" = 'Medium' THEN 50
    WHEN "Automation_Risk" = 'High' THEN 80
END) AS Average_Automation_Risk
FROM job_market
GROUP BY "Job_Title"
ORDER BY Average_Automation_Risk;

SELECT "Job_Title", "Required_Skills", COUNT(*) AS Skill_Frequency
FROM job_market
GROUP BY "Job_Title", "Required_Skills"
ORDER BY "Job_Title", Skill_Frequency DESC;

-- Question 2: Are job roles in companies with high AI adoption at a higher or lower risk of automation compared to those with lower AI adoption?

SELECT "Job_Title", "AI_Adoption_Level",
AVG(CASE
    WHEN "Automation_Risk" = 'Low' THEN 20
    WHEN "Automation_Risk" = 'Medium' THEN 50
    WHEN "Automation_Risk" = 'High' THEN 80
END) AS Average_Automation_Risk
FROM job_market
GROUP BY "AI_Adoption_Level", "Job_Title"
ORDER BY "AI_Adoption_Level", Average_Automation_Risk DESC;

-- Question 3: What is the Salary Distribution Across Different AI Adoption Levels and Job Roles?

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
ORDER BY "AI_Adoption_Level";
