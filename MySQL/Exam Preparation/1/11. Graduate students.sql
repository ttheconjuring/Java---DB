CREATE PROCEDURE udp_graduate_all_students_by_year(year_started INT)
BEGIN
	UPDATE students s
	JOIN students_courses sc ON s.id = sc.student_id
	JOIN courses c ON sc.course_id = c.id
	SET is_graduated = 1
	WHERE EXTRACT(YEAR FROM c.start_date) = year_started;
END



