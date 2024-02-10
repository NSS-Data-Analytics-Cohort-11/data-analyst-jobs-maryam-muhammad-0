-- 1.How many rows are in the data_analyst_jobs table?
SELECT COUNT(*)
FROM data_analyst_jobs
-- 2a. Write a query to look at just the first 10 rows. 
SELECT *
FROM data_analyst_jobs
LIMIT 10;
-- 2b.ExxonMobil
-- 3a. How many postings are in Tennessee? 
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN'
-- 3b. How many are there in either Tennessee or Kentucky?
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location IN ('TN','KY')
-- 4. How many postings in Tennessee have a star rating above 4?
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN'
AND star_rating > 4
-- 5. How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000
-- 6a. Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating.
SELECT location, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location
-- 6b. Which state shows the highest average rating?
SELECT location, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC
LIMIT 5;
-- 7a. Select unique job titles from the data_analyst_jobs table. 
SELECT DISTINCT(title)
FROM data_analyst_jobs
-- 7b. How many are there?
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
-- 8. How many unique job titles are there for California companies?
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE location = 'CA';
-- 9a. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations.
SELECT company, AVG(star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company;
-- 9b. How many companies are there with more that 5000 reviews across all locations?
SELECT COUNT(DISTINCT company)
FROM data_analyst_jobs
WHERE review_count > 5000;
-- 10a. Add the code to order the query in #9 from highest to lowest average star rating.
-- Which company with more than 5000 reviews across all locations in the dataset has the highest star rating?
SELECT company, AVG(star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_star_rating DESC;
-- 10b. What is that rating?
-- ~4.2 (six way tie)
-- 11a. Find all the job titles that contain the word ‘Analyst’.
SELECT title
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';
-- 11b. How many different job titles are there?
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';
-- 12a. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’?
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
AND title NOT ILIKE '%Analytics%';
-- 12b. What word do these positions have in common? Tableau
SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
AND title NOT ILIKE '%Analytics%';
--- BONUS
