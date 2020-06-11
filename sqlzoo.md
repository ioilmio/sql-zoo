## SELECT BASICS ##

1. SELECT population FROM world
    WHERE name = 'Germany';

2. SELECT name, population FROM world
    WHERE name IN ('Sweden','Norway','Denmark');

3. SELECT name, area FROM world
    WHERE area BETWEEN 200_000 AND 250_000;

## SELECT from WORLD Tutorial ##

1. SELECT name, continent, population FROM world;

2. SELECT name FROM world
    WHERE population >200_000_000;

3. SELECT name, gdp/population FROM world 
    WHERE population > 200_000_000;

4. SELECT name, population/1_000_000 FROM world 
    WHERE continent = 'South America';

5. SELECT name, population FROM world 
    WHERE name IN ('France', 'Germany', 'Italy');

6. SELECT name FROM world WHERE name LIKE '%United%';

7. SELECT name, population, area FROM world 
    WHERE population > 25_000_000 AND area > 3_000_000;

8. SELECT name, population, area FROM world 
    WHERE (area > 3000000 AND population < 250000000)
    OR (area < 3000000 and population > 250000000);

9. SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2)  FROM world 
    WHERE continent = 'South America';

10. SELECT name, ROUND(gdp/population, -3) FROM world 
    WHERE gdp >= 1000000000000;

11. SELECT name, capital FROM world
    WHERE LENGTH(name) = LENGTH(capital);
    
12. SELECT name,capital FROM world 
    WHERE LEFT(name,1) = LEFT(capital,1) AND name <> capital;

13. SELECT name FROM world
     WHERE name LIKE '%A%'
       AND name LIKE '%E%'
       AND name LIKE '%I%'
       AND name LIKE '%O%'
       AND name LIKE '%U%'
       AND name NOT LIKE '% %';