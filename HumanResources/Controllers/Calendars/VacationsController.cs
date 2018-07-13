using HumanResources.Models.Calendars;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web.Mvc;

namespace HumanResources.Controllers.Calendars
{
    public class VacationsController : Controller
    {

        public ActionResult Index()
        {
            var vacationsList = VacationStaticData();
            Session["Vacations"] = vacationsList as List<Vacations>;

            return View();
        }

        #region CRUD
        
        public ActionResult List()
        {
            CultureInfo iv = CultureInfo.InvariantCulture;

            var vacationsList = Session["Vacations"] as List<Vacations>;
            return Json(vacationsList, JsonRequestBehavior.AllowGet);
        }


        public ActionResult Get(int id)
        {
            var vacationsList = Session["Vacations"] as List<Vacations>;
            var vacation = vacationsList.Where(x => x.id == id);

            return Json(vacation, JsonRequestBehavior.AllowGet);
        }


        public ActionResult Save(string id, string name, string description, string startDate, string endDate)
        {
            var Id = Convert.ToInt32(id);
            var vacationsList = Session["Vacations"] as List<Vacations>;

            var exist = vacationsList.Any(x => x.id == Id);

            var vacation = new Vacations();
            vacation.id = Id;
            vacation.name = name;
            vacation.description = description;
            vacation.startDate = startDate;
            vacation.endDate = endDate;

            if (exist)
                vacationsList.RemoveAll(x => x.id == Id);

            vacationsList.Add(vacation);
            Session["Vacations"] = vacationsList;


            return Json(vacation.id, JsonRequestBehavior.AllowGet);
        }


        public ActionResult Delete(int id)
        {
            var vacationsList = Session["Vacations"] as List<Vacations>;
            var vacation = vacationsList.RemoveAll(x => x.id == id);

            return Json(vacationsList, JsonRequestBehavior.AllowGet);
        }


        public List<Vacations> VacationStaticData()
        {
            CultureInfo iv = CultureInfo.InvariantCulture;

            var vacations = new List<Vacations>();


            var emp = new Vacations();
            emp.id = 1;
            emp.name = "Marjan Donev";
            emp.description = "Star odmor";
            emp.startDate = new DateTime(2018, 6, 25).ToString("dd/MM/yyyy", iv);
            emp.endDate = new DateTime(2018, 6, 25).ToString("dd/MM/yyyy", iv);


            var emp2 = new Vacations();
            emp2.id = 2;
            emp2.name = "Blazo Petkovski";
            emp2.description = "Odmor";
            emp2.startDate = new DateTime(2018, 6, 25).ToString("dd/MM/yyyy", iv);
            emp2.endDate = new DateTime(2018, 6, 29).ToString("dd/MM/yyyy", iv);

            var emp3 = new Vacations();
            emp3.id = 3;
            emp3.name = "Mario Sazdovski";
            emp3.description = "Odmor";
            emp3.startDate = new DateTime(2018, 3, 25).ToString("dd/MM/yyyy", iv);
            emp3.endDate = new DateTime(2018, 4, 02).ToString("dd/MM/yyyy", iv);

            var emp4 = new Vacations();
            emp4.id = 4;
            emp4.name = "Krste Mijalkovski";
            emp4.description = "Odmor";
            emp4.startDate = new DateTime(2018, 1, 21).ToString("dd/MM/yyyy", iv);
            emp4.endDate = new DateTime(2018, 1, 29).ToString("dd/MM/yyyy", iv);

            var emp5 = new Vacations();
            emp5.id = 5;
            emp5.name = "Marija Mitrova";
            emp5.description = "Odmor";
            emp5.startDate = new DateTime(2018, 8, 03).ToString("dd/MM/yyyy", iv);
            emp5.endDate = new DateTime(2018, 8, 10).ToString("dd/MM/yyyy", iv);

            var emp6 = new Vacations();
            emp6.id = 6;
            emp6.name = "Goran Pereski";
            emp6.description = "Odmor";
            emp6.startDate = new DateTime(2018, 7, 15).ToString("dd/MM/yyyy", iv);
            emp6.endDate = new DateTime(2018, 7, 19).ToString("dd / MM / yyyy", iv);

            var emp7 = new Vacations();
            emp7.id = 7;
            emp7.name = "Risto Andov";
            emp7.description = "Sloboden Den";
            emp7.startDate = new DateTime(2018, 6, 25).ToString("dd/MM/yyyy", iv);
            emp7.endDate = new DateTime(2018, 6, 25).ToString("dd/MM/yyyy", iv);

            var emp8 = new Vacations();
            emp8.id = 8;
            emp8.name = "Valerija Josifova";
            emp8.description = "Odmor";
            emp8.startDate = new DateTime(2018, 5, 29).ToString("dd/MM/yyyy", iv);
            emp8.endDate = new DateTime(2018, 6, 05).ToString("dd/MM/yyyy", iv);

            vacations.Add(emp);
            vacations.Add(emp2);
            vacations.Add(emp3);
            vacations.Add(emp4);
            vacations.Add(emp5);
            vacations.Add(emp6);
            vacations.Add(emp7);
            vacations.Add(emp8);

            return vacations;
        }

        #endregion



        #region No usings

        [HttpPost]
        public ActionResult Create(Vacations Vacation)
        {
            var vacationsList = Session["Vacations"] as List<Vacations>;


            var emp = new Vacations();

            emp.id = vacationsList.LastOrDefault().id + 1;
            emp.name = Vacation.name;
            emp.description = Vacation.description;
            emp.startDate = Vacation.startDate;
            emp.endDate = Vacation.endDate;

            vacationsList.Add(emp);
            Session["Vacations"] = vacationsList;

            return Json(vacationsList, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Edit(Vacations Vacation)
        {
            var vacationsList = Session["Vacations"] as List<Vacations>;


            var emp = new Vacations();
            emp.id = Vacation.id;
            emp.name = Vacation.name;
            emp.description = Vacation.description;
            emp.startDate = Vacation.startDate;
            emp.endDate = Vacation.endDate;

            vacationsList.Add(emp);
            Session["Vacations"] = vacationsList;


            return Json(vacationsList, JsonRequestBehavior.AllowGet);
        }

        #endregion






    }
}