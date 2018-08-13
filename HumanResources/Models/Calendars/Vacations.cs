using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HumanResources.Models.Calendars
{
    public class Vacations
    {
        public int id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public string startDate { get; set; }
        public string endDate { get; set; }
        public int employeeId { get; set; }
    }
}