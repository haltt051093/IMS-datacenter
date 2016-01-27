﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class StaffAssignmentDAO :  BaseDAO<StaffAssignment>
    {
        public static StaffAssignmentDAO instance;

        public static StaffAssignmentDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new StaffAssignmentDAO();
                }
                return instance;
            }
        }

        public override StaffAssignment GetByKeys(StaffAssignment entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }
    }
}
