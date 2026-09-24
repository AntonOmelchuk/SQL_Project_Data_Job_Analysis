WITH skills_demand AS (
  SELECT
    skills_job_dim.skill_id
    , skills
    , COUNT(skills_job_dim.job_id) AS demand_count
  FROM
    job_postings_fact
  INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
  INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
  WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
  GROUP BY
    skills_job_dim.skill_id
    , skills_dim.skills
),
salary_avg AS (
  SELECT
    skills_job_dim.skill_id
    , skills
    , ROUND(AVG(salary_year_avg), 0) AS salary_avg
  FROM
    job_postings_fact
  INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
  INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
  WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
  GROUP BY
    skills_job_dim.skill_id
    , skills_dim.skills
)

SELECT
  skills_demand.skills
  , demand_count
  , salary_avg
FROM skills_demand
INNER JOIN salary_avg ON salary_avg.skill_id = skills_demand.skill_id
WHERE
  demand_count > 50
ORDER BY
  salary_avg DESC
  , demand_count DESC
LIMIT 25;

-- refactoring
SELECT
  skills_dim.skill_id
  , skills_dim.skills
  , COUNT(skills_job_dim.job_id) AS demand_count
  , ROUND(AVG(salary_year_avg), 0) AS salary_avg
FROM
  job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
  job_title_short = 'Data Analyst'
  AND salary_year_avg IS NOT NULL
GROUP BY
  skills_dim.skill_id
HAVING
  COUNT(skills_job_dim.job_id) > 10
ORDER BY
  salary_avg DESC
  , demand_count DESC
LIMIT 25;

/*
[
  {
    "skill_id": 87,
    "skills": "kafka",
    "demand_count": "41",
    "salary_avg": "129999"
  },
  {
    "skill_id": 89,
    "skills": "pytorch",
    "demand_count": "20",
    "salary_avg": "125226"
  },
  {
    "skill_id": 29,
    "skills": "perl",
    "demand_count": "20",
    "salary_avg": "124686"
  },
  {
    "skill_id": 94,
    "skills": "tensorflow",
    "demand_count": "26",
    "salary_avg": "121758"
  },
  {
    "skill_id": 191,
    "skills": "atlassian",
    "demand_count": "15",
    "salary_avg": "117966"
  },
  {
    "skill_id": 86,
    "skills": "airflow",
    "demand_count": "73",
    "salary_avg": "116692"
  },
  {
    "skill_id": 58,
    "skills": "cassandra",
    "demand_count": "12",
    "salary_avg": "115623"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "61",
    "salary_avg": "115185"
  },
  {
    "skill_id": 204,
    "skills": "confluence",
    "demand_count": "63",
    "salary_avg": "114682"
  },
  {
    "skill_id": 145,
    "skills": "linux",
    "demand_count": "59",
    "salary_avg": "114303"
  },
  {
    "skill_id": 96,
    "skills": "pyspark",
    "demand_count": "49",
    "salary_avg": "114058"
  },
  {
    "skill_id": 55,
    "skills": "mongodb",
    "demand_count": "26",
    "salary_avg": "113608"
  },
  {
    "skill_id": 15,
    "skills": "mongodb",
    "demand_count": "26",
    "salary_avg": "113608"
  },
  {
    "skill_id": 68,
    "skills": "databricks",
    "demand_count": "104",
    "salary_avg": "113096"
  },
  {
    "skill_id": 178,
    "skills": "splunk",
    "demand_count": "15",
    "salary_avg": "112928"
  },
  {
    "skill_id": 85,
    "skills": "spark",
    "demand_count": "190",
    "salary_avg": "112707"
  },
  {
    "skill_id": 187,
    "skills": "git",
    "demand_count": "76",
    "salary_avg": "112125"
  },
  {
    "skill_id": 70,
    "skills": "gcp",
    "demand_count": "80",
    "salary_avg": "111926"
  },
  {
    "skill_id": 26,
    "skills": "shell",
    "demand_count": "44",
    "salary_avg": "111496"
  },
  {
    "skill_id": 75,
    "skills": "snowflake",
    "demand_count": "248",
    "salary_avg": "111409"
  },
  {
    "skill_id": 92,
    "skills": "hadoop",
    "demand_count": "146",
    "salary_avg": "110315"
  },
  {
    "skill_id": 147,
    "skills": "unix",
    "demand_count": "38",
    "salary_avg": "110098"
  },
  {
    "skill_id": 90,
    "skills": "pandas",
    "demand_count": "95",
    "salary_avg": "109221"
  },
  {
    "skill_id": 21,
    "skills": "php",
    "demand_count": "29",
    "salary_avg": "109052"
  },
  {
    "skill_id": 61,
    "skills": "neo4j",
    "demand_count": "12",
    "salary_avg": "108646"
  }
]
*/