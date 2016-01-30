﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Schema;
using IMS.Data.Business;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;

namespace IMS.Data.Repository
{
    public class ServerDAO : BaseDAO<Server>
    {
        private static ServerDAO instance;

        public static ServerDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new ServerDAO();
                }
                return instance;
            }
        }


        public override Server GetByKeys(Server entry)
        {
            return Query(x => x.Maker == "DELL").FirstOrDefault();
        }

        //doing
        public List<Server> Search(string searchBy, string searchValue)
        {
            var servers = new List<Server>();
            var queryable = servers.AsQueryable();
            return DynamicWhere<Server>(queryable, searchBy, searchValue).ToList();
        }

        public List<ServerExtendedModel> GetAllServer()
        {
            var query = from s in Table()
                        join l in LocationDAO.Current.Table()
                            on s.LocationCode equals l.LocationCode into sl
                        from subl in sl.DefaultIfEmpty()
                        join st in StatusDAO.Current.Table()
                            on s.StatusCode equals st.StatusCode into stsl
                        from subst in stsl.DefaultIfEmpty()
                        join a in AccountDAO.Current.Table()
                            on s.Customer equals a.Username into astsl
                        from suba in astsl.DefaultIfEmpty()
                        select new ServerExtendedModel
                        {
                            RackCode = subl.RackCode,
                            RackUnit = subl.RackUnit,
                            Status = subst.Status1,
                            CustomerName = suba.Fullname,
                            Id = s.Id,
                            Maker = s.Maker,
                            Modern = s.Modern,
                            DefaultIP = s.DefaultIP,
                            Customer = s.Customer
                        };
            return query.ToList();
            //string query = @"select s.*,l.RackCode,l.RackUnit, st.Status from Server as s
            //                left join Location as l
            //                on s.LocationCode = l.LocationCode
            //                left join Status as st
            //                on s.StatusCode = st.StatusCode";
            //return RawQuery<ServerExtendedModel>(query, new object[] { });
        }

        public ServerExtendedModel GetServerById(int id)
        {
            var query = from s in Table()
                        join l in LocationDAO.Current.Table()
                            on s.LocationCode equals l.LocationCode into sl
                        from subl in sl.DefaultIfEmpty()
                        join st in StatusDAO.Current.Table()
                            on s.StatusCode equals st.StatusCode into stsl
                        from subst in stsl.DefaultIfEmpty()
                        join a in AccountDAO.Current.Table()
                            on s.Customer equals a.Username into astsl
                        from suba in astsl.DefaultIfEmpty()
                        where s.Id == id
                        select new ServerExtendedModel
                        {
                            RackCode = subl.RackCode,
                            RackUnit = subl.RackUnit,
                            Status = subst.Status1,
                            CustomerName = suba.Fullname,
                            Id = s.Id,
                            Maker = s.Maker,
                            Modern = s.Modern,
                            DefaultIP = s.DefaultIP,
                            ServerCode = s.ServerCode,
                            Size = s.Size,
                            Power = s.Power,
                            RegisteredDate = s.RegisteredDate,
                            Outlet = s.Outlet
                        };
            return query.FirstOrDefault();
        }

        public List<AttributeExtendedModel> GetServerAttributes(int id)
        {
            var query = from sa in ServerAttributeDAO.Current.Table()
                        join a in AttributeDAO.Current.Table()
                            on sa.AttributeCode equals a.AttributeCode into saa
                        from subsaa in saa.DefaultIfEmpty()
                        join s in Table()
                            on sa.ServerCode equals s.ServerCode into ssa
                        from subssa in ssa.DefaultIfEmpty()
                        where subssa.Id == id
                        select new AttributeExtendedModel
                        {
                            AttributeName = subsaa.AttributeName,
                            AttributeValue = sa.AttributeValue
                        }
            ;
            //var query = ServerAttributeDAO.Current.Table().Include("Server").
            //var query = Table().Include("ServerAttribute").Include("Attribute");
            return query.ToList();
        }
    }
}
