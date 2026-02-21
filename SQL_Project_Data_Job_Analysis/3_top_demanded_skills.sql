/*
Question: What are the most in-demand skills for Data Analysts in Egypt?

Objectives:
- Join job postings with the relevant skills table (similar to Query 2).
- Identify the top 5 skills most frequently requested for Data Analyst roles in Egypt.
- Consider all job postings within Egypt.

Why?
- To highlight the top 5 skills currently in demand for Data Analysts in Egypt, 
  providing guidance for job seekers on which skills are most valuable to develop locally.
*/


SELECT skills,
    COUNT(*) AS demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
        AND job_country = 'Egypt'
GROUP BY 
    skills
ORDER BY 
    demand_count DESC
LIMIT 5;



