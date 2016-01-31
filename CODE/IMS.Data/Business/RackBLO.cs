﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Core.Express;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;

namespace IMS.Data.Business
{
    public class RackBLO : BaseBLO<Rack>
    {
        protected RackDAO dao;
        private static RackBLO instance;

        public static RackBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new RackBLO();
                }
                return instance;
            }
        }
        public void AddRackAndLocation(Rack entry)
        {
            var rackCode = GenerateCode();
            entry.RackCode = rackCode;
            entry.RegisteredDate = DateTime.Now;
            dao.Add(entry);
            var locations = new List<Location>();
            for (int i = 1; i < 43; i++)
            {
                var item = new Location();
                item.LocationCode = LocationBLO.Current.GenerateCode();
                item.RackCode = rackCode;
                item.RackUnit = i;
                item.StatusCode = "STATUS13";
                locations.Add(item);
            }
            LocationBLO.Current.AddMany(locations);

        }

        public Rack GetByName(Rack entry)
        {
            return dao.Query(x => x.RackName == entry.RackName).FirstOrDefault();
        }

        public string GenerateCode()
        {
            var code = "R" + TextExpress.Randomize(6, TextExpress.NUMBER + TextExpress.NUMBER);
            var existing = dao.Query(x => x.RackCode == code).FirstOrDefault();
            while (existing != null)
            {
                code = "R" + TextExpress.Randomize(6, TextExpress.NUMBER + TextExpress.NUMBER);
                existing = dao.Query(x => x.RackCode == code).FirstOrDefault();
            }
            return code;
        }

        private RackBLO()
        {
            baseDao = RackDAO.Current;
            dao = RackDAO.Current;
        }
    }
}
