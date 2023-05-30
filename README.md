# Capstone project - Dental Office

### About Project

<br>
The project is about a web application developed for Dental office. This application is developed on three different layers: frontend, backend and database layer.
Frontend is developed with TypeScript using Angular framework, HTML, CSS and Bootstrap.
Backend is developed with Java using Spring Boot framework. Database is developed with PostgreSQL using Spring Data framework and Flyway tool for versioning the database.

<br>

### Use Case

<br>

Potential patients or registered patients can visit this web application to schedule an appointment or to register themselves as a new patient. On the other side, the dentist and the other medical personnel can see the list of patients, what is done, on which tooth for each patient, and which medication they used. Basically, they can see the total record of each patient. They can see a list of appointments as well and they can modify or delete the data.

<br>

### AWS Infrastructure

<br>

- Amazon S3 bucket: Store the static content of the web application, basically the "dist" folder which contains the compiled and bundled version of frontend application ready for deployment. Also, the S3 bucket stores the JAR (Java Archive) file and this file is downloaded to the EC2 instances.
- EC2 instance: Host the JAR file. The web server for this application is Apache Tomcat and Spring Boot includes an embedded Tomcat server as a dependency.
- Database instance: PostgreSQL primary and replica database
- Application load balancer is used to distribute incoming network traffic across multiple EC2 instances
- Auto scaling group is used to automatically scale in (less) or scale out (more) EC2 instances based on configuration.
- Terraform: an open-source infrastructure as code tool used for managing AWS resources.
- Git is used for versioning project code which is hosted on GitHub repository.

<br>

![capstoneDiagramm](https://github.com/Dental-Office/Dental-Office-Infrastructure/blob/main/Documentation/Capstone_Project_Infrastructure.png)