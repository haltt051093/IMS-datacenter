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

        public List<AssignedShift> GenerateShift(DateTime startedDate, DateTime endedDate, string startedGroup)
        {
            var result =  new List<AssignedShift>();
            var shifts = GetAll();
            var groups = GroupDAO.Current.Query(x => x.GroupCode != "Admin" && x.GroupCode != Constants.Role.CUSTOMER);
            var selectedGroup = groups.FirstOrDefault(x => x.GroupCode == startedGroup);
            var startedGroupId = selectedGroup == null ? 0 : groups.IndexOf(selectedGroup);
            for (var date = startedDate; date <= endedDate;)
            {
                for (var i = 0; i < shifts.Count; i++)
                {
                    var assign = new AssignedShift
                    {
                        ShiftCode = shifts[i].ShiftCode,
                        GroupCode = groups[startedGroupId].GroupCode,
                        StartedTime = date.AddHours(shifts[i].StartedTime),
                        EndedTime = date.AddHours(shifts[i].EndedTime)
                    };
                    result.Add(assign);
                    startedGroupId++;
                    if (startedGroupId >= groups.Count)
                    {
                        startedGroupId = 0;
                    }
                    AssignedShiftBLO.Current.Add(assign);
                }
                date = date.AddDays(1);
            }
            return result;
        }
    }
}

