INSERT INTO person VALUES(DEFAULT, 'Petter', 'Hawk', 196901015555, 'MH@gmail.com', '112', 'Gata 12', '16322', 'Orten');
INSERT INTO person VALUES(DEFAULT, 'Joesph', 'Hawk', 196601015555, 'JH@gmail.com', '119', 'Gata 12', '16322', 'Orten');
INSERT INTO person VALUES(DEFAULT, 'George', 'Holland', 196001015555, 'GB@gmail.com', '113', 'Gata 12', '16322', 'Orten');
INSERT INTO person VALUES(DEFAULT, 'Peter', 'Parker', 196101015555, 'SP@gmail.com', '114', 'Gata 12', '16322', 'Orten');
INSERT INTO person VALUES(DEFAULT, 'Ryan', 'Ericsson', 196201015555, 'RC@gmail.com', '115', 'Gata 12', '16322', 'Orten');
INSERT INTO person VALUES(DEFAULT, 'Peter', 'Park', 196301015555, 'PP@gmail.com', '116', 'Gata 12', '16322', 'Orten');
INSERT INTO person VALUES(DEFAULT, 'Pelle', 'Jansson', 196401015555, 'PJ@gmail.com', '117', 'Gata 12', '16322', 'Orten');
INSERT INTO person VALUES(DEFAULT, 'John', 'Pettersson', 196501015555, 'JC@gmail.com', '118', 'Gata 12', '16322', 'Orten');

INSERT INTO instructor VALUES(DEFAULT, '1', 3);
INSERT INTO instructor VALUES(DEFAULT, '0', 4);
INSERT INTO instructor VALUES(DEFAULT, '1', 5);

INSERT INTO student VALUES(DEFAULT, '1', 'parent@gmail.com', '911', 1, 10, 1);
INSERT INTO student VALUES(DEFAULT, '1', 'parent@gmail.com', '911', 1, 10, 2);
INSERT INTO student VALUES(DEFAULT, '1', 'parent6@gmail.com', '911', 2, 0, 6);
INSERT INTO student VALUES(DEFAULT, '0', 'parent7@gmail.com', '911', 3, 0, 7);
INSERT INTO student VALUES(DEFAULT, '1', 'parent8@gmail.com', '911', 4, 0, 8);

INSERT INTO genre VALUES(DEFAULT, 'Pop');
INSERT INTO genre VALUES(DEFAULT, 'Rock');
INSERT INTO genre VALUES(DEFAULT, 'Jazz');
INSERT INTO genre VALUES(DEFAULT, 'Country');
INSERT INTO genre VALUES(DEFAULT, 'Electro');

INSERT INTO skill_level VALUES(DEFAULT, 'Advanced');
INSERT INTO skill_level VALUES(DEFAULT, 'Intermediate');
INSERT INTO skill_level VALUES(DEFAULT, 'Beginner');

INSERT INTO type_of_lesson VALUES(DEFAULT, 'Ensemble');
INSERT INTO type_of_lesson VALUES(DEFAULT, 'Group');
INSERT INTO type_of_lesson VALUES(DEFAULT, 'Individual');

INSERT INTO fees_and_salary VALUES(DEFAULT, 1, 2, 1000, 500);
INSERT INTO fees_and_salary VALUES(DEFAULT, 1, 3, 900, 550);
INSERT INTO fees_and_salary VALUES(DEFAULT, 2, 2, 900, 400);
INSERT INTO fees_and_salary VALUES(DEFAULT, 2, 3, 800, 450);
INSERT INTO fees_and_salary VALUES(DEFAULT, 3, 2, 800, 300);
INSERT INTO fees_and_salary VALUES(DEFAULT, 3, 3, 700, 350);
INSERT INTO fees_and_salary (id, type_id, fee, salary) VALUES(DEFAULT, 1, 700, 450);

INSERT INTO instruments VALUES(DEFAULT, 'Piano');
INSERT INTO instruments VALUES(DEFAULT, 'Guitar');
INSERT INTO instruments VALUES(DEFAULT, 'Drums');
INSERT INTO instruments VALUES(DEFAULT, 'Trumpet');
INSERT INTO instruments VALUES(DEFAULT, 'Banjo');
INSERT INTO instruments VALUES(DEFAULT, 'Ukelele');

INSERT INTO instrument_students VALUES(1, 1, 2);
INSERT INTO instrument_students VALUES(1, 2, 1);
INSERT INTO instrument_students VALUES(1, 3, 3);
INSERT INTO instrument_students VALUES(2, 1, 2);
INSERT INTO instrument_students VALUES(2, 2, 3);
INSERT INTO instrument_students VALUES(2, 3, 1);

INSERT INTO instrument_instructor VALUES(1, 1);
INSERT INTO instrument_instructor VALUES(1, 2);
INSERT INTO instrument_instructor VALUES(1, 3);
INSERT INTO instrument_instructor VALUES(2, 1);
INSERT INTO instrument_instructor VALUES(2, 2);
INSERT INTO instrument_instructor VALUES(2, 3);
INSERT INTO instrument_instructor VALUES(3, 2);
INSERT INTO instrument_instructor VALUES(3, 4);

INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-01-08', 1, 2, 1);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-01-08', 2, 4, 2);
INSERT INTO schedule VALUES(DEFAULT, '13:00', '15:00', '2022-01-08', 1, 6, 3);
INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '13:00', '15:00', '2022-01-08', 3, 7);
INSERT INTO group_lesson VALUES(4, 2, 5);
INSERT INTO ensemble VALUES(4, 2);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-01-09', 1, 1, 3);
INSERT INTO group_lesson VALUES(5, 2, 4);


INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-02-07', 1, 2, 2);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-02-07', 1, 2, 1);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-02-07', 2, 4, 2);
INSERT INTO schedule VALUES(DEFAULT, '13:00', '15:00', '2022-02-07', 1, 6, 3);
INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '13:00', '15:00', '2022-02-08', 3, 7);
INSERT INTO group_lesson VALUES(10, 2, 5);
INSERT INTO ensemble VALUES(10, 2);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-02-15', 1, 1, 3);
INSERT INTO group_lesson VALUES(11, 2, 4);

INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '13:00', '15:00', '2022-03-01', 1, 7);
INSERT INTO group_lesson VALUES(12, 2, 5);
INSERT INTO ensemble VALUES(12, 2);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-03-02', 1, 1, 3);
INSERT INTO group_lesson VALUES(13, 2, 4);


INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-09-15', 1, 1, 3);
INSERT INTO group_lesson VALUES(14, 2, 4);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-09-16', 1, 1, 3);
INSERT INTO group_lesson VALUES(15, 3, 7);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-09-17', 1, 1, 3);
INSERT INTO group_lesson VALUES(16, 4, 5);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-04-07', 1, 2, 3);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-05-07', 2, 2, 1);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-05-07', 3, 4, 4);

INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-06-07', 3, 2, 4);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-07-07', 2, 2, 1);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-08-07', 2, 4, 2);

INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-09-07', 1, 2, 2);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-10-07', 3, 2, 4);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-11-07', 3, 4, 2);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-12-07', 1, 2, 2);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-12-09', 1, 2, 2);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-12-10', 1, 2, 2);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-12-12', 1, 2, 2);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-12-14', 1, 2, 2);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-12-15', 1, 2, 2);
INSERT INTO schedule VALUES(DEFAULT, '13:00', '15:00', '2022-07-07', 1, 2, 1);
INSERT INTO schedule VALUES(DEFAULT, '13:00', '15:00', '2022-08-07', 2, 4, 2);

INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-02-15', 1, 1, 3);
INSERT INTO group_lesson VALUES(34, 2, 4);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-03-16', 1, 1, 3);
INSERT INTO group_lesson VALUES(35, 3, 7);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-04-17', 1, 1, 3);
INSERT INTO group_lesson VALUES(36, 4, 5);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-05-15', 1, 1, 3);
INSERT INTO group_lesson VALUES(37, 2, 4);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-06-16', 1, 1, 3);
INSERT INTO group_lesson VALUES(38, 3, 7);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-07-17', 1, 1, 3);
INSERT INTO group_lesson VALUES(39, 4, 5);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-08-15', 1, 1, 3);
INSERT INTO group_lesson VALUES(40, 2, 4);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-09-16', 1, 1, 3);
INSERT INTO group_lesson VALUES(41, 3, 7);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-10-17', 1, 1, 3);
INSERT INTO group_lesson VALUES(42, 4, 5);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-11-15', 1, 1, 3);
INSERT INTO group_lesson VALUES(43, 2, 4);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-12-16', 1, 1, 3);
INSERT INTO group_lesson VALUES(44, 3, 7);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-12-17', 1, 1, 3);
INSERT INTO group_lesson VALUES(45, 4, 5);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-12-15', 1, 1, 3);
INSERT INTO group_lesson VALUES(46, 2, 4);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-12-16', 1, 1, 3);
INSERT INTO group_lesson VALUES(47, 3, 7);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-12-17', 1, 1, 3);
INSERT INTO group_lesson VALUES(48, 4, 5);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-09-15', 1, 1, 3);
INSERT INTO group_lesson VALUES(49, 2, 4);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-08-16', 1, 1, 3);
INSERT INTO group_lesson VALUES(50, 3, 7);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-04-17', 1, 1, 3);
INSERT INTO group_lesson VALUES(51, 4, 5);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-04-15', 1, 1, 3);
INSERT INTO group_lesson VALUES(52, 2, 4);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-04-16', 1, 1, 3);
INSERT INTO group_lesson VALUES(53, 3, 7);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-05-17', 1, 1, 3);
INSERT INTO group_lesson VALUES(54, 4, 5);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-06-15', 1, 1, 3);
INSERT INTO group_lesson VALUES(55, 2, 4);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-06-16', 1, 1, 3);
INSERT INTO group_lesson VALUES(56, 3, 7);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-06-17', 1, 1, 3);
INSERT INTO group_lesson VALUES(57, 4, 5);
INSERT INTO schedule VALUES(DEFAULT, '10:00', '12:00', '2022-06-15', 1, 1, 3);
INSERT INTO group_lesson VALUES(58, 2, 4);


INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-01-18', 1, 7);
INSERT INTO group_lesson VALUES(59, 2, 3);
INSERT INTO ensemble VALUES(59, 2);
INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-01-17', 1, 7);
INSERT INTO group_lesson VALUES(60, 3, 4);
INSERT INTO ensemble VALUES(60, 3);
INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-01-19', 1, 7);
INSERT INTO group_lesson VALUES(61, 2, 5);
INSERT INTO ensemble VALUES(61, 4);
INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-01-20', 1, 7);
INSERT INTO group_lesson VALUES(62, 3, 4);
INSERT INTO ensemble VALUES(62, 5);


INSERT INTO schedule_student VALUES(1, 59);
INSERT INTO schedule_student VALUES(2, 59);
INSERT INTO schedule_student VALUES(3, 59);
INSERT INTO schedule_student VALUES(3, 60);
INSERT INTO schedule_student VALUES(5, 60);
INSERT INTO schedule_student VALUES(1, 60);
INSERT INTO schedule_student VALUES(2, 61);
INSERT INTO schedule_student VALUES(3, 61);
INSERT INTO schedule_student VALUES(1, 62);
INSERT INTO schedule_student VALUES(2, 62);

INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-09-1', 1, 7);
INSERT INTO group_lesson VALUES(63, 4, 5);
INSERT INTO ensemble VALUES(63, 2);
INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-09-15', 1, 7);
INSERT INTO group_lesson VALUES(64, 2, 4);
INSERT INTO ensemble VALUES(64, 2);
INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-09-16', 1, 7);
INSERT INTO group_lesson VALUES(65, 3, 7);
INSERT INTO ensemble VALUES(65, 2);
INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-09-17', 1, 7);
INSERT INTO group_lesson VALUES(66, 4, 5);
INSERT INTO ensemble VALUES(66, 2);
INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-09-15', 1, 7);
INSERT INTO group_lesson VALUES(67, 2, 4);
INSERT INTO ensemble VALUES(67, 2);
INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-09-16', 1, 7);
INSERT INTO group_lesson VALUES(68, 3, 7);
INSERT INTO ensemble VALUES(68, 2);
INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-09-17', 1, 7);
INSERT INTO group_lesson VALUES(69, 4, 5);
INSERT INTO ensemble VALUES(69, 2);
INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-09-15', 1, 7);
INSERT INTO group_lesson VALUES(70, 2, 4);
INSERT INTO ensemble VALUES(70, 2);
INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-09-16', 1, 7);
INSERT INTO group_lesson VALUES(71, 3, 7);
INSERT INTO ensemble VALUES(71, 2);
INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-09-17', 1, 7);
INSERT INTO group_lesson VALUES(72, 4, 5);
INSERT INTO ensemble VALUES(72, 2);


INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-01-11', 1, 7);
INSERT INTO group_lesson VALUES(73, 2, 3);
INSERT INTO ensemble VALUES(73, 2);
INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-01-12', 1, 7);
INSERT INTO group_lesson VALUES(74, 3, 4);
INSERT INTO ensemble VALUES(74, 3);
INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-01-13', 1, 7);
INSERT INTO group_lesson VALUES(75, 2, 5);
INSERT INTO ensemble VALUES(75, 4);
INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-01-14', 1, 7);
INSERT INTO group_lesson VALUES(76, 3, 4);
INSERT INTO ensemble VALUES(76, 5);


INSERT INTO schedule_student VALUES(1, 73);
INSERT INTO schedule_student VALUES(2, 73);
INSERT INTO schedule_student VALUES(3, 73);
INSERT INTO schedule_student VALUES(3, 74);
INSERT INTO schedule_student VALUES(5, 74);
INSERT INTO schedule_student VALUES(1, 74);
INSERT INTO schedule_student VALUES(2, 75);
INSERT INTO schedule_student VALUES(3, 75);
INSERT INTO schedule_student VALUES(1, 76);
INSERT INTO schedule_student VALUES(2, 76);


INSERT INTO schedule_student VALUES(1, 1);
INSERT INTO schedule_student VALUES(1, 2);
INSERT INTO schedule_student VALUES(3, 3);
INSERT INTO schedule_student VALUES(3, 4);
INSERT INTO schedule_student VALUES(3, 5);
INSERT INTO schedule_student VALUES(1, 6);
INSERT INTO schedule_student VALUES(1, 7);
INSERT INTO schedule_student VALUES(5, 8);
INSERT INTO schedule_student VALUES(1, 9);
INSERT INTO schedule_student VALUES(1, 10);
INSERT INTO schedule_student VALUES(2, 11);
INSERT INTO schedule_student VALUES(2, 12);
INSERT INTO schedule_student VALUES(2, 13);
INSERT INTO schedule_student VALUES(3, 14);
INSERT INTO schedule_student VALUES(5, 15);
INSERT INTO schedule_student VALUES(5, 16);
INSERT INTO schedule_student VALUES(4, 17);
INSERT INTO schedule_student VALUES(4, 18);
INSERT INTO schedule_student VALUES(4, 19);
INSERT INTO schedule_student VALUES(5, 20);
INSERT INTO schedule_student VALUES(1, 21);
INSERT INTO schedule_student VALUES(1, 22);
INSERT INTO schedule_student VALUES(3, 23);
INSERT INTO schedule_student VALUES(1, 24);
INSERT INTO schedule_student VALUES(2, 25);
INSERT INTO schedule_student VALUES(1, 26);
INSERT INTO schedule_student VALUES(3, 27);
INSERT INTO schedule_student VALUES(5, 28);
INSERT INTO schedule_student VALUES(4, 29);
INSERT INTO schedule_student VALUES(2, 30);
INSERT INTO schedule_student VALUES(1, 31);
INSERT INTO schedule_student VALUES(1, 32);
INSERT INTO schedule_student VALUES(1, 33);


INSERT INTO brands VALUES(DEFAULT, 'Yamaha');
INSERT INTO brands VALUES(DEFAULT, 'Akai');
INSERT INTO brands VALUES(DEFAULT, 'Arturia');
INSERT INTO brands VALUES(DEFAULT, 'Behringer');
INSERT INTO brands VALUES(DEFAULT, 'Chateau');

INSERT INTO rentable_instruments VALUES(DEFAULT, 1, 1, 200);
INSERT INTO rentable_instruments VALUES(DEFAULT, 1, 2, 80);
INSERT INTO rentable_instruments VALUES(DEFAULT, 1, 3, 130);
INSERT INTO rentable_instruments VALUES(DEFAULT, 2, 1, 100);
INSERT INTO rentable_instruments VALUES(DEFAULT, 2, 1, 150);
INSERT INTO rentable_instruments VALUES(DEFAULT, 2, 2, 200);
INSERT INTO rentable_instruments VALUES(DEFAULT, 3, 4, 180);
INSERT INTO rentable_instruments VALUES(DEFAULT, 3, 4, 150);
INSERT INTO rentable_instruments VALUES(DEFAULT, 3, 2, 190);
INSERT INTO rentable_instruments VALUES(DEFAULT, 4, 5, 210);
INSERT INTO rentable_instruments VALUES(DEFAULT, 4, 5, 230);
INSERT INTO rentable_instruments VALUES(DEFAULT, 4, 5, 250);

INSERT INTO rented_instrument VALUES(DEFAULT, 1, 1, '2022-01-01', '2022-06-01');
INSERT INTO rented_instrument VALUES(DEFAULT, 7, 3, '2022-01-01', '2022-06-01');
INSERT INTO rented_instrument VALUES(DEFAULT, 6, 3, '2021-01-01', '2021-06-01');
INSERT INTO rented_instrument VALUES(DEFAULT, 11, 5, '2022-01-01', '2022-06-01');
INSERT INTO rented_instrument VALUES(DEFAULT, 5, 1, '2021-01-01', '2021-06-01');


INSERT INTO schedule VALUES(DEFAULT, '17:00', '19:00', '2022-01-08', 2, 2, 1);


INSERT INTO schedule (id, start_time, end_time, day, instructor_id, fee_and_sal_id) VALUES(DEFAULT, '10:00', '12:00', '2022-01-19', 1, 7);
INSERT INTO group_lesson VALUES(78, 2, 3);
INSERT INTO ensemble VALUES(78, 2);


CREATE VIEW number_booked_students AS 
SELECT id, COUNT(student_id) AS booked_students 
FROM schedule
LEFT JOIN schedule_student ON schedule.id = schedule_student.lesson_id
GROUP BY id
ORDER BY id;
