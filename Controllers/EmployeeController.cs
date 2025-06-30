using DimaalaEmployeeExam.Models;
using System.Web.Http;

namespace DimaalaEmployeeExam.Controllers
{
    [RoutePrefix("api/employee")]
    public class EmployeeController : ApiController
    {
        private AppDbContext db = new AppDbContext();

        //ALl
        [HttpGet]
        [Route("")]
        public IHttpActionResult GetAll() => Ok(db.GetAllEmployees());

        //One
        [HttpGet]
        [Route("{id:int}")]
        public IHttpActionResult GetById(int id)
        {
            var emp = db.GetEmployeeById(id);
            if (emp == null)
                return NotFound();
            return Ok(emp);
        }

        //New
        [HttpPost]
        [Route("")]
        public IHttpActionResult Create(Employee emp)
        {
            db.AddEmployee(emp);
            return Ok("Employee added successfully.");
        }

        //Edit
        [HttpPut]
        [Route("{id:int}")]
        public IHttpActionResult Update(int id, Employee emp)
        {
            emp.id = id; // Note: must match your model casing
            db.UpdateEmployee(emp, id);
            return Ok("Employee updated.");
        }

        //Delete
        [HttpDelete]
        [Route("{id:int}")]
        public IHttpActionResult Delete(int id)
        {
            db.DeleteEmployee(id);
            return Ok("Employee deleted.");
        }
    }
}
