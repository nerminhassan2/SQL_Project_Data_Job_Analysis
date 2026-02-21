/*
Question: What skills are required for the top-paying remote Data Analyst jobs?

Objectives:
- Use the top 10 highest-paying remote Data Analyst roles identified in the first query.
- Extract and analyze the specific skills required for these positions.

Why?
- To provide insight into the skills most in demand for high-paying Data Analyst roles, 
  helping job seekers focus on developing skills that align with top salaries.
*/

WITH top_paying_jobs AS (
    SELECT job_id,
        job_title,
        salary_year_avg AS salary,
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
    LIMIT 10
)

SELECT top_paying_jobs.*, 
    skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim
    ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary DESC;

    

