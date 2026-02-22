/*
Question: What are the most optimal skills to learn for Data Analysts 
(high demand and high paying)?

Objectives:
- Identify skills that are both in high demand and associated with high average salaries 
  for Data Analyst roles.
- Focus on remote positions with specified salaries.

Why?
- To highlight skills that provide both strong job opportunities (high demand) and 
  strong financial returns (high salaries), offering strategic guidance for career 
  development in data analytics.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary,
    COUNT(sj.job_id) AS demand_count
FROM 
    job_postings_fact AS jp
INNER JOIN skills_job_dim AS sj
    ON jp.job_id = sj.job_id
INNER JOIN skills_dim AS s
    ON sj.skill_id = s.skill_id
WHERE
    job_title_short = 'Data Analyst'
      AND salary_year_avg IS NOT NULL
      AND job_work_from_home = True 
GROUP BY
    skills
HAVING
    COUNT(sj.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 15;