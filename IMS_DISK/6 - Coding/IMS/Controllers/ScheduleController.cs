using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Models;

namespace IMS.Controllers
{
    public class ScheduleController : CoreController
    {
        // GET: Schedule

        [Authorize(Roles = "Staff,Shift Head,Manager")]
        public ActionResult Index()
        {
            var note = RequestBLO.Current.GetNoteOfShift();
            var prenote = RequestBLO.Current.GetNoteOfPreviousShift();
            var activeGroupCode = AssignedShiftBLO.Current.GetActiveGroup();
            var activeStaff = AccountBLO.Current.GetAccountsByGroup(activeGroupCode)
                .Where(x => x.Role == Constants.Role.SHIFT_HEAD)
                .ToList().FirstOrDefault();
            var data = new ScheduleIndexViewModel();
            data.Schedules = note;
            data.Schedules1 = prenote;
            data.StaffCode = GetCurrentUserName();
            data.StaffInShift = activeStaff.Username;
            data.StaffRole = GetCurrentUserRole();
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