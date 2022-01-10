--Number of lessons per month
SELECT 
COUNT(*) as Total,
COUNT(*) FILTER (WHERE fee_and_sal_id IN (SELECT id FROM fees_and_salary WHERE type_id ='1')) as Ensemble, 
COUNT(*) FILTER (WHERE fee_and_sal_id IN (SELECT id FROM fees_and_salary WHERE type_id ='2')) as Group , 
COUNT(*) FILTER (WHERE fee_and_sal_id IN (SELECT id FROM fees_and_salary WHERE type_id ='3')) as Individual 
FROM schedule WHERE EXTRACT(YEAR FROM day) = '2022' 
GROUP BY EXTRACT(MONTH FROM day);


-- Average number of lessons per month
SELECT 
COUNT(*) / 12 as Total,
COUNT(*) FILTER (WHERE fee_and_sal_id IN (SELECT id FROM fees_and_salary WHERE type_id ='1')) / 12 as Ensemble, 
COUNT(*) FILTER (WHERE fee_and_sal_id IN (SELECT id FROM fees_and_salary WHERE type_id ='2')) / 12 as Group, 
COUNT(*) FILTER (WHERE fee_and_sal_id IN (SELECT id FROM fees_and_salary WHERE type_id ='3')) / 12 as Individual 
FROM schedule WHERE EXTRACT(YEAR FROM day) = '2022';

-- Given more than specific number of lessons (currently 2)
SELECT person.first_name, person.last_name, COUNT(*) FILTER (WHERE EXTRACT(MONTH FROM day) = EXTRACT(MONTH FROM CURRENT_DATE)) as nbroflessons FROM schedule
INNER JOIN instructor ON  schedule.instructor_id = instructor.id 
INNER JOIN person ON instructor.person_id = person.id
GROUP BY schedule.instructor_id, person.first_name, person.last_name
HAVING COUNT(*) FILTER (WHERE EXTRACT(MONTH FROM day) = EXTRACT(MONTH FROM CURRENT_DATE)) > 2;

-- List next weeks ensemble
SELECT schedule.id, instructor_id, day, genre.genre, group_lesson.max_students, 
CASE WHEN (max_students - booked_students) < 1 THEN 'Fully Booked' 
WHEN (max_students - booked_students) = 1 THEN '1 Spot left' 
WHEN (max_students - booked_students) = 2 THEN '2 Spots left' 
ELSE 'Several Spots left' 
END as text 
FROM schedule 
INNER JOIN group_lesson ON schedule.id = group_lesson.lesson_id 
INNER JOIN ensemble ON schedule.id = ensemble.lesson_id 
INNER JOIN genre ON ensemble.genre_id = genre.id 
INNER JOIN number_booked_students ON schedule.id = number_booked_students.lesson_id 
WHERE EXTRACT(WEEK FROM schedule.day) = EXTRACT(WEEK FROM CURRENT_DATE + 7) ORDER BY genre.genre;
