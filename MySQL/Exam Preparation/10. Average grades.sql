CREATE FUNCTION udf_average_alumni_grade_by_course_name(course_name VARCHAR(60)) RETURNS DECIMAL (5,2)
DETERMINISTIC
BEGIN
	DECLARE average_grade DECIMAL(5,2);
    SET average_grade := (
	SELECT FORMAT(AVG(grade), 2) FROM students_courses sc
	JOIN students s ON sc.student_id = s.id
	JOIN courses c ON sc.course_id = c.id
	WHERE s.is_graduated = 1 AND c.name = course_name);
    RETURN average_grade;
END




