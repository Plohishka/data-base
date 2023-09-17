
CREATE TABLE students (
    id serial PRIMARY KEY,
    first_name varchar(256) NOT NULL CHECK (first_name != ''),
    last_name varchar(256) NOT NULL CHECK (last_name != '')
);

CREATE TABLE groups (
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK (name != '')
);

ALTER TABLE students
ADD COLUMN group_id int REFERENCES groups(id);

CREATE TABLE faculties (
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK (name != '')
);

ALTER TABLE groups
ADD COLUMN faculty_id int REFERENCES faculties(id);

CREATE TABLE disciplines (
    id serial PRIMARY KEY,
    name varchar(256) NOT NULL CHECK (name != ''),
    teacher varchar(256) NOT NULL CHECK (name != '')
);

CREATE TABLE exams (
    student_id int REFERENCES students(id),
    discipline_id int REFERENCES disciplines(id),
    assessment int NOT NULL CHECK (assessment > 0),
    PRIMARY KEY (student_id, discipline_id)
);

CREATE TABLE disciplines_to_faculties (
    discipline_id int REFERENCES disciplines(id),
    faculty_id int REFERENCES faculties(id),
    PRIMARY KEY (discipline_id, faculty_id)
);

