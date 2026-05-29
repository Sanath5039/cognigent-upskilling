show tables;
create table Events(
event_id int auto_increment,
title varchar(200)  not null,
description text,
city varchar(100)  not null,
start_date datetime  not null,
end_date datetime  not null,
 status ENUM('upcoming', 'completed', 'cancelled')   NOT NULL,
 organizer_id int  ,
 constraint orgid_fk foreign key(organizer_id) references users(user_id),
 constraint eveid_pk primary key(event_id)
 );

CREATE TABLE Sessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,

    event_id INT,

    title VARCHAR(200) NOT NULL,

    speaker_name VARCHAR(100) NOT NULL,

    start_time DATETIME NOT NULL,

    end_time DATETIME NOT NULL,

    FOREIGN KEY (event_id)
    REFERENCES Events(event_id)
);

CREATE TABLE Registrations (
    registration_id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT,

    event_id INT,

    registration_date DATE NOT NULL,

    FOREIGN KEY (user_id)
    REFERENCES Users(user_id),

    FOREIGN KEY (event_id)
    REFERENCES Events(event_id)
);

CREATE TABLE Feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,

    user_id INT,

    event_id INT,

    rating INT CHECK (rating BETWEEN 1 AND 5),

    comments TEXT,

    feedback_date DATE NOT NULL,

    FOREIGN KEY (user_id)
    REFERENCES Users(user_id),

    FOREIGN KEY (event_id)
    REFERENCES Events(event_id)
);

CREATE TABLE Resources (
    resource_id INT AUTO_INCREMENT PRIMARY KEY,

    event_id INT,

    resource_type ENUM('pdf', 'image', 'link'),

    resource_url VARCHAR(255) NOT NULL,

    uploaded_at DATETIME NOT NULL,

    FOREIGN KEY (event_id)
    REFERENCES Events(event_id)
);