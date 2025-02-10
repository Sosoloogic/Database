SHOW TABLES;
SELECT Name, Language FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'T';
SELECT Name, Population FROM city WHERE CountryCode = 'DEU';
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea ASC LIMIT 5;
SELECT Name, Population FROM country WHERE Population > 50000000 ORDER BY Population DESC;
SELECT Continent, AVG(LifeExpectancy) AS AvgLifeExpectancy FROM country GROUP BY Continent;
SELECT country.Name, COUNT(city.ID) AS CityCount
FROM country
JOIN city ON country.Code = city.CountryCode
GROUP BY country.Name
ORDER BY CityCount DESC;
SELECT city.Name, country.Name AS CountryName, city.Population
FROM city
JOIN country ON city.CountryCode = country.Code
ORDER BY city.Population DESC LIMIT 10;
SELECT DISTINCT country.Name
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';
SELECT DISTINCT country.Name
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'F';
SELECT Name FROM country
WHERE Population > 3 * (SELECT Population FROM country WHERE Name = country.Name AND Year = 1975);
SELECT Continent, Name, GNP
FROM country
WHERE (Continent, GNP) IN (
  SELECT Continent, MAX(GNP) FROM country GROUP BY Continent
  UNION
  SELECT Continent, MIN(GNP) FROM country GROUP BY Continent
);
SELECT Name, LifeExpectancy FROM country
WHERE LifeExpectancy < (SELECT AVG(LifeExpectancy) FROM country);
SELECT country.Name, city.Name AS CapitalCity
FROM country
JOIN city ON country.Capital = city.ID
WHERE country.Population > 100000000;
SELECT Continent, COUNT(*) AS CountryCount
FROM country
GROUP BY Continent
ORDER BY CountryCount DESC LIMIT 1;



