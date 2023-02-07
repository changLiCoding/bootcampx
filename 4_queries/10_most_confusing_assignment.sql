SELECT assignments.id as id, assignments.name as name, assignments.day as day, assignments.chapter as chapter, COUNT(assistance_requests.*) as total_requests

FROM assistance_requests
JOIN assignments
ON assignments.id = assistance_requests.assignment_id
GROUP BY assignments.id
order by total_requests desc
