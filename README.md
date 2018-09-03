# PHP_MySQL_LionDesk
Assignment - Online application written in PHP with a MySQL database to book hotdesks in an office

HDSD – CA - Assignment 3 – 2017-2018 - Caroline Bidet

Overall description of the context where the database will be used
 
Case: A multinational company, with about 6,000 employees worldwide and multiple offices around the world.
This database will be used as part of the booking system in the Dublin office, to book hotdesks for a day.
In the Dublin office, we imagine that most employees work from the office and they are assigned a desk permanently. The office has also a limited number of hotdesks, for the use of employees who work from home and come to the office once or twice a week, or for company employees visiting from other company offices.  
 
The company has 3 floors (ground, 3rd, and 4th floors). The employee headcount has decreased and might continue to decrease in coming years. The office manager would like to have the option to look at reducing the local costs by sub-letting 1 or 2 other floors out of 3. Being able to run reports on the hotdesk usage will help decide how many hotdesks are really needed, and will help the redesign of the office to a small space if needed.
 
Design Statement that clearly explains the problem/s that will be addressed. 
 
The database and the UI which connects to it will replace the spreadsheet that is in use at the moment.
It allows the employees to book a hotdesk for a day. The system will be accessible online without having to access a specific folder on the intranet. This is just a prototype so I use fake logins here, but the idea would be to link the system to the Active Directory.
•	Any normal user can book a hotdesk for any desired date; they can also have a view of their existing bookings, and cancel them.
•	A feature that I did not implement: For version 2, they can use their saved preference of desk, and that allows them to book it in one go if it's free at the selected date. This explains the "preferred hotdesk" feature in the database.
•	Any superuser of the database can access a dashboard showing: total number of hotdesks, % in use today (current date), % used in the current year year-to-date (YTD), the desk the most booked, the floor repartition of hotdesk usage, and 5 top users (= who have made the most bookings).

Entity Diagrams
 
There are 3 entities: employee, hotdesk, and role.
 Employee
Employee ID *
Email Address
Password
 
Hotdesk
Hotdesk ID *
Floor Location
Picture
 
Role
Role Name *
Permission

Relationship matrix
 
Employee	Hotdesk	Role
Employee	0	3, 2	3
Hotdesk	3, 2	0	0
Role	3	0	0
 
An employee books a hotdesk. Zero or Many employees can book zero or many hotdeks.
An employee prefers a hotdesk. Zero or many employees can prefer only zero or one hotdesk each; zero or one hotdesk can be preferred by zero, one, or many employees.
An employee has a role. Zero or many employees can have one or many roles.
Entity-Relationship Diagram
 
Assumptions
 
•	We have 11 hotdesks in total. 6 are on the ground floor, 3 on the 3rd floor, and 2 on the 4th floor.
The desks' IDs are related to the floor they are located on, their row in the room, and their place in the row.
Therefore, the desks' IDs are: Ground floor: GA1, GA2, GB1, GB2, GB3, GC1; 3rd floor: 3A1, 3B1, 3B2; 4th floor: 4A1, 4A2
•	The floor location of the hotdesk means on which floor it is. There are 3 floors: ground floor (0), third floor (3), and fourth floor (4).
•	An employee is allowed to book more than 1 hotdesk per day (e.g. a manager books 3 desks for a visiting team).
•	How roles function for this database and application:
•	Each employee can have several roles, but they need to have at least 1 at a time. 
•	There are 2 roles: user, and superuser.
•	The user can only access the UI to book a hotdesk, and has only limited permissions to the database.
•	The superuser role has cumulative rights, i.e. the same access rights as a user, but they can also access to the dashboard UI. They have full permissions to the database.
•	The employee’s email is their username when they login.
 
Tables
 
Database name: liondesk1
Tables: 
employees
hotdesks
bookings
roles
employee_roles
 
Permissions
The role superuser has all permission on liondesk1 database. The username is superuser and the password is liondeskadmin.
 
The role "user" has only specific permissions on liondesk1 database. The username is user and the password is basicuser;
Permissions are: all tables - read permission; bookings table: read, delete, insert.
 
Indexes
employees: email_index
bookings: employee_index
employee_roles: employee_index
 
In the article "When to use indexes in mysql database", the author advises that Indexes are best used on columns that are frequently used in where clauses, and in any kind of sorting, such as "order by". He also advises not to use them on tables where there are not many rows, or on data point which might change often, not to be affected by the maintenance time it takes to update the indexes.
This is why I've added the following indexes or avoided to create some indexes.
On the table Employees, I have created a unique index on "email" because this field will be searched on often when a user login (to authenticate them); 
However on the same table, I did not create an index on "password" though it will be searched as often as "email", because password might change often (for example, in my office, we are forced to change our password at regular intervals. For integration purposes, I would like this system ultimately to work with the corpnet login we have, which is used to access most of our systems).
On the table bookings, I have created a non-unique index on "employee" as this field will be searched very often in where clause (insert, delete commands, and select command to show a user's current bookings). However, though "date" will also be searched often in the where clause in insert and delete commands and in the select command to display a user's bookings (order by date), as dates are going to change very often, I have not added any index on this field.
On the table employee_roles, I've added a non-unique index on "employee".
There are no indexes on the other 2 tables (hotdesks, roles) as their number of rows is small and unlikely to grow much. There's no value in having indexes in this case.
 
About the dummy data
 
It was generated with fakeroo.com.
In the bookings table, dates range from Tuesday 4th April 2018 till end of June 2018; there are 74 bookings.
There are 163 employees. Only 4 superusers, all the rest (out of 163) are users. The superusers are:
331915	'Leela.Emmatt@xxxx.com'	superuser
946730	'Elizabet.Nutley@xxxx.com'	superuser
404035	'Alisa.Scamwell@xxxx.com'	superuser
438551	'Filip.Figin@xxxx.com'	superuser



