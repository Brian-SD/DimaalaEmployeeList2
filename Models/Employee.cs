using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DimaalaEmployeeExam.Models
{
    public class Employee
    {
        //public string mode { get; set; }
        public int id { get; set; }
        public string Firstname { get; set; }
        public string Middlename { get; set; }
        public string Lastname { get; set; }
        public string Birthdate { get; set; }
        public string Gender { get; set; }
        public string CivilStatus { get; set; }
        public string Nationality { get; set; }
        public string Position { get; set; }
        public string DateEmployed { get; set; }

    }
}