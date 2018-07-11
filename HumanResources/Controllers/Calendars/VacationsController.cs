using HumanResources.Models.Calendars;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HumanResources.Controllers.Calendars
{
    public class VacationsController : Controller
    {
        // GET: Vacations
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetVacations()
        {
            CultureInfo iv = CultureInfo.InvariantCulture;

            var vacationsList = new List<Vacations>();

            var vacation = new Vacations();
            vacation.id = 0;
            vacation.name = "Marjan Donev";
            vacation.description = "Star odmor";
            vacation.startDate = new DateTime(2018, 6, 25).ToString("R", iv);
            vacation.endDate = new DateTime(2018, 6, 28).ToString("R", iv);


            var vacation1 = new Vacations();
            vacation1.id = 1;
            vacation1.name = "Marjan Donev";
            vacation1.description = "Star odmor";
            vacation1.startDate = new DateTime(2018, 7, 25).ToString("R", iv);
            vacation1.endDate = new DateTime(2018, 7, 28).ToString("R", iv);


            var vacation2 = new Vacations();
            vacation2.id = 2;
            vacation2.name = "Marjan Donev";
            vacation2.description = "Star odmor";
            vacation2.startDate = new DateTime(2018, 8, 25).ToString("R", iv);
            vacation2.endDate = new DateTime(2018, 8, 28).ToString("R", iv);


            var vacation3 = new Vacations();
            vacation3.id = 3;
            vacation3.name = "Marjan Donev";
            vacation3.description = "Star odmor";
            vacation3.startDate = new DateTime(2018, 9, 25).ToString("R", iv);
            vacation3.endDate = new DateTime(2018, 9, 28).ToString("R", iv);


            vacationsList.Add(vacation);
            vacationsList.Add(vacation1);
            vacationsList.Add(vacation2);
            vacationsList.Add(vacation3);

            return Json(vacationsList, JsonRequestBehavior.AllowGet);
        }
    }
}