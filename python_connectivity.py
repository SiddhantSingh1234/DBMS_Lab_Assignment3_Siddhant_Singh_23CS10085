import psycopg2

conn = psycopg2.connect(
    dbname="23CS10085",
    user="23CS10085",
    password="23CS10085",
    host="10.5.18.102",
    port="5432"
)

cur = conn.cursor()

queries_dict = {
    "Query 1: Names of all “certificate” courses on the topic of “AI” of duration less than or equal six months.": 
"""SELECT DISTINCT c.name
FROM Courses c
JOIN CategorisedInto ci ON c.course_id = ci.course_id
JOIN Topics t ON ci.topic_id = t.topic_id
WHERE c.program_type = 'certificate'
    AND c.duration <= 6
    AND t.title = 'AI';""",

    "Query 2: Names of all “certificate” courses on the topic of “AI” of duration less than or equal six months that are offered in partnership with “IITKGP”": 
"""SELECT DISTINCT c.name
FROM Courses c
JOIN CategorisedInto ci ON c.course_id = ci.course_id
JOIN Topics t ON ci.topic_id = t.topic_id
JOIN InCollaboration ic ON c.course_id = ic.course_id
JOIN PartnerUniversities pu ON ic.university_id = pu.university_id
WHERE c.program_type = 'certificate'
    AND c.duration <= 6
    AND t.title = 'AI'
    AND pu.name = 'IITKGP';""",

    "Query 3: Names of all students having age less than 18 years or more than 60 years who have done the course named “GenAI”": 
"""SELECT DISTINCT s.name
FROM Students s
JOIN Enrolled e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE (s.age < 18 OR s.age > 60)
    AND c.name = 'GenAI';""",

    "Query 4: Names of all students who are not Indians and have done a course having the topic “AI” that was offered in partnership with “IITKGP”": 
"""SELECT DISTINCT s.name
FROM Students s
JOIN Enrolled e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN CategorisedInto ci ON c.course_id = ci.course_id
JOIN Topics t ON ci.topic_id = t.topic_id
JOIN InCollaboration ic ON c.course_id = ic.course_id
JOIN PartnerUniversities pu ON ic.university_id = pu.university_id
WHERE s.nationality <> 'India'
    AND t.title = 'AI'
    AND pu.name = 'IITKGP';""",

    "Query 5: Names of all countries from where a student has done a course instructed by “Andrew Ng”": 
"""SELECT DISTINCT s.nationality
FROM Students s
JOIN Enrolled e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN TaughtBy tb ON c.course_id = tb.course_id
JOIN Instructors i ON tb.instructor_id = i.instructor_id
WHERE i.name = 'Andrew Ng';""",

    "Query 6: Names of all instructors who have taught courses where at least one student was from India": 
"""SELECT DISTINCT i.name
FROM Instructors i
JOIN TaughtBy tb ON i.instructor_id = tb.instructor_id
JOIN Courses c ON tb.course_id = c.course_id
JOIN Enrolled e ON tb.course_id = e.course_id
JOIN Students s ON e.student_id = s.student_id
WHERE s.nationality = 'India';""",

    "Query 7: Name of courses such that at least one student who have taken this course has also taken the course named \"GenAI\"": 
"""SELECT DISTINCT c.name
FROM Courses c
JOIN Enrolled e1 ON c.course_id = e1.course_id
WHERE e1.student_id IN (
    SELECT e2.student_id
    FROM Enrolled e2
    JOIN Courses c2 ON e2.course_id = c2.course_id
    WHERE c2.name = 'GenAI'
);""",

    "Query 8: Name of all courses such that all the students who have taken this course has taken the course named “GenAI”": 
"""SELECT c1.name
FROM Courses c1
WHERE NOT EXISTS (
    SELECT *
    FROM Enrolled e1
    WHERE e1.course_id = c1.course_id
        AND e1.student_id NOT IN (
            SELECT e2.student_id
            FROM Enrolled e2
            JOIN Courses c2 ON e2.course_id = c2.course_id
            WHERE c2.name = 'GenAI'
        )
);""",

    "Query 9: Name of the most popular course (in terms of number of students) that is offered in partnership with “IITKGP”": 
"""SELECT c.name
FROM Courses c
JOIN InCollaboration ic ON c.course_id = ic.course_id
JOIN PartnerUniversities pu ON ic.university_id = pu.university_id
JOIN Enrolled e ON c.course_id = e.course_id
WHERE pu.name = 'IITKGP'
GROUP BY c.course_id, c.name
ORDER BY COUNT(e.student_id) DESC
LIMIT 1;""",

    "Query 10: Name of the Indian student who has got the highest average marks considering all course on the topic “AI”": 
"""SELECT s.name
FROM Students s
JOIN Enrolled e ON s.student_id = e.student_id
JOIN EvaluationData ed ON e.enrollment_id = ed.enrollment_id
JOIN Courses c ON e.course_id = c.course_id
JOIN CategorisedInto ci ON c.course_id = ci.course_id
JOIN Topics t ON ci.topic_id = t.topic_id
WHERE s.nationality = 'India'
    AND t.title = 'AI'
GROUP BY s.student_id, s.name
ORDER BY AVG(ed.total_score) DESC
LIMIT 1;"""
}

print("\n==========================================")
print("Results of Queries")
print("==========================================")

for title, sql in queries_dict.items():
    print("\n------------------------------------------")
    print(title)
    print("------------------------------------------")
    
    cur.execute(sql)
    rows = cur.fetchall()

    if len(rows) == 0:
        print("No results found.")
    else:
        counter = 0
        for row in rows:
            print(f" {(counter + 1)}. ", " | ".join(str(x) for x in row))
            counter = (counter + 1)
        print()
        print(f"Total records found: {len(rows)}")

print("\n==========================================")
print("All queries have been executed successfully.")
print("==========================================")

cur.close()
conn.close()
