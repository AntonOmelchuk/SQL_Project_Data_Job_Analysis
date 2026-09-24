SELECT
  job_id
  , job_title
  , job_location
  , job_schedule_type
  , salary_year_avg
  , job_posted_date
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
LIMIT 10;

/*
[
  {
    "job_id": 27020,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "650000.00",
    "job_posted_date": "2023-02-21 00:00:00",
    "company_name": "Mantys"
  },
  {
    "job_id": 101959,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.00",
    "job_posted_date": "2023-01-17 00:00:00",
    "company_name": "Uclahealthcareers"
  },
  {
    "job_id": 47609,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.00",
    "job_posted_date": "2023-01-05 00:00:00",
    "company_name": "Motional"
  },
  {
    "job_id": 10112,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "job_location": "Anywhere",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "170000.00",
    "job_posted_date": "2023-01-24 00:00:00",
    "company_name": "Kelly Science, Engineering, Technology & Telecom"
  },
  {
    "job_id": 92799,
    "job_title": "Principal Data Science Analyst- Remote",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "164746.00",
    "job_posted_date": "2023-01-14 00:00:00",
    "company_name": "Mayo Clinic"
  },
  {
    "job_id": 12388,
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160000.00",
    "job_posted_date": "2023-02-03 00:00:00",
    "company_name": "Realtime Recruitment"
  },
  {
    "job_id": 87959,
    "job_title": "SQL DEVELOPER / DATA ANALYST (Insurance industry Experience) ...",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160000.00",
    "job_posted_date": "2023-01-30 00:00:00",
    "company_name": "Robert Half"
  },
  {
    "job_id": 9985,
    "job_title": "Lead Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "155000.00",
    "job_posted_date": "2023-01-06 00:00:00",
    "company_name": "Motion Recruitment"
  },
  {
    "job_id": 36613,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "152625.00",
    "job_posted_date": "2023-03-12 00:00:00",
    "company_name": "Zscaler"
  },
  {
    "job_id": 77064,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "152625.00",
    "job_posted_date": "2023-03-08 00:00:00",
    "company_name": "Zscaler"
  }
]
*/
