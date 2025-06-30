# Employee List Web Application

A simple ASP.NET Web Forms application with a Web API backend for managing employees using SQL Server and stored procedures.

---

## Features

- View a list of employees
- Add a new employee
- View detailed employee info in a modal
- Edit employee data
- Delete employee
- Backend powered by ASP.NET Web API with stored procedures
- Bootstrap modals for user-friendly UI

---

## Tech Stack

- **Frontend:** ASP.NET Web Forms (ASPX), Bootstrap 5, JavaScript (Fetch API)
- **Backend:** ASP.NET Web API (C#)
- **Database:** Microsoft SQL Server (MSSQL)
- **Data Access:** Entity Framework with stored procedure execution

---

## Folder Structure

DimaalaEmployeeExam/
│
├── Controllers/
│ └── EmployeeController.cs
│
├── Models/
│ └── Employee.cs
│ └── AppDbContext.cs
│
├── Scripts/
│ └── employee.js
│
├── Content/
│ └── HomePage.aspx
│ └── HomePage.aspx.cs
│
├── App_Data/
│ └── (Database if included)
│
└── Web.config


---

## How to Run Locally

1. **Clone the repository:**

   ```bash
   git clone https://github.com/your-username/employee-list-webapp.git
   cd employee-list-webapp

2.**Open the solution in Visual Studio.**

3. **Configure your database connection string in Web.config under:**

   <connectionStrings>
     <add name="DefaultConnection" connectionString="Data Source=.;Initial Catalog=EmployeeList;Integrated Security=True" providerName="System.Data.SqlClient" />
   </connectionStrings>

4. **Create the SQL Database "EmployeeList" in SQL Server Management Studio (SSMS).**

5. **Open the "EmployeeList.sql" and Run it to MSSql.**
  
6. **Build and run the project in Visual Studio (Ctrl + F5).**
