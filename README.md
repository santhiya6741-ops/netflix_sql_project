# 📊 Netflix Data Analysis using PostgreSQL

<p align="center">
  <img src="https://github.com/santhiya6741-ops/netflix_sql_project/blob/main/images.png" alt="Netflix Data Analysis" width="900">
</p>

## 📌 Overview

This project demonstrates end-to-end SQL data analysis on the Netflix Movies and TV Shows dataset using PostgreSQL. The project focuses on solving real-world business problems using SQL by performing data exploration, filtering, aggregation, window functions, string manipulation, date operations, and conditional logic to extract meaningful insights.

---

## 🎯 Objectives

- Analyze the distribution of Movies and TV Shows.
- Identify the most common ratings for each content type.
- Analyze Netflix content by release year and country.
- Find trends in genres, directors, actors, and durations.
- Practice real-world SQL business problems using PostgreSQL.

---

## 🛠️ Tools & Technologies

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

## 🗄️ Database Schema

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

# 📈 Business Problems & SQL Solutions

## 1️⃣ Count the Number of Movies vs TV Shows

### SQL Query

```sql
SELECT
    type,
    COUNT(*) AS total_content
FROM netflix
GROUP BY type;
```

### Objective

Determine the distribution of Movies and TV Shows available on Netflix.

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

### Objective

Identify the most frequently occurring rating for each content type.

---

## 3️⃣ List All Movies Released in 2019

### SQL Query

```sql
SELECT *
FROM netflix
WHERE type='Movie'
AND release_year=2019;
```

### Objective

Retrieve all movies released during the year 2019.

---

## 4️⃣ Find the Top 5 Countries with the Most Content

### SQL Query

```sql
SELECT
    UNNEST(STRING_TO_ARRAY(country, ',')) AS country,
    COUNT(show_id) AS total_content
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
```

### Objective

Identify the top five countries producing the highest amount of Netflix content.

---

## 5️⃣ Identify the Longest Movie

### SQL Query

```sql
SELECT *
FROM netflix
WHERE type='Movie'
AND duration=(
    SELECT MAX(duration)
    FROM netflix
);
```

### Objective

Find the movie with the longest duration.

---

## 6️⃣ Find Content Added in the Last 5 Years

### SQL Query

```sql
SELECT *
FROM netflix
WHERE TO_DATE(date_added,'Month DD,YYYY')
>= CURRENT_DATE - INTERVAL '5 years';
```

### Objective

Retrieve all Netflix content added within the last five years.

---

## 7️⃣ Find Movies and TV Shows by Rajiv Chilaka

### SQL Query

```sql
SELECT *
FROM netflix
WHERE director LIKE '%Rajiv Chilaka%';
```

### Objective

Retrieve all content directed by Rajiv Chilaka.

---

## 8️⃣ List TV Shows with More Than 5 Seasons

### SQL Query

```sql
SELECT *
FROM netflix
WHERE type='TV Show'
AND CAST(SPLIT_PART(duration,' ',1) AS INT) > 5;
```

### Objective

Identify TV shows that have more than five seasons.

---

## 9️⃣ Count the Number of Content Items in Each Genre

### SQL Query

```sql
SELECT
    UNNEST(STRING_TO_ARRAY(listed_in,',')) AS genre,
    COUNT(show_id) AS total_content
FROM netflix
GROUP BY 1;
```

### Objective

Calculate the number of content items available in each genre.

---

## 🔟 Find the Top 5 Years with the Highest Average Content Released by India

### SQL Query

```sql
SELECT
    EXTRACT(YEAR FROM TO_DATE(date_added,'Month DD,YYYY')) AS year,
    COUNT(*),
    ROUND(
        COUNT(*)::numeric /
        (
            SELECT COUNT(*)
            FROM netflix
            WHERE country='India'
        ) *100,
        2
    ) AS avg_content_per_year
FROM netflix
WHERE country='India'
GROUP BY 1;
```

### Objective

Analyze the yearly contribution of Indian content added to Netflix.

---

## 1️⃣1️⃣ List All Documentary Movies

### SQL Query

```sql
SELECT *
FROM netflix
WHERE type='Movie'
AND listed_in ILIKE '%Documentaries%';
```

### Objective

Retrieve all movies categorized as documentaries.

---

## 1️⃣2️⃣ Find Content Without a Director

### SQL Query

```sql
SELECT *
FROM netflix
WHERE director IS NULL;
```

### Objective

Identify Netflix content where director information is missing.

---

## 1️⃣3️⃣ Find Salman Khan Movies Released in the Last 10 Years

### SQL Query

```sql
SELECT *
FROM netflix
WHERE casts ILIKE '%Salman Khan%'
AND release_year >
EXTRACT(YEAR FROM CURRENT_DATE)-10;
```

### Objective

Find all Netflix titles featuring Salman Khan released during the last ten years.

---

## 1️⃣4️⃣ Find the Top 10 Actors Appearing in Indian Content

### SQL Query

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

### Objective

Identify the actors with the highest number of appearances in Indian Netflix productions.

---

## 1️⃣5️⃣ Categorize Content Based on Keywords

### SQL Query

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

### Objective

Categorize Netflix content as **Bad Content** or **Good Content** based on the presence of keywords such as **kill** or **violence** in the description and calculate the number of items in each category.

---

# 🧠 SQL Concepts Covered

- SELECT
- WHERE
- GROUP BY
- ORDER BY
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
- RANK()

---

# 📊 Key Learnings

- Performed end-to-end SQL analysis on a real-world dataset.
- Applied PostgreSQL functions to clean and transform data.
- Solved 15 business-oriented SQL problems.
- Used window functions, subqueries, and string manipulation for advanced analysis.
- Improved SQL problem-solving skills using practical business scenarios.

---

# 👩‍💻 Author

**Santhiya G**

B.Tech – Artificial Intelligence & Data Science

Aspiring Data Analyst
