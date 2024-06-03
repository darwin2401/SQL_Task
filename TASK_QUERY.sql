--TASK 1 : Creating a new table using select query
--Problem Statement : Create a table 'NEW_INFO' out of 'info' using select query.

create table NEW_INFO
as
select language,production_company,censorship from info

select * from NEW_INFO


------------------------------------------------------------

--TASK 2: Joining 3 tables
--Problem Statement : Join tables 'movie' and 'technicalities' and 'info' together

select * from  movie as M
inner join technicalities as T
on T.movie_id = M.movie_id
inner join info as I
on M.movie_id = I.movie_id


-------------------------------------------------------------

--TASK 3: Joining tables with 'where'
--Problem Statement : Join tables 'movie' and 'technicalities' alomg with where condition.

select * from movie as M
inner join technicalities as T
on M.movie_id = T.movie_id
where popularity between 7 and 8


--------------------------------------------------------------

--TASK 4: USING having, group by, order by
--Problem Statement : To show a use of having,group by and order by in 'technicalities' table
--where runtime is between 140 and 150.

select runtime , keywords from technicalities
group by runtime , keywords
HAVING runtime between 140 and 150
order by runtime


---------------------------------------

-- Task 5 : Join tables and execute 'having' and 'group by' function together
--Problem Statement : Join table info and technicalities with a condition where language= 'French'.

select language , censorship from info AS I
 INNER JOIN technicalities AS T
 on T.movie_id = I.movie_id
 group by language , censorship 
 having language = 'French'
 
 
 
------------------------------------------------------------------------


-- Task 6 : WINDOW Function (ROW_NUMBER)
-- Problem Statement : Calculate no. of rows of distinct 'language'.


select language , ROW_NUMBER() 
over (
      Partition by language
      ) 
from info


--WINDOW Function (RANK)
-- Problem Statement : Give rank to distict 'genre' whose budget is BETWEEN 40 lakhs AND 2 Crores.
select budget , genres , RANK()
over ( Partition by budget
       order by budget ) from movie
 where budget BETWEEN 4000000 AND 20000000



-------------------------------------------------------------------------------

-- TASK 7: SUBQUERY
-- Problem Statment : Give the details of the movies whose popularity is between 8.5 and 9.5 and budget over 2 Crores.
select * from movie where movie_id 
	IN ( select movie_id from movie where popularity Between 8.5 And 9.5
	     AND
	     budget > 20000000
	   ) 
Order by popularity DESC



-- Verify the movie details of TASK 7 here 
select title, popularity, budget from movie where popularity Between 8.5 And 9.5
	     AND
	     budget > 20000000


----------------------------------------------------------------------------









