# 📊 Netflix Data Analysis using PostgreSQL

<p align="center">
  <img src="images/netflix_banner.png" alt="Netflix Data Analysis Banner" width="900"/>
</p>

## 📌 Project Overview

This project demonstrates end-to-end SQL data analysis on the Netflix Movies and TV Shows dataset using PostgreSQL. The objective is to answer real-world business questions by applying SQL concepts such as filtering, aggregation, window functions, string manipulation, date functions, subqueries, and conditional logic to extract meaningful insights.

---

## 🎯 Project Objectives

- Analyze the distribution of Movies and TV Shows.
- Identify the most common ratings for each content type.
- Find the top countries producing Netflix content.
- Analyze content based on release year and date added.
- Identify the longest movies and TV shows with multiple seasons.
- Find documentaries, missing directors, and actor appearances.
- Categorize content using keyword-based classification.
- Practice solving real-world SQL business problems.

---

## 🛠️ Tech Stack

- PostgreSQL 18
- pgAdmin 4
- SQL

---

## 📂 Dataset

- **Dataset:** Netflix Movies & TV Shows
- **Source:** Kaggle
- **Rows:** ~8,800
- **Columns:** 12

---

# 🗄️ Database Schema

```sql
CREATE TABLE netflix(
    show_id TEXT,
    type TEXT,
    title TEXT,
    director TEXT,
    casts TEXT,
    country TEXT,
    date_added TEXT,
    release_year INT,
    rating TEXT,
    duration TEXT,
    listed_in TEXT,
    description TEXT
);
```

---

# 📈 Business Problems Solved

## 1️⃣ Count the Number of Movies vs TV Shows

### Objective

Determine the distribution of Movies and TV Shows available on Netflix.

### SQL Query

```sql
SELECT
    type,
    COUNT(*) AS total_content
FROM netflix
GROUP BY type;
```

---

## 2️⃣ Find the Most Common Rating for Movies and TV Shows

### SQL Query

```sql
SELECT
    type,
    rating
FROM
(
SELECT
    type,
    rating,
    COUNT(*) AS maximum_rating,
    RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC) AS ranking
FROM netflix
GROUP BY type, rating
) AS t1
WHERE ranking = 1;
```

---

## 3️⃣ List All Movies Released in 2019

```sql
SELECT *
FROM netflix
WHERE type='Movie'
AND release_year=2019;
```

---

## 4️⃣ Find the Top 5 Countries with the Most Content

```sql
SELECT
    UNNEST(STRING_TO_ARRAY(country,',')) AS country,
    COUNT(show_id) AS total_content
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
```

---

## 5️⃣ Identify the Longest Movie

```sql
SELECT *
FROM netflix
WHERE type='Movie'
AND duration=
(
SELECT MAX(duration)
FROM netflix
);
```

---

## 6️⃣ Find Content Added in the Last 5 Years

```sql
SELECT *
FROM netflix
WHERE TO_DATE(date_added,'Month DD,YYYY')
>= CURRENT_DATE - INTERVAL '5 years';
```

---

## 7️⃣ Find Movies and TV Shows by Rajiv Chilaka

```sql
SELECT *
FROM netflix
WHERE director LIKE '%Rajiv Chilaka%';
```

---

## 8️⃣ List TV Shows with More Than 5 Seasons

```sql
SELECT *
FROM netflix
WHERE type='TV Show'
AND CAST(SPLIT_PART(duration,' ',1) AS INT) > 5;
```

---

## 9️⃣ Count Content Items in Each Genre

```sql
SELECT
    UNNEST(STRING_TO_ARRAY(listed_in,',')) AS genre,
    COUNT(show_id) AS total_content
FROM netflix
GROUP BY 1;
```

---

## 🔟 Find Each Year and the Average Content Released by India

```sql
SELECT
EXTRACT(YEAR FROM TO_DATE(date_added,'Month DD,YYYY')) AS year,
COUNT(*),
ROUND(
COUNT(*)::NUMERIC /
(
SELECT COUNT(*)
FROM netflix
WHERE country='India'
)*100,2
) AS avg_content_per_year
FROM netflix
WHERE country='India'
GROUP BY 1;
```

---

## 1️⃣1️⃣ List All Documentary Movies

```sql
SELECT *
FROM netflix
WHERE type='Movie'
AND listed_in ILIKE '%Documentaries%';
```

---

## 1️⃣2️⃣ Find Content Without a Director

```sql
SELECT *
FROM netflix
WHERE director IS NULL;
```

---

## 1️⃣3️⃣ Find Salman Khan Movies Released in the Last 10 Years

```sql
SELECT *
FROM netflix
WHERE casts ILIKE '%Salman Khan%'
AND release_year >
EXTRACT(YEAR FROM CURRENT_DATE)-10;
```

---

## 1️⃣4️⃣ Top 10 Actors Appearing in Indian Movies

```sql
SELECT
UNNEST(STRING_TO_ARRAY(casts,',')) AS actor,
COUNT(*) AS total_content
FROM netflix
WHERE country ILIKE '%India%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
```

---

## 1️⃣5️⃣ Categorize Content as Good or Bad

```sql
SELECT
CASE
WHEN description ILIKE '%kill%'
OR description ILIKE '%violence%'
THEN 'Bad Content'
ELSE 'Good Content'
END AS category,
COUNT(*) AS total_content
FROM netflix
GROUP BY 1;
```

---

# 🧠 SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- DISTINCT
- Aggregate Functions
- Window Functions
- CASE WHEN
- Subqueries
- Date Functions
- String Functions
- CAST()
- SPLIT_PART()
- STRING_TO_ARRAY()
- UNNEST()
- TO_DATE()
- EXTRACT()
- CURRENT_DATE
- INTERVAL
- NULL Handling

---

# 📊 Key Insights

- Movies make up the majority of Netflix's content library.
- TV-MA is the most common content rating.
- The United States and India contribute the highest number of titles.
- Netflix experienced rapid content growth after 2015.
- International Movies and Documentaries are among the most popular genres.

---

# 📁 Project Structure

```
Netflix-SQL-Project/
│
├── README.md
├── dataset/
│   └── netflix_titles.csv
│
├── sql/
│   ├── create_table.sql
│   └── business_problems.sql
│
├── images/
│   ├── netflix_banner.png
│   ├── query1.png
│   ├── query2.png
│   └── ...
│
└── LICENSE
```

---

# 👨‍💻 Author

**Santhiya G**

B.Tech Artificial Intelligence & Data Science

Aspiring Data Analyst

---

## ⭐ If you found this project useful, don't forget to give it a Star!
