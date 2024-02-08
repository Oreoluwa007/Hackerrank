/* 
 Query a list of CITY names from STATION for cities that have an even ID number. 
 Print the results in any order, but exclude duplicates from the answer.
*/

select distinct city from station
where id % 2 = 0;

/*
 Find the difference between the total number of CITY entries in the table 
 and the number of distinct CITY entries in the table.
*/

select COUNT(*) - COUNT(DISTINCT city)
as difference
from station;

/*
Query the two cities in STATION with the shortest and longest CITY names, 
as well as their respective lengths (i.e.: number of characters in the name). 
If there is more than one smallest or largest city, 
choose the one that comes first when ordered alphabetically.
*/

select city, LENGTH(city) as city_length from station
order by city_length
limit 1;

select city, LENGTH(city) as city_length from station
order by city_length desc
limit 1;

/*
Query the list of CITY names starting with 
vowels (i.e., a, e, i, o, or u) from STATION. 
Your result cannot contain duplicates.
*/

select distinct city
from station
where city like 'a%' or city like 'e%' or city like 'i%' or city like 'o%' or city like 'u%';

/*
 Query the list of CITY names ending with 
 vowels (a, e, i, o, u) from STATION. 
 Your result cannot contain duplicates.
 */

select distinct city
from station
where city like '%a' or city like '%e' or city like '%i' or city like '%o' or city like '%u';


/*
 Query the list of CITY names from STATION which 
 have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
 Your result cannot contain duplicates.
 */

select distinct city
from station
where (LEFT(city,1) IN ('a', 'e', 'i', 'o', 'u')
and RIGHT(city, 1) IN ('a', 'e', 'i', 'o', 'u'));

/*
 Query the list of CITY names from STATION that do not start with vowels. 
 Your result cannot contain duplicates.
 */

select distinct city
from station
where city not like 'a%' and city not like 'e%' and city not like 'i%' and city not like 'o%' and city not like 'u%';


/*
 Query the list of CITY names from STATION that do not end with vowels. 
 Your result cannot contain duplicates.
 */

select DISTINCT city
from station
where city not like '%a' and city not like '%e' and city not like '%i' and city not like '%o' and city not like '%u';
