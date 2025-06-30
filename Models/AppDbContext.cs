using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;

namespace DimaalaEmployeeExam.Models
{
    public class AppDbContext : DbContext
    {
        public AppDbContext() : base("DefaultConnection")
        {
            Database.SetInitializer<AppDbContext>(null);
        }

        public DbSet<Employee> Employees { get; set; }

        // EMPLOYEE LIST
        public List<Employee> GetAllEmployees() =>
            this.Database.SqlQuery<Employee>(
                "EXEC selectEmployee @mode, @id",
                new SqlParameter("@mode", "showAll"),
                new SqlParameter("@id", DBNull.Value)
            ).ToList();

        // GET EMPLOYEE
        public Employee GetEmployeeById(int id) =>
            this.Database.SqlQuery<Employee>(
                "EXEC selectEmployee @mode, @id",
                new SqlParameter("@mode", "getEmployee"),
                new SqlParameter("@id", id)
            ).FirstOrDefault();

        // ADD
        public void AddEmployee(Employee emp)
        {
            this.Database.ExecuteSqlCommand("EXEC cudEmployee @mode, @id, @firstname, @middlename, @lastname, @birthdate, @gender, @civilstatus, @nationality, @position",
                new SqlParameter("@mode", "addEmployee"),
                new SqlParameter("@id", DBNull.Value), 
                new SqlParameter("@firstname", emp.Firstname),
                new SqlParameter("@middlename", emp.Middlename ?? ""),
                new SqlParameter("@lastname", emp.Lastname),
                new SqlParameter("@birthdate", emp.Birthdate),
                new SqlParameter("@gender", emp.Gender),
                new SqlParameter("@civilstatus", emp.CivilStatus ?? ""),
                new SqlParameter("@nationality", emp.Nationality ?? ""),
                new SqlParameter("@position", emp.Position));
        }


        // UPDATE
        public void UpdateEmployee(Employee emp, int id)
        {
            this.Database.ExecuteSqlCommand(
                "EXEC cudEmployee @mode, @id, @firstname, @middlename, @lastname, @birthdate, @gender, @civilstatus, @nationality, @position",
                new SqlParameter("@mode", "updateEmployee"),
                new SqlParameter("@id", id),
                new SqlParameter("@firstname", emp.Firstname),
                new SqlParameter("@middlename", emp.Middlename),
                new SqlParameter("@lastname", emp.Lastname),
                new SqlParameter("@birthdate", emp.Birthdate),
                new SqlParameter("@gender", emp.Gender),
                new SqlParameter("@civilstatus", emp.CivilStatus),
                new SqlParameter("@nationality", emp.Nationality),
                new SqlParameter("@position", emp.Position)
            );
        }

        // DELETE
        public void DeleteEmployee(int id)
        {
            this.Database.ExecuteSqlCommand(
                "EXEC cudEmployee @mode, @id, @firstname, @middlename, @lastname, @birthdate, @gender, @civilstatus, @nationality, @position",
                new SqlParameter("@mode", "deleteEmployee"),
                new SqlParameter("@id", id),
                new SqlParameter("@firstname", DBNull.Value),
                new SqlParameter("@middlename", DBNull.Value),
                new SqlParameter("@lastname", DBNull.Value),
                new SqlParameter("@birthdate", DBNull.Value),
                new SqlParameter("@gender", DBNull.Value),
                new SqlParameter("@civilstatus", DBNull.Value),
                new SqlParameter("@nationality", DBNull.Value),
                new SqlParameter("@position", DBNull.Value)
            );
        }
    }
}
