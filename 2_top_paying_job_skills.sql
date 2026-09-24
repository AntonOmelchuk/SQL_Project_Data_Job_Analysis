WITH top_paying_jobs AS (
  SELECT
    job_id
    , job_title
    , salary_year_avg
    , name AS company_name
  FROM
    job_postings_fact
  JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
  WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
  ORDER BY
    salary_year_avg DESC
)

SELECT
  top_paying_jobs.*
  , skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON skills_job_dim.job_id = top_paying_jobs.job_id
INNER JOIN skills_dim ON  skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY
  salary_year_avg DESC
LIMIT 10;

/*
Here's the breakdown of the most demanded skills for data analysts in 2023, based on job positings:
  - SQL is leading with a bold count of 8.
  - Python follows closely with a bold count of 7.
  - Tableau is also highly sought after, with a bold cound of 6.
  - Other skills like R, Snowflake, Pandas and Excel show varying degrees of demand.

[
  {
    "job_id": 101959,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.00",
    "company_name": "Uclahealthcareers",
    "skills": "sql"
  },
  {
    "job_id": 101959,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.00",
    "company_name": "Uclahealthcareers",
    "skills": "crystal"
  },
  {
    "job_id": 101959,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.00",
    "company_name": "Uclahealthcareers",
    "skills": "oracle"
  },
  {
    "job_id": 101959,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.00",
    "company_name": "Uclahealthcareers",
    "skills": "tableau"
  },
  {
    "job_id": 101959,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.00",
    "company_name": "Uclahealthcareers",
    "skills": "flow"
  },
  {
    "job_id": 47609,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.00",
    "company_name": "Motional",
    "skills": "python"
  },
  {
    "job_id": 47609,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.00",
    "company_name": "Motional",
    "skills": "r"
  },
  {
    "job_id": 47609,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.00",
    "company_name": "Motional",
    "skills": "sql"
  },
  {
    "job_id": 47609,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.00",
    "company_name": "Motional",
    "skills": "git"
  },
  {
    "job_id": 47609,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.00",
    "company_name": "Motional",
    "skills": "bitbucket"
  }
]
*/