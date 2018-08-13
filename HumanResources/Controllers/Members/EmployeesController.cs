using HumanResources.Models.Members;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HumanResources.Controllers.Members
{
    public class EmployeesController : Controller
    {

        public ActionResult Index()
        {
            Session["Employees"] = EmployeesData();

            var employeesList = Session["Employees"] as List<Employees>;

            return View();
        }


        public ActionResult List()
        {
            var employees = EmployeesData();
            return Json(employees, JsonRequestBehavior.AllowGet);
        }


        public ActionResult Get(int Id)
        {
            var employees = Session["Employees"] as List<Employees>;
            var employee = employees.Where(x => x.Id == Id).ToList();

            return Json(employee, JsonRequestBehavior.AllowGet);
        }


        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Employees Employee)
        {
            var employeesList = Session["Employees"] as List<Employees>;

            var emp = new Employees();
            emp.Id = employeesList.LastOrDefault().Id + 1;
            emp.Name = Employee.Name;
            emp.Position = Employee.Position;
            emp.Office = Employee.Office;
            emp.Age = Employee.Age;
            emp.Salary = Employee.Salary;
            emp.StartDate = Employee.StartDate;

            employeesList.Add(emp);
            Session["Employees"] = employeesList;

            //return Json(emp.Id, JsonRequestBehavior.AllowGet);      //Comment this
            return RedirectToAction("Index"); //Index instead of Create
        }


        public ActionResult Edit(int id)
        {
            return View();
        }

        [HttpPost]
        public ActionResult Edit(Employees Employee)
        {
            var employees = Session["Employees"] as List<Employees>;


            var emp = new Employees();

            emp.Id = Employee.Id;
            emp.Name = Employee.Name;
            emp.Position = Employee.Position;
            emp.Office = Employee.Office;
            emp.Age = Employee.Age;
            emp.Salary = Employee.Salary;
            emp.StartDate = Employee.StartDate;

            employees.RemoveAll(x => x.Id == Employee.Id);
            employees.Add(emp);
            Session["Employees"] = employees;

            //return Json(emp.Id, JsonRequestBehavior.AllowGet);
            return RedirectToAction("Index");
        }


        public ActionResult Delete(int Id)
        {
            var employees = Session["Employees"] as List<Employees>;
            var employee = employees.RemoveAll(x => x.Id == Id);

            //return Json(employees, JsonRequestBehavior.AllowGet);
            return RedirectToAction("Index");
        }


        public List<Employees> EmployeesData()
        {
            var employees = new List<Employees>();

            var emp = new Employees();
            emp.Id = 0;
            emp.Name = "Marjan Donev";
            emp.Position = ".NET Developer";
            emp.Age = 32;
            emp.Office = "ITCrowd 1th Floor";
            emp.Salary = 0;
            emp.StartDate = "01/06/2017";

            var emp2 = new Employees();
            emp2.Id = 1;
            emp2.Name = "Blazo Petkovski";
            emp2.Age = 24;
            emp2.Position = "PHP Developer";
            emp2.Office = "ITCrowd 1th Floor";
            emp2.Salary = 0;
            emp2.StartDate = "01/08/2017";

            var emp3 = new Employees();
            emp3.Id = 2;
            emp3.Name = "Mario Sazdovski";
            emp3.Age = 23;
            emp3.Position = ".NET Developer";
            emp3.Office = "ITCrowd 1th Floor";
            emp3.Salary = 0;
            emp3.StartDate = "01/03/2018";

            var emp4 = new Employees();
            emp4.Id = 3;
            emp4.Name = "Krste Mijalkovski";
            emp4.Age = 29;
            emp4.Position = "Front-End Developer";
            emp4.Office = "ITCrowd 1th Floor";
            emp4.Salary = 0;
            emp4.StartDate = "01/11/2017"; 

            var emp5 = new Employees();
            emp5.Id = 4;
            emp5.Name = "Marija Mitrova";
            emp5.Position = ".NET Developer";
            emp5.Age = 22;
            emp5.Office = "ITCrowd 1th Floor";
            emp5.Salary = 0;
            emp5.StartDate = "01/02/2018"; 

            var emp6 = new Employees();
            emp6.Id = 5;
            emp6.Name = "Goran Pereski";
            emp6.Age = 38;
            emp6.Position = "PHP Developer";
            emp6.Office = "ITCrowd 1th Floor";
            emp6.Salary = 0;
            emp6.StartDate = "01/06/2017";

            var emp7 = new Employees();
            emp7.Id = 6;
            emp7.Name = "Risto Andov";
            emp7.Age = 25;
            emp7.Position = ".NET Developer";
            emp7.Office = "ITCrowd 1th Floor";
            emp7.Salary = 0;
            emp7.StartDate = "01/06/2017";

            var emp8 = new Employees();
            emp8.Id = 7;
            emp8.Age = 31;
            emp8.Name = "Valerija Josifova";
            emp8.Position = "QA";
            emp8.Office = "ITCrowd 1th Floor";
            emp8.Salary = 0;
            emp8.StartDate = "01/09/2017";

            employees.Add(emp);
            employees.Add(emp2);
            employees.Add(emp3);
            employees.Add(emp4);
            employees.Add(emp5);
            employees.Add(emp6);
            employees.Add(emp7);
            employees.Add(emp8);

            return employees;
        }
    }
}