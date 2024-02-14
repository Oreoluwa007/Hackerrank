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


/*
 Query the list of CITY names from STATION that either do not 
 start with vowels or do not end with vowels. 
 Your result cannot contain duplicates.
 */

select distinct city
from station
where city not like 'a%' and city not like 'e%' and city not like 'i%' and city not like 'o%' and city not like 'u%'
or
city not like '%a' and city not like '%e' and city not like '%i' and city not like '%o' and city not like '%u';


/*
Query the list of CITY names from STATION that do not 
start with vowels and do not end with vowels. 
Your result cannot contain duplicates.
 */

select distinct city
from station
where (left(city, 1) not in ('a', 'e', 'i', 'o', 'u'))
and (right(city,1) not in ('a', 'e', 'i', 'o', 'u'));

/*
 Query the Name of any student in STUDENTS who scored higher than 75Marks. 
 Order your output by the last three characters of each name. If two or more 
 students both have names ending in the same last 
 three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
 */

select name from students
where marks > 75
order by (right(name, 3)), id;


/*
 Write a query that prints a list of employee names 
 (i.e.: the name attribute) from the Employee table in alphabetical order.
 */

select name from employee
order by name asc;

/*
 Write a query that prints a list of employee names (i.e.: the name attribute) 
 for employees in Employee having a salary greater than  per month 
 who have been employees for less than  months. 
 Sort your result by ascending employee_id.
 */

select name from employee
where salary > 2000
and months < 10
order by employee_id asc;

/*
 Write a query identifying the type of each record in the TRIANGLES table 
 using its three side lengths. Output one of the following statements for 
 each record in the table:

Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.
 */

select 
    case
        when a + b <= c or a + c <= b or b + c <= a then 'Not A Triangle'
        when a = b and b = c then 'Equilateral'
        when a = b or a = c or b = c then 'Isosceles'
        else 'Scalene'
    End as triangle_type
from triangles;


/*
1.
 Query an alphabetically ordered list of all names in OCCUPATIONS, immediately 
 followed by the first letter of each profession as a parenthetical (i.e.: enclosed
 in parentheses). For example: AnActorName(A), ADoctorName(D),
 AProfessorName(P), and ASingerName(S).

2.
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the 
occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation
 in OCCUPATIONS and [occupation] is the lowercase occupation name.
  If more than one Occupation has the same [occupation_count], they 
  should be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation.
 */

select concat(Name, '(', left(occupation, 1), ')')
as Name_Occupation
from Occupations
order by Name_Occupation;


select concat('There are a total of ', count(Occupation), ' ', lower(Occupation), 's.') 
as Occupation_Count
from Occupations
group by Occupation
order by Occupation_Count;


/*
 
 */




















