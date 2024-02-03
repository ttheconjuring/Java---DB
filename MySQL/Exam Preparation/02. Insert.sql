INSERT INTO courses (name, duration_hours, start_date, teacher_name, description, university_id)
SELECT CONCAT(teacher_name, ' course'), 
	LENGTH(name) / 10,
	DATE_ADD(start_date, INTERVAL 5 DAY), 
	REVERSE(teacher_name), 
	CONCAT('Course ', teacher_name, REVERSE(description)), 
	EXTRACT(DAY FROM start_date) FROM courses
WHERE id <= 5;