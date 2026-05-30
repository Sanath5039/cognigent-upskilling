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

-- 16
-- select * from users u 
-- join registrations r on r.user_id=u.user_id
-- where u.registration_date>=date_sub(current_date,interval 30 day)
-- and  r.registration_id is null;

-- 17
-- select speaker_name ,count(speaker_name) as total_sessions from sessions
-- group by speaker_name
-- having total_sessions>1;

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

-- 22
