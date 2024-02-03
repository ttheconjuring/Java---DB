SELECT 
    COUNT(student_id) AS students_count,
    u.name AS university_name
FROM
    courses c
        JOIN
    universities u ON c.university_id = u.id
        JOIN
    students_courses sc ON c.id = sc.course_id
GROUP BY c.university_id
HAVING students_count >= 8
ORDER BY students_count DESC , university_name DESC;