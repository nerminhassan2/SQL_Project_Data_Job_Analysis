/*
Question: What are the top-paying remote Data Analyst jobs?

Objectives:
- Identify the top 10 highest-paying remote Data Analyst roles.
- Focus only on job postings with specified salaries (exclude null values).
- BONUS: Include company names for the top 10 roles.

Why?
- To highlight the best-paying opportunities for Data Analysts and provide insights into remote work options.
*/

SELECT 	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg AS salary,
	job_posted_date,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim 
    ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
ORDER BY 
    salary DESC
LIMIT 10;