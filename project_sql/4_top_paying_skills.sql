/*
Answer: What are the top skills based on salary ?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels  for Data Analysts and 
  helps identify the most financially rewarding skills to acquire or improve
*/


select 
    skills,  
    ROUND (AVG(salary_year_avg),0) AS avg_salary
from job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id  = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id 
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
    AND job_work_from_home = True
group by 
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
Here are some quick insights and trends from Top 25 highest-paying skills for data analysts:

1️⃣ Big data & distributed computing lead the list

PySpark ($208k) and Databricks ($141k) are among the top, showing that analysts with expertise in big data frameworks earn significantly more.
Demand is high because companies are processing massive datasets beyond what standard SQL/Pandas can handle.

2️⃣ DevOps & version control are lucrative

Bitbucket ($189k) and GitLab ($154k) are surprisingly high.
This suggests employers value analysts who can integrate with engineering workflows, manage code, and contribute to production-ready pipelines.

3️⃣ Specialized AI/ML platforms pay well

Watson ($160k) and DataRobot ($155k) highlight strong salaries for AI/ML platform expertise.
These tools are enterprise-focused, and proficiency shows readiness for applied AI/automation roles.

4️⃣ Core data science ecosystem still pays well

Pandas ($152k), NumPy ($143k), Scikit-learn ($125k), and Jupyter ($152k) remain high.
These are fundamental to analysis, ML, and modeling workflows—still critical skills for analysts.

5️⃣ Programming languages expand analyst opportunities

Swift ($153k), Golang ($145k), and Scala ($125k) appear, showing analysts who cross into software engineering languages are rewarded.
This trend shows the blending of analytics + engineering roles.

*/