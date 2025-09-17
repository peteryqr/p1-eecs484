/* 

For View_User_Information
- Join users, current_city, hometown_city, educations (all on user_id)

For View_Are_Friends
- Friends table

For View_Photo_Information
- Join photos, albums on album_id

For View_Event_Information
- Join events, cities on city_id

For View_Tag_Information
- Just tag table

*/

CREATE VIEW View_User_Information 
AS
SELECT
    u.user_id,
    u.first_name, 
    u.last_name,
    u.year_of_birth,
    u.month_of_birth,
    u.day_of_birth,
    u.gender,
    cc.city_name AS current_city,
    cc.state_name AS current_state,
    cc.country_name AS current_country,
    hc.city_name AS hometown_city,
    hc.state_name AS hometown_state,
    hc.country_name AS hometown_country,
    p.institution AS institution_name,
    p.concentration AS program_concentration,
    p.degree AS program_degree,
    e.program_year
FROM Users u
LEFT JOIN User_Current_Cities ucc
    ON u.user_id = ucc.user_id
LEFT JOIN Cities cc
    ON ucc.current_city_id = cc.city_id
LEFT JOIN User_Hometown_Cities uhc
    ON u.user_id = uhc.user_id
LEFT JOIN Cities hc
    ON uhc.hometown_city_id = hc.city_id
LEFT JOIN Education e
    ON u.user_id = e.user_id
LEFT JOIN Programs p
    ON e.program_id = p.program_id;


CREATE VIEW View_Are_Friends(user1_id, user2_id) 
AS
SELECT user1_id, user2_id
FROM Friends;


CREATE VIEW View_Photo_Information
AS
SELECT
    p.photo_id,
    a.album_id, 
    a.album_owner_id AS owner_id,
    a.album_name,
    a.album_created_time,
    a.album_modified_time,
    a.album_link,
    a.album_visibility,
    a.cover_photo_id,
    p.photo_caption,
    p.photo_created_time,
    p.photo_modified_time, 
    p.photo_link
FROM Photos p
JOIN Albums a
    ON p.album_id = a.album_id;


CREATE VIEW View_Event_Information
AS
SELECT
    ue.event_id,
    ue.event_creator_id,
    ue.event_name,
    ue.event_tagline,
    ue.event_description,
    ue.event_host,
    ue.event_type,
    ue.event_subtype,
    ue.event_address,
    c.city_name AS event_city,
    c.state_name AS event_state,
    c.country_name AS event_country,
    ue.event_start_time,
    ue.event_end_time
FROM User_Events ue
JOIN Cities c
    ON ue.event_city_id = c.city_id;

CREATE VIEW View_Tag_Information
AS
SELECT
    tag_photo_id AS photo_id,
    tag_subject_id,
    tag_created_time,
    tag_x AS tag_x_coordinate,
    tag_y AS tag_y_coordinate
FROM Tags t