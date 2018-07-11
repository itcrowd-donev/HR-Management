using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HumanResources.Models.Members
{
    public class Employees
    {

        public int Id { get; set; }
        public string Name { get; set; }
        public string Position { get; set; }
        public int Age { get; set; }
        public string Office { get; set; }
        public double Salary { get; set; }
        public string StartDate { get; set; }
    }
}