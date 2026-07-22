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

select * from netflix;

select count (*) as total_content from netflix;

select distinct type from netflix;

--1.Count the number of Movies vs TV Shows
select
	type,
	count (*) as total_content
from netflix
group by type;

--2. find the most common for movies and tv shows
select
	type,
	rating
from
(
select
	type,
	rating,
	count (*) as maximum_rating,
	rank() over(partition by type order by count(*) desc) as ranking
from netflix
group by type , rating
)as t1
where ranking=1;

--3. list all movies relested in a specific year(eg:2019)
select *from netflix
where type='Movie' and release_year=2019;

--4. find the top 5 countries with tne most content on netflix
select
	unnest(string_to_array(country,',')) as new_country,
	count(show_id) as total_count
from netflix
group by 1
order by 2 desc
limit 5

--5. identity the longest movie
select * from netflix
where type='Movie' and duration=(select max(duration) from netflix)

--6.find the content added in the last 5 years 
select * from netflix
where to_date(date_added,'month DD,YYYY') >= current_date - interval '5 years'

--7.find the all the movie/tv shows by a specific director (eg:Rajiv Chilaka)
select * from netflix
where director like '%Rajiv Chilaka%'

--8.list all the tv shows with more than 5 seasons
select * from netflix
where type='TV Show' and cast(split_part(duration,' ',1) as int)>5

--9.count the number of content items in each genre
select 
	unnest(string_to_array(listed_in, ',')) as genre,
	count(show_id) as total_content
from netflix
group by 1

--10.Find each year and the average number of content released by India on Netflix;
--return the top 5 years with the highest average release
select
	extract(year from to_date(date_added,'month DD,YYYY')) as year,
	count(*),
	round(count(*)::numeric/(select count(*) from netflix where country='India') *100,2) as avg_content_per_year
from netflix
where country='India'
group by 1

--11.list all movies that are documentaries
select * from netflix
where type='Movie' and listed_in ilike '%documentaries%'

--12.Find all content without a director
select * from netflix
where director is null

--13.Find how many movies actor Salman Khan appeared in over the last 10 years 
select * from netflix
where casts ilike '%salman khan%' and release_year > extract(year from current_date) - 10

--14.Find the top 10 actors who appeared in the highest number of movies produced in India
select 
	unnest(string_to_array(casts, ',')) as actor,
	count(*) as total_content
from netflix
where country ilike '%india%'
group by 1
order by 2 desc
limit 10

--15.Categorize the content based on the presence of keywords like 'kill' and 'violence' 
--in the description field. Label content containing these keywords as 'bad' and all other
--content as 'good'. Count how many items fall into each category. 
select 
	case
		when description ilike '%kill%'
		or description ilike '%bad%' then 'bad_content'
		else 'good_content'
	end as catagory,
	count(*) as total_content
from netflix
group by 1;
	