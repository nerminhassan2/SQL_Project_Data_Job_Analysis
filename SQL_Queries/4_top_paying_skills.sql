/*
Question: What are the top skills for Data Analysts based on salary?

Objectives:
- Analyze the average salary associated with each skill for Data Analyst positions.
- Focus only on roles with specified salaries, regardless of location.

Why?
- To reveal how different skills impact salary levels for Data Analysts, 
  helping job seekers identify the most financially rewarding skills to acquire or improve.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact AS jp
INNER JOIN skills_job_dim AS sj
    ON jp.job_id = sj.job_id
INNER JOIN skills_dim AS s
    ON sj.skill_id = s.skill_id
WHERE
    job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE 
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 15;


