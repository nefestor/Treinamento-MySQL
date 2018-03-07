CREATE DATABASE BancoNovo;
USE BancoNovo;
    EXEC ('CREATE SCHEMA Persons');
        CREATE TABLE Persons.Users_Types
        (
        id_user_type INT IDENTITY NOT NULL PRIMARY KEY,
        name NVARCHAR(100) NOT NULL,
        removed INT NOT NULL
        )
        CREATE TABLE Persons.Users
        (
        id_user INT IDENTITY NOT NULL PRIMARY KEY,
        name NVARCHAR(100) NOT NULL,
        removed INT NOT NULL,
        id_user_type INT NOT NULL
        )
        CREATE TABLE Persons.Users_Logins
        (
        id_user_login INT IDENTITY NOT NULL PRIMARY KEY,
        date DATETIME NOT NULL,
        id_user INT NOT NULL
        )

    -- Foreign Key Persons.Users

    ALTER TABLE Persons.Users ADD CONSTRAINT fk_id_user_type
            FOREIGN KEY(id_user_type) REFERENCES Persons.Users_Types(id_user_type);

    -- Foreign Key Persons.Users_Logins

    ALTER TABLE Persons.Users_Logins ADD CONSTRAINT fk_id_user
            FOREIGN KEY(id_user) REFERENCES Persons.Users(id_user);

    EXEC ('CREATE SCHEMA Courses');
        CREATE TABLE Courses.Courses
        (
        id_course INT IDENTITY NOT NULL PRIMARY KEY,
        name NVARCHAR(100) NOT NULL,
        removed INT NOT NULL
        )
        CREATE TABLE Courses.Tutors
        (
        id_course_tutor INT IDENTITY NOT NULL PRIMARY KEY,
        id_course INT NOT NULL,
        id_user INT NOT NULL,
        removed INT NOT NULL
        )
    -- Foreign Key Classes.Tutors 

    ALTER TABLE Courses.Tutors ADD CONSTRAINT fk_id_course
            FOREIGN KEY(id_course) REFERENCES Courses.Courses(id_course);
    ALTER TABLE Courses.Tutors ADD CONSTRAINT fk_id_user
            FOREIGN KEY(id_user) REFERENCES Persons.Users(id_user);

    EXEC ('CREATE SCHEMA Classes');
        CREATE TABLE Classes.Courses_Classes_Students
        (
        id_course_class_student INT IDENTITY NOT NULL PRIMARY KEY,
        id_course_class INT NOT NULL,
        id_user INT NOT NULL,
        removed INT NOT NULL
        )
        CREATE TABLE Classes.Courses_Class_Tutors
        (
        id_courses_classes_tutors INT IDENTITY NOT NULL PRIMARY KEY,
        id_course_class INT NOT NULL,
        id_course_tutor INT NOT NULL,
        removed INT NOT NULL
        )
        CREATE TABLE Classes.Courses_Classes
        (
        id_course_class INT IDENTITY NOT NULL PRIMARY KEY,
        id_course INT NOT NULL,
        name NVARCHAR(100) NOT NULL,
        removed INT NOT NULL
        )
        CREATE TABLE Classes.Courses_Classes_Schedule
        (
        id_schedule INT IDENTITY NOT NULL PRIMARY KEY,
        id_course_class INT NOT NULL,
        date DATETIME NOT NULL,
        date_finished DATETIME NOT NULL,
        removed INT NOT NULL
        )
        CREATE TABLE Classes.Courses_Classes_Contents
        (
        id_courses_classes_contents INT IDENTITY NOT NULL PRIMARY KEY,
        id_course_class INT NOT NULL,
        description NVARCHAR(MAX) NOT NULL,
        removed INT NOT NULL
        )
    -- Foreign Key Classes.Courses_Classes_Students  

    ALTER TABLE Classes.Courses_Classes_Students ADD CONSTRAINT fk_id_course_class
            FOREIGN KEY(id_course_class) REFERENCES Classes.Courses_Classes(id_course_class);
    ALTER TABLE Classes.Courses_Classes_Students ADD CONSTRAINT fk_id_user
            FOREIGN KEY(id_user) REFERENCES Persons.Users(id_user);

    -- Foreign Key Classes.Courses_Classes_Tutors

    ALTER TABLE Classes.Courses_Class_Tutors ADD CONSTRAINT fk_id_course_class_tutors
            FOREIGN KEY(id_course_class) REFERENCES Classes.Courses_Classes(id_course_class);
    ALTER TABLE Classes.Courses_Class_Tutors ADD CONSTRAINT fk_id_course_tutor
            FOREIGN KEY(id_course_tutor) REFERENCES Courses.Tutors(id_course_tutor);

    -- Foreign Key Classes.Courses_Classes

    ALTER TABLE Classes.Courses_Classes ADD CONSTRAINT fk_id_course
            FOREIGN KEY(id_course) REFERENCES Courses.Courses(id_course);

    -- Foreign Key Classes.Courses_Classes_Schedule

    ALTER TABLE Classes.Courses_Classes_Schedule ADD CONSTRAINT fk_id_course_class_schedule
            FOREIGN KEY(id_course_class) REFERENCES Classes.Courses_Classes(id_course_class);

    -- Foreign Key Classes.Courses_Classes_Contents

    ALTER TABLE Classes.Courses_Classes_Contents ADD CONSTRAINT fk_id_course_class_contents
            FOREIGN KEY(id_course_class) REFERENCES Classes.Courses_Classes(id_course_class);

    EXEC ('CREATE SCHEMA Contents');
        CREATE TABLE Contents.Courses_Classes_Activities_Students
        (
        id_activity_classes_students INT IDENTITY NOT NULL PRIMARY KEY,
        id_activity INT NOT NULL,
        id_course_class_student INT NOT NULL,
        delivery_date DATETIME NOT NULL,
        removed INT NOT NULL
        )
        CREATE TABLE Contents.Assessements_Students
        (
        id_assessement_student INT IDENTITY NOT NULL PRIMARY KEY,
        id_course_class_student INT NOT NULL,
        id_assessement INT NOT NULL,
        note DECIMAL(5, 1) NOT NULL,
        removed INT NOT NULL
        )
        CREATE TABLE Contents.Courses_Classes_Activities
        (
        id_activity INT IDENTITY NOT NULL PRIMARY KEY,
        id_course_classe INT NOT NULL,
        description NVARCHAR(MAX) NOT NULL,
        scheduled_date DATETIME NOT NULL,
        removed INT NOT NULL
        )
        CREATE TABLE Contents.Courses_Classes_Assessements
        (
        id_assessement INT IDENTITY NOT NULL PRIMARY KEY,
        id_course_class INT NOT NULL,
        scheduled_date DATETIME NOT NULL,
        realization_date DATETIME,
        description NVARCHAR(MAX) NOT NULL,
        removed INT NOT NULL
        )

    -- Foreign Key Contents.Courses_Classes_Activities_Students

    ALTER TABLE Contents.Courses_Classes_Activities_Students ADD CONSTRAINT fk_id_activity
            FOREIGN KEY(id_activity) REFERENCES Contents.Courses_Classes_Activities(id_activity);
    ALTER TABLE Contents.Courses_Classes_Activities_Students ADD CONSTRAINT fk_id_course_class_student
            FOREIGN KEY(id_course_class_student) REFERENCES Classes.Courses_Classes_Students(id_course_class_student);

    -- Foreign Key Contents.Assessements_Students

    ALTER TABLE Contents.Assessements_Students ADD CONSTRAINT fk_id_course_class_student_assessemenets
            FOREIGN KEY (id_course_class_student) REFERENCES Classes.Courses_Classes_Students(id_course_class_student);
    ALTER TABLE Contents.Assessements_Students ADD CONSTRAINT fk_id_assessements
            FOREIGN KEY (id_assessement) REFERENCES Contents.Courses_Classes_Assessements(id_assessement);

    -- Foreign Key Contents.Courses_Classes_Activities

    ALTER TABLE Contents.Courses_Classes_Activities ADD CONSTRAINT fk_id_course_classe_activities
            FOREIGN KEY(id_course_classe) REFERENCES Classes.Courses_Classes(id_course_class);

    -- Foreign Key Contents.Courses_Classes_Assessements

    ALTER TABLE Contents.Courses_Classes_Assessements ADD CONSTRAINT fk_id_course_classe_assessements
            FOREIGN KEY(id_course_class) REFERENCES Classes.Courses_Classes(id_course_class);
