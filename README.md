# 📊 Netflix Data Analysis using PostgreSQL

<p align="center">
  <img src="images/netflix_banner.png" alt="Netflix Banner" width="900">
</p>

## 📌 Overview

This project analyzes the Netflix Movies and TV Shows dataset using PostgreSQL. The objective is to answer real-world business questions by applying SQL techniques such as filtering, aggregation, window functions, string manipulation, date functions, subqueries, and CASE expressions.

---

## 🎯 Objectives

- Analyze the distribution of Movies and TV Shows.
- Identify the most common ratings by content type.
- Find the top countries producing Netflix content.
- Analyze release trends over different years.
- Discover the longest movies and longest-running TV shows.
- Categorize content using keyword-based analysis.
- Practice real-world SQL business problems.

---

## 🛠️ Tech Stack

- PostgreSQL 18
- pgAdmin 4
- SQL

---

## 📂 Dataset

**Dataset:** Netflix Movies & TV Shows

**Source:** Kaggle

**Rows:** 8,807

**Columns:** 12

---

## 🗂️ Database Schema

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

# 📈 Business Problems & Solutions

## 1️⃣ Count Movies vs TV Shows

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

### Output

(Add Screenshot)

---

## 2️⃣ Find the Most Common Rating

### Objective

Identify the most frequently occurring rating for Movies and TV Shows.

```sql
-- SQL Query
```

(Add Screenshot)

---

## 3️⃣ List Movies Released in 2019

(Add Query)

(Add Screenshot)

---

Continue for all 15 questions...

---

# 📊 Key Insights

- Movies account for the majority of Netflix content.
- TV-MA is the most common rating.
- The United States and India contribute the most content.
- Netflix content has grown significantly after 2015.
- Documentaries and International Movies are among the most common genres.

---

# 📚 SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- Aggregate Functions
- Window Functions
- CASE WHEN
- Subqueries
- CTE
- String Functions
- Date Functions
- UNNEST()
- STRING_TO_ARRAY()

---

# 👩‍💻 Author

**Sandhiya G**

B.Tech Artificial Intelligence & Data Science

Aspiring Data Analyst
