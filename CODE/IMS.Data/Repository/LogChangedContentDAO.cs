﻿using System;
using System.Linq;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class LogChangedContentDAO : BaseDAO<LogChangedContent>
    {
        public static LogChangedContentDAO instance;

        public static LogChangedContentDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogChangedContentDAO();
                }
                return instance;
            }
        }

        public override LogChangedContent GetByKeys(LogChangedContent entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }

        public void AddLog(LogChangedContent viewmodel)
        {
            LogChangedContent log = viewmodel;
            log.LogTime = DateTime.Now;
            var existing = GetByKeys(log);
            if (existing == null)
            {
                IMSContext.Current.Set<LogChangedContent>().Add(log);
            }
            else
            {
                CopyValues(log, existing);
            }
            IMSContext.Current.SaveChanges();
        }

    }
}
