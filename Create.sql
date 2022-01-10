CREATE TABLE brands (
 id SERIAL NOT NULL,
 name VARCHAR(64)
);

ALTER TABLE brands ADD CONSTRAINT PK_brands PRIMARY KEY (id);


CREATE TABLE genre (
 id SERIAL NOT NULL,
 genre VARCHAR(64) NOT NULL
);

ALTER TABLE genre ADD CONSTRAINT PK_genre PRIMARY KEY (id);


CREATE TABLE instruments (
 id SERIAL NOT NULL,
 name VARCHAR(64) NOT NULL
);

ALTER TABLE instruments ADD CONSTRAINT PK_instruments PRIMARY KEY (id);


CREATE TABLE person (
 id SERIAL NOT NULL,
 first_name VARCHAR(128) NOT NULL,
 last_name VARCHAR(128) NOT NULL,
 ssn VARCHAR(12) NOT NULL,
 email VARCHAR(128) NOT NULL,
 phone VARCHAR(32) NOT NULL,
 street VARCHAR(64) NOT NULL,
 zip VARCHAR(64) NOT NULL,
 town VARCHAR(64) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE rentable_instruments (
 id SERIAL NOT NULL,
 instrument_id INT NOT NULL,
 brand_id INT NOT NULL,
 fee INT NOT NULL
);

ALTER TABLE rentable_instruments ADD CONSTRAINT PK_rentable_instruments PRIMARY KEY (id);


CREATE TABLE skill_level (
 id SERIAL NOT NULL,
 level VARCHAR(32) NOT NULL
);

ALTER TABLE skill_level ADD CONSTRAINT PK_skill_level PRIMARY KEY (id);


CREATE TABLE student (
 id SERIAL NOT NULL,
 enrolled BIT(1) NOT NULL,
 parent_email VARCHAR(128) NOT NULL,
 parent_phone VARCHAR(32) NOT NULL,
 family_id INT NOT NULL,
 sibling_discount INT NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE type_of_lesson (
 id SERIAL NOT NULL,
 type VARCHAR(64) NOT NULL
);

ALTER TABLE type_of_lesson ADD CONSTRAINT PK_type_of_lesson PRIMARY KEY (id);


CREATE TABLE fees_and_salary (
 id SERIAL NOT NULL,
 skill_id INT,
 type_id INT NOT NULL,
 fee INT NOT NULL,
 salary INT NOT NULL
);

ALTER TABLE fees_and_salary ADD CONSTRAINT PK_fees_and_salary PRIMARY KEY (id);


CREATE TABLE instructor (
 id SERIAL NOT NULL,
 can_teach_ensemble BIT(1) NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE instrument_students (
 student_id INT NOT NULL,
 instrument_id INT NOT NULL,
 skill_id INT NOT NULL
);

ALTER TABLE instrument_students ADD CONSTRAINT PK_instrument_students PRIMARY KEY (student_id,instrument_id,skill_id);


CREATE TABLE instrument_instructor (
 instructor_id INT NOT NULL,
 instrument_id INT NOT NULL
);

ALTER TABLE instrument_instructor ADD CONSTRAINT PK_instrument_instructor PRIMARY KEY (instructor_id,instrument_id);


CREATE TABLE rented_instrument (
 id SERIAL NOT NULL,
 rentable_instrument_id INT NOT NULL,
 student_id INT NOT NULL,
 lease_start DATE NOT NULL,
 lease_end DATE NOT NULL
);

ALTER TABLE rented_instrument ADD CONSTRAINT PK_rented_instrument PRIMARY KEY (id);


CREATE TABLE schedule (
 id SERIAL NOT NULL,
 start_time TIME NOT NULL,
 end_time TIME NOT NULL,
 day DATE NOT NULL,
 instructor_id INT NOT NULL,
 fee_and_sal_id INT NOT NULL,
 instrument_id INT
);

ALTER TABLE schedule ADD CONSTRAINT PK_schedule PRIMARY KEY (id);


CREATE TABLE schedule_student (
 student_id INT NOT NULL,
 lesson_id INT NOT NULL
);

ALTER TABLE schedule_student ADD CONSTRAINT PK_schedule_student PRIMARY KEY (student_id,lesson_id);


CREATE TABLE group_lesson (
 lesson_id INT NOT NULL,
 min_students INT NOT NULL,
 max_students INT NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (lesson_id);


CREATE TABLE ensemble (
 lesson_id INT NOT NULL,
 genre_id INT NOT NULL
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (lesson_id,genre_id);


ALTER TABLE rentable_instruments ADD CONSTRAINT FK_rentable_instruments_0 FOREIGN KEY (instrument_id) REFERENCES instruments (id) ON DELETE CASCADE;
ALTER TABLE rentable_instruments ADD CONSTRAINT FK_rentable_instruments_1 FOREIGN KEY (brand_id) REFERENCES brands (id) ON DELETE CASCADE;


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (id) ON DELETE CASCADE;


ALTER TABLE fees_and_salary ADD CONSTRAINT FK_fees_and_salary_0 FOREIGN KEY (skill_id) REFERENCES skill_level (id) ON DELETE CASCADE;
ALTER TABLE fees_and_salary ADD CONSTRAINT FK_fees_and_salary_1 FOREIGN KEY (type_id) REFERENCES type_of_lesson (id) ON DELETE CASCADE;


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (id) ON DELETE CASCADE;


ALTER TABLE instrument_students ADD CONSTRAINT FK_instrument_students_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE CASCADE;
ALTER TABLE instrument_students ADD CONSTRAINT FK_instrument_students_1 FOREIGN KEY (instrument_id) REFERENCES instruments (id) ON DELETE CASCADE;
ALTER TABLE instrument_students ADD CONSTRAINT FK_instrument_students_2 FOREIGN KEY (skill_id) REFERENCES skill_level (id) ON DELETE CASCADE;


ALTER TABLE instrument_instructor ADD CONSTRAINT FK_instrument_instructor_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE CASCADE;
ALTER TABLE instrument_instructor ADD CONSTRAINT FK_instrument_instructor_1 FOREIGN KEY (instrument_id) REFERENCES instruments (id) ON DELETE CASCADE;


ALTER TABLE rented_instrument ADD CONSTRAINT FK_rented_instrument_0 FOREIGN KEY (rentable_instrument_id) REFERENCES rentable_instruments (id) ON DELETE CASCADE;
ALTER TABLE rented_instrument ADD CONSTRAINT FK_rented_instrument_1 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE CASCADE;


ALTER TABLE schedule ADD CONSTRAINT FK_schedule_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE CASCADE;
ALTER TABLE schedule ADD CONSTRAINT FK_schedule_1 FOREIGN KEY (fee_and_sal_id) REFERENCES fees_and_salary (id) ON DELETE CASCADE;
ALTER TABLE schedule ADD CONSTRAINT FK_schedule_2 FOREIGN KEY (instrument_id) REFERENCES instruments (id) ON DELETE CASCADE;


ALTER TABLE schedule_student ADD CONSTRAINT FK_schedule_student_0 FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE CASCADE;
ALTER TABLE schedule_student ADD CONSTRAINT FK_schedule_student_1 FOREIGN KEY (lesson_id) REFERENCES schedule (id) ON DELETE CASCADE;


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (lesson_id) REFERENCES schedule (id) ON DELETE CASCADE;


ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_0 FOREIGN KEY (lesson_id) REFERENCES group_lesson (lesson_id) ON DELETE CASCADE;
ALTER TABLE ensemble ADD CONSTRAINT FK_ensemble_1 FOREIGN KEY (genre_id) REFERENCES genre (id) ON DELETE CASCADE;