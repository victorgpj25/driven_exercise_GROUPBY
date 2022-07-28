-- 1

SELECT COUNT("endDate") AS "currentExperiences" 
FROM experiences;


-- 2

SELECT "userId" AS id, COUNT(id) AS educations 
FROM educations 
GROUP BY "userId";


-- 3

SELECT u.name AS writer, COUNT(t.id) AS "testimonialCount" 
FROM testimonials t 
JOIN users u ON u.id = t."writerId" 
WHERE t."writerId" = 435 
GROUP BY writer;


-- 4

SELECT MAX(j.salary) AS "maximumSalary", r.name AS role
FROM jobs j
JOIN roles r ON r.id = j."roleId" 
WHERE j.active IS TRUE 
GROUP BY role 
ORDER BY "maximumSalary" ASC;


-- Bonus

SELECT s.name AS school, c.name AS course, COUNT(e.id) AS "studentsCount", e.status AS role 
FROM educations e 
JOIN schools s ON s.id = e."schoolId" 
JOIN courses c ON c.id = e."courseId" 
WHERE e.status IN ('ongoing', 'finished') 
GROUP BY school, course, role 
ORDER BY "studentsCount" DESC 
LIMIT 3;
