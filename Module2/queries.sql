SELECT 
    event_id, 
    AVG(rating) AS avg_rating 
FROM Feedback 
GROUP BY event_id;
show tables;
show databases;
use users;
show tables;
SELECT 
    e.event_id,
    e.title,
    AVG(f.rating) AS avg_rating
FROM Events e
JOIN Feedback f ON e.event_id = f.event_id
GROUP BY e.event_id, e.title
HAVING AVG(f.rating) = (
    SELECT AVG(rating) AS max_avg
    FROM Feedback
    GROUP BY event_id
    ORDER BY max_avg DESC
    LIMIT 1
);
-- 10
--  select
--  r.event_id
--  from registrations r
--  where r.event_id not in (select f.event_id from feedback f);

  -- 11
SELECT 
    registration_date, 
    COUNT(user_id) AS new_user_count
FROM users
WHERE registration_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
GROUP BY registration_date
ORDER BY registration_date DESC;

 -- 12
 -- select e.event_id,e.title,count(s.session_id) as total_session from events e
--  join sessions s 
--  on e.event_id = s.event_id
--  group by s.event_id 
--  order by total_session desc
-- limit 1;

-- 13
-- select e.city,avg(f.rating)
-- from events e
-- left join feedback f on e.event_id=f.event_id
-- group by e.city;

-- 14
-- select e.event_id,e.title,count(f.event_id) as total_count from events e
--  left join registrations f on e.event_id=f.event_id
-- group by e.event_id
-- order by   total_count 
-- desc
-- limit 3;

-- 15
SELECT 
    s1.event_id,
    s1.session_id AS session_id_1,
    s1.title AS session_title_1,
    s2.session_id AS session_id_2,
    s2.title AS session_title_2,
    s1.start_time,
    s1.end_time
FROM sessions s1
INNER JOIN sessions s2 
    ON s1.event_id = s2.event_id 
    AND s1.session_id < s2.session_id
WHERE s1.start_time < s2.end_time 
  AND s1.end_time > s2.start_time;

-- 16
-- select * from users u 
-- join registrations r on r.user_id=u.user_id
-- where u.registration_date>=date_sub(current_date,interval 30 day)
-- and  r.registration_id is null;

-- 17
-- select speaker_name ,count(speaker_name) as total_sessions from sessions
-- group by speaker_name
-- having total_sessions>1;

-- 18
select e.event_id,e.title from events e
left join resources r on e.event_id=r.event_id
where resource_id is null;

 -- 19
--  select 
-- count(distinct r.registration_id) as total_registrations,
-- avg(f.rating) as average_feedback_rating
-- from events e
-- left join registrations r on r.event_id=e.event_id
-- left join feedback f on f.event_id=e.event_id
-- where e.status='completed'
-- group by e.event_id;
 
 -- 20
--  select
--  u.user_id
--  ,count(distinct u.user_id) as events_attended,count(distinct f.rating) as feedbacks_given 
--  from users u
--  left join registrations r on u.user_id=r.user_id
--  left join  feedback f on u.user_id=f.user_id
--  group by u.user_id;
 
 # 21
--  select 
--  u.user_id,
--  u.full_name,
--  count(f.feedback_id) as feedbacks_submitted
--  from users u
--  join feedback f 
--  on u.user_id=f.user_id
--  group by u.user_id,u.full_name
--  order by feedbacks_submitted desc
--  limit 5;

 
show databases;
use users;
show tables;
-- 22
select user_id from registrations
group by user_id,event_id
having count(registration_id)>1;

-- 23
SELECT 
    DATE_FORMAT(registration_date, '%Y-%m') AS registration_month, 
    COUNT(registration_id) AS total_registrations
FROM registrations
WHERE registration_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY DATE_FORMAT(registration_date, '%Y-%m')
ORDER BY registration_month ASC;

-- 24
select event_id,avg(timestampdiff(minute,start_time,end_time)) as avg_session_time
from sessions
group by event_id;

-- 25
select * from events e
left join sessions s on e.event_id=s.event_id
where session_id is null;








-- 1
select *  from events e
join registrations r
on r.event_id=e.event_id
join users u on u.user_id=r.user_id
where e.status="upcoming" and u.city=e.city
order by r.registration_date;

-- 2
select e.event_id,e.title, max(f.rating) as highest_rating from events e
join feedback f
on f.event_id=e.event_id
group by event_id,e.title
having count(f.feedback_id)>0
order by highest_rating desc
limit 1;

-- 3
SELECT u.user_id, u.full_name
FROM users u
LEFT JOIN registrations r 
    ON u.user_id = r.user_id 
    AND r.registration_date >= DATE_SUB('2025-07-30', INTERVAL 90 DAY)
WHERE r.registration_id IS NULL;

-- 4
select e.event_id, count(s.session_id) as session_count
from events e join sessions s on e.event_id=s.event_id
where Time(s.start_time)<'12:00:00' and time(s.end_time)>'10:00:00'
group by e.event_id;

-- 5
select e.city, count(distinct r.user_id) as total_registrations
from events e
left join registrations r on e.event_id=r.event_id
group  by e.city
order by total_registrations desc;

-- 6
select e.event_id,e.title,count(r.resource_id) as total_resources
from events e join resources r on e.event_id=r.event_id
group by resource_id;

-- 7
select u.user_id,u.full_name,f.rating,f.event_id,f.comments
from users u join feedback f on u.user_id=f.user_id
where f.rating<=4;

-- 8
select e.event_id,e.title,e.status,count(s.session_id) as session_count
from events e join sessions s
on e.event_id=s.event_id
where e.status='upcoming'
group by e.event_id,e.title;

-- 9
SELECT 
    u.user_id AS organizer_id,
    u.full_name AS organizer_name,
    e.status AS event_status,
    COUNT(e.event_id) AS total_events
FROM users u
INNER JOIN events e ON u.user_id = e.organizer_id
GROUP BY u.user_id, u.full_name, e.status
ORDER BY organizer_name ASC, total_events DESC;