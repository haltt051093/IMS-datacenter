using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Models;

namespace IMS.Controllers
{
    public class ScheduleController : CoreController
    {
        // GET: Schedule
       

        public ActionResult Index()
        {
            var note = RequestBLO.Current.GetNoteOfShift();
            var prenote = RequestBLO.Current.GetNoteOfPreviousShift();
            var data = new ScheduleIndexViewModel();
            data.Schedules = note;
            data.Schedules1 = prenote;
            var count = data.Schedules.Count;
            data.NewNote = new string[count].ToList();
            return View(data);
        }

        [HttpPost]
        public ActionResult Index(ScheduleIndexViewModel sivm)
        {
            List<Note> notes = new List<Note>();
            for (int i = 0; i < sivm.Schedules.Count; i++)
            {
                Note note = new Note();
                note.NoteCode = NoteBLO.Current.GenerateCode();
                note.RequestCode = sivm.Schedules[i].RequestCode;
                note.StaffCode = sivm.StaffCode;
                note.NoteContent = sivm.NewNote[i];
                note.AddedTime = DateTime.Now;
                notes.Add(note);
            }
            NoteDAO.Current.AddMany(notes);
            return RedirectToAction("Index");
        }
    }
}