/* List the films where the yr is 1962 [Show id, title]  */

SELECT id, title 
    FROM movie 
    WHERE yr = 1962;

/* Give year of 'Citizen Kane'. */

SELECT yr 
    FROM movie 
    WHERE title = 'Citizen Kane';

/* List all of the Star Trek movies,
include the id, title and yr 
(all of these movies include the words Star Trek in the title).
Order results by year. */

SELECT id,title,yr 
    FROM movie 
    WHERE title 
    LIKE '%Star%Trek%' 
    ORDER BY yr;

/* What id number does the actor 'Glenn Close' have? */

SELECT id 
    FROM actor 
    WHERE name 
    LIKE 'Glenn CLose';

/* What is the id of the film 'Casablanca' */

SELECT id 
    FROM movie 
    WHERE title ='Casablanca' ;

/*Obtain the cast list for 'Casablanca'.
what is a cast list?
The cast list is the names of the actors who were in the movie.
Use movieid=11768, (or whatever value you got from the previous question) */

SELECT name 
    FROM casting, actor 
    WHERE movieid = 
        (SELECT id FROM movie WHERE title='Casablanca')
        AND  actorid=actor.id;

/*Obtain the cast list for the film 'Alien' */

SELECT name 
    FROM casting, actor 
    WHERE movieid = 
        (SELECT id FROM movie WHERE title='Alien')
        AND  actorid=actor.id;

/* List the films in which 'Harrison Ford' has appeared */

SELECT title
    FROM movie
    JOIN casting 
    ON (id=movieid AND actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford'));

/* List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role] */

SELECT title
    FROM movie, casting, actor
    WHERE name = 'Harrison Ford'
    AND movieid = movie.id
    AND actorid = actor.id
    AND ord != 1;

/*.

List the films together with the leading star for all 1962 films. */ 


SELECT title,name
    FROM movie,casting, actor
    WHERE yr = 1962
    AND movieid = movie.id
    AND actorid = actor.id
    AND ord = 1;

/*Which were the busiest years for 'Rock Hudson',
show the year and the number of movies he made each year for any year in which he made more than 2 movies. */

SELECT yr,COUNT(title) FROM movie 
    JOIN casting 
    ON movie.id=movieid
    JOIN actor   
    ON actorid=actor.id
        WHERE name='ROck Hudson'
        GROUP BY yr
        HAVING COUNT(title) > 2;

/*List the film title and the leading actor for all of the films 'Julie Andrews' played in.
Did you get "Little Miss Marker twice"?
Julie Andrews starred in the 1980 remake of Little Miss Marker and not the original(1934).
Title is not a unique field, create a table of IDs in your subquery */

SELECT title, name FROM  movie 
    JOIN casting 
    ON (movieid=movie.id AND ord =1)
    JOIN actor 
    ON (actorid=actor.id)
    WHERE movie.id IN (
        SELECT movieid 
        FROM casting 
        WHERE actorid IN (
            SELECT id FROM actor
            WHERE name='Julie Andrews'));


/*Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles. */            


SELECT name FROM actor 
    JOIN casting 
    ON actorid = id 
    WHERE ord =1 
    GROUP BY name 
    HAVING COUNT(movieid)>=15;

/*List the films released in the year 1978 ordered by the number of actors in the cast, then by title. */ 

SELECT title,COUNT(actorid)
    FROM movie,casting
    WHERE yr=1978
    AND movieid=movie.id
    GROUP BY title
    ORDER BY 2 DESC, 1 ASC;

/*List all the people who have worked with 'Art Garfunkel'. */

SELECT DISTINCT name FROM actor 
    JOIN casting 
    ON(actor.id = casting.actorid) 
    WHERE casting.movieid IN(
        SELECT movieid 
        FROM casting JOIN actor 
        ON (actorid=id) 
        WHERE name = 'Art Garfunkel') 
        AND actor.name != 'Art Garfunkel';