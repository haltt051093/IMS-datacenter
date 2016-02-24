﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Data.Business;
using IMS.Models;

namespace IMS.Controllers
{
    public class ScheduleController : CoreController
    {
        // GET: Schedule
        public ActionResult Index()
        {
            var schedule = RequestBLO.Current.GetScheduleToday();
            var data = new ScheduleIndexViewModel();
            data.Schedules = schedule;
            return View(data);
        }

        public ActionResult Index2()
        {
            var note = RequestBLO.Current.GetNoteOfShift();
            var data = new ScheduleIndexViewModel();
            data.Schedules = note;
            return View(data);
        }
    }
}