using System;
using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;

namespace IMS.Data.Business
{
    public class ShiftBLO : BaseBLO<Shift>
    {
        protected ShiftDAO dao;
        private static ShiftBLO instance;

        public static ShiftBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new ShiftBLO();
                }
                return instance;
            }
        }


        private ShiftBLO()
        {
            baseDao = ShiftDAO.Current;
            dao = ShiftDAO.Current;
        }

        public List<AssignedShift> GenerateShift(DateTime startedDate, DateTime endedDate, string lastGroup)
        {
            var result =  new List<AssignedShift>();
            var shifts = GetAll();
            var groups = GroupDAO.Current.Query(x => x.GroupCode != "Admin" && x.GroupCode != Constants.Role.CUSTOMER);
            var selectedGroup = groups.FirstOrDefault(x => x.GroupCode == lastGroup);
            var startedGroupIndex = selectedGroup == null ? 0 : groups.IndexOf(selectedGroup);
            startedGroupIndex++;
            if (startedGroupIndex >= groups.Count)
            {
                startedGroupIndex = 0;
            }
            for (var date = startedDate; date <= endedDate;)
            {
                for (var i = 0; i < shifts.Count; i++)
                {
                    var assign = new AssignedShift
                    {
                        ShiftCode = shifts[i].ShiftCode,
                        GroupCode = groups[startedGroupIndex].GroupCode,
                        StartedTime = date.AddHours(shifts[i].StartedTime),
                        EndedTime = date.AddHours(shifts[i].EndedTime)
                    };
                    result.Add(assign);
                    startedGroupIndex++;
                    if (startedGroupIndex >= groups.Count)
                    {
                        startedGroupIndex = 0;
                    }
                    AssignedShiftBLO.Current.Add(assign);
                }
                date = date.AddDays(1);
            }
            return result;
        }
    }
}

