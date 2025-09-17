SELECT * FROM project1.Public_User_Information
MINUS SELECT * FROM View_User_Information;

SELECT * FROM View_User_Information
MINUS SELECT * FROM project1.Public_User_Information;

SELECT * FROM project1.Public_Photo_Information
MINUS SELECT * FROM View_Photo_Information;

SELECT * FROM View_Photo_Information
MINUS SELECT * FROM project1.Public_Photo_Information;

SELECT * FROM project1.Public_Event_Information
MINUS SELECT * FROM View_Event_Information;

SELECT * FROM View_Event_Information
MINUS SELECT * FROM project1.Public_Event_Information;

SELECT * FROM project1.Public_Tag_Information
MINUS SELECT * FROM View_Tag_Information;

SELECT * FROM View_Tag_Information
MINUS SELECT * FROM project1.Public_Tag_Information;

SELECT LEAST(user1_id, user2_id),  GREATEST(user1_id, user2_id)
FROM project1.Public_Are_Friends
MINUS SELECT LEAST(user1_id, user2_id),  GREATEST(user1_id, user2_id)
FROM View_Are_Friends;

SELECT LEAST(user1_id, user2_id),  GREATEST(user1_id, user2_id)
FROM View_Are_Friends
MINUS SELECT LEAST(user1_id, user2_id),  GREATEST(user1_id, user2_id)
FROM project1.Public_Are_Friends;