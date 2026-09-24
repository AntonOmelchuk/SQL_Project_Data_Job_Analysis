SELECT
  skills
  , ROUND(AVG(salary_year_avg), 0) AS salary_avg
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
  job_title_short = 'Data Analyst'
  AND salary_year_avg IS NOT NULL
GROUP BY
  skills
ORDER BY
  salary_avg DESC
LIMIT 10;

/*
[
  {
    "skills": "svn",
    "salary_avg": "400000"
  },
  {
    "skills": "solidity",
    "salary_avg": "179000"
  },
  {
    "skills": "couchbase",
    "salary_avg": "160515"
  },
  {
    "skills": "datarobot",
    "salary_avg": "155486"
  },
  {
    "skills": "golang",
    "salary_avg": "155000"
  },
  {
    "skills": "mxnet",
    "salary_avg": "149000"
  },
  {
    "skills": "dplyr",
    "salary_avg": "147633"
  },
  {
    "skills": "vmware",
    "salary_avg": "147500"
  },
  {
    "skills": "twilio",
    "salary_avg": "138500"
  },
  {
    "skills": "gitlab",
    "salary_avg": "134126"
  }
]
*/