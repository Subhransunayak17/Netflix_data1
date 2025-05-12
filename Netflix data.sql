CREATE TABLE netflix_titles (
    show_id VARCHAR(10) PRIMARY KEY,
    type VARCHAR(20),
    title VARCHAR(255),
    director VARCHAR(255),
    cast TEXT,
    country VARCHAR(100),
    date_added DATE,
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(50),
    listed_in TEXT,
    description TEXT
);

-- Sample data insert (add more as needed)
INSERT INTO netflix_titles VALUES
('s1', 'Movie', 'Dick Johnson Is Dead', 'Kirsten Johnson', NULL, 'United States', '2021-09-25', 2020, 'PG-13', '90 min', 'Documentaries', 'As her father nears the end of his life, filmmaker Kirsten Johnson stages his death in inventive ways to help them both face the inevitable.');

-- Sample analysis queries
-- 1. Count of Movies vs TV Shows
SELECT type, COUNT(*) AS total
FROM netflix_titles
GROUP BY type;

-- 2. Content added per year
SELECT YEAR(date_added) AS year_added, COUNT(*) AS total_shows
FROM netflix_titles
WHERE date_added IS NOT NULL
GROUP BY year_added
ORDER BY year_added;

-- 3. Top 10 countries by number of titles
SELECT country, COUNT(*) AS total
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total DESC
LIMIT 10;

-- 4. Most popular genres
SELECT listed_in, COUNT(*) AS total
FROM netflix_titles
GROUP BY listed_in
ORDER BY total DESC
LIMIT 10;

-- 5. Oldest and newest titles
SELECT title, release_year
FROM netflix_titles
ORDER BY release_year ASC
LIMIT 1;

SELECT title, release_year
FROM netflix_titles
ORDER BY release_year DESC
LIMIT 1;

-- 6. Content by rating
SELECT rating, COUNT(*) AS total
FROM netflix_titles
GROUP BY rating
ORDER BY total DESC;

-- 7. Directors with most titles
SELECT director, COUNT(*) AS total
FROM netflix_titles
WHERE director IS NOT NULL
GROUP BY director
ORDER BY total DESC
LIMIT 10;
