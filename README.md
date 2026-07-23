# 📊 Netflix Data Analysis using PostgreSQL

<p align="center">
  <img src="images/netflix_banner.png" alt="Netflix Data Analysis Banner" width="100%">
</p>

## 📌 Overview

This project showcases end-to-end SQL data analysis on the **Netflix Movies and TV Shows** dataset using **PostgreSQL**. The objective is to solve real-world business problems by writing SQL queries and extracting meaningful insights from the dataset. The project demonstrates practical SQL skills including data filtering, aggregation, window functions, string manipulation, date functions, subqueries, and conditional logic.

---

## 🎯 Project Objectives

- Analyze the distribution of Movies and TV Shows.
- Identify the most common ratings for each content type.
- Find the top countries producing Netflix content.
- Analyze content based on release year and date added.
- Identify the longest movies and TV shows with multiple seasons.
- Explore content by directors, actors, and genres.
- Categorize content using keyword-based analysis.
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
- **Records:** ~8,800
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

# 📈 Business Problems & Solutions

## 1️⃣ Count the Number of Movies vs TV Shows

**Objective**

Determine the distribution of Movies and TV Shows available on Netflix.

**SQL Concepts Used**

- GROUP BY
- COUNT()

---

## 2️⃣ Find the Most Common Rating for Movies and TV Shows

**Objective**

Identify the most frequently occurring rating for each content type.

**SQL Concepts Used**

- Window Functions
- RANK()
- Aggregate Functions

---

## 3️⃣ List All Movies Released in 2019

**Objective**

Retrieve all movies released in the year 2019.

**SQL Concepts Used**

- WHERE
- Filtering

---

## 4️⃣ Find the Top 5 Countries with the Most Content

**Objective**

Identify the countries with the highest number of Netflix titles.

**SQL Concepts Used**

- STRING_TO_ARRAY()
- UNNEST()
- GROUP BY

---

## 5️⃣ Identify the Longest Movie

**Objective**

Find the movie with the longest duration.

**SQL Concepts Used**

- MAX()
- Subquery

---

## 6️⃣ Find Content Added in the Last Five Years

**Objective**

Retrieve content added to Netflix within the last five years.

**SQL Concepts Used**

- TO_DATE()
- CURRENT_DATE
- INTERVAL

---

## 7️⃣ Find Movies and TV Shows by Rajiv Chilaka

**Objective**

Retrieve all content directed by Rajiv Chilaka.

**SQL Concepts Used**

- LIKE

---

## 8️⃣ List TV Shows with More Than Five Seasons

**Objective**

Find TV Shows that have more than five seasons.

**SQL Concepts Used**

- CAST()
- SPLIT_PART()

---

## 9️⃣ Count the Number of Content Items in Each Genre

**Objective**

Calculate the number of titles available in each genre.

**SQL Concepts Used**

- STRING_TO_ARRAY()
- UNNEST()
- GROUP BY

---

## 🔟 Find the Average Number of Content Releases by India

**Objective**

Analyze yearly Netflix releases from India and identify the top years.

**SQL Concepts Used**

- EXTRACT()
- ROUND()
- Aggregate Functions

---

## 1️⃣1️⃣ List All Documentary Movies

**Objective**

Retrieve all documentary movies available on Netflix.

**SQL Concepts Used**

- ILIKE

---

## 1️⃣2️⃣ Find Content Without a Director

**Objective**

Identify titles where the director information is missing.

**SQL Concepts Used**

- NULL Handling

---

## 1️⃣3️⃣ Find Salman Khan Movies Released in the Last 10 Years

**Objective**

Retrieve content featuring Salman Khan released during the last decade.

**SQL Concepts Used**

- ILIKE
- Date Functions

---

## 1️⃣4️⃣ Find the Top 10 Actors Appearing in Indian Content

**Objective**

Identify the actors with the highest number of appearances in Indian Netflix titles.

**SQL Concepts Used**

- STRING_TO_ARRAY()
- UNNEST()
- GROUP BY

---

## 1️⃣5️⃣ Categorize Content Based on Keywords

**Objective**

Classify Netflix titles as **Good** or **Bad** based on keywords such as **kill** and **violence** in the description and count the number of titles in each category.

**SQL Concepts Used**

- CASE WHEN
- ILIKE
- Aggregate Functions

---

# 📚 SQL Concepts Covered

- SELECT
- WHERE
- DISTINCT
- GROUP BY
- ORDER BY
- Aggregate Functions
- Window Functions
- CASE WHEN
- Subqueries
- String Functions
- Date Functions
- CAST()
- SPLIT_PART()
- STRING_TO_ARRAY()
- UNNEST()
- NULL Handling

---

# 📊 Key Insights

- Movies account for the majority of Netflix's content library.
- TV-MA is the most common content rating.
- The United States and India contribute the highest number of titles.
- Netflix experienced significant content growth after 2015.
- Documentaries and International Movies are among the most common genres.

---

# 📁 Project Structure

```
Netflix-Data-Analysis/
│
├── README.md
├── dataset/
│   └── netflix_titles.csv
│
├── sql/
│   ├── create_table.sql
│   └── business_queries.sql
│
├── images/
│   ├── netflix_banner.png
│   ├── query_1.png
│   ├── query_2.png
│   ├── ...
│
└── LICENSE
```

---

## 🚀 Future Improvements

- Perform SQL query optimization.
- Build an interactive Power BI dashboard using the dataset.
- Extend the project with additional analytical business questions.
- Create stored procedures and views for reusable analysis.

---

## 👩‍💻 Author

**Santhiya G**

B.Tech – Artificial Intelligence & Data Science

Aspiring Data Analyst

📧 Email: santhiya6741@gmail.com

---

## ⭐ If you found this project helpful, consider giving it a star!
