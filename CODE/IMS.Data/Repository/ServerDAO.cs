using System;
using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Core.Express;
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
            var existing = Query(x => x.Id == entry.Id).FirstOrDefault();
            if (existing == null)
            {
                existing = Query(x => x.ServerCode == entry.ServerCode).FirstOrDefault();
            }
            return existing;
        }

        public List<ServerExtendedModel> GetAllServer()
        {
            var distinct = LocationDAO.Current.Table().GroupBy(item => item.ServerCode)
                .Select(e => e.FirstOrDefault());
            var rackDis = from r in RackDAO.Current.Table()
                          join l in distinct
                              on r.RackCode equals l.RackCode
                          select new RackOfCustomerExtendedModel
                          {
                              LocationCode = l.LocationCode,
                              ServerCode = l.ServerCode,
                              RackUnit = l.RackUnit,
                              RackCode = l.RackCode,
                              RackName = r.RackName
                          };
            var query = from s in Table()
                        join l in rackDis
                            on s.ServerCode equals l.ServerCode into sl
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
                            Status = subst.StatusName,
                            CustomerName = suba.Fullname,
                            Id = s.Id,
                            Maker = s.Maker,
                            Model = s.Model,
                            DefaultIP = s.DefaultIP,
                            Customer = s.Customer,
                            ServerCode = s.ServerCode,
                            RackName = subl.RackName,
                            StatusCode = s.StatusCode

                        };
            return query.ToList();
        }

        public List<ServerExtendedModel> GetServerOfCustomer(string customer)
        {
            var distinct = LocationDAO.Current.Table().GroupBy(item => item.ServerCode)
                .Select(e => e.FirstOrDefault());
            var rackDis = from r in RackDAO.Current.Table()
                          join l in distinct
                              on r.RackCode equals l.RackCode
                          select new RackOfCustomerExtendedModel
                          {
                              LocationCode = l.LocationCode,
                              ServerCode = l.ServerCode,
                              RackCode = l.RackCode,
                              RackName = r.RackName,
                          };
            var query = from s in Table()
                        join l in rackDis
                            on s.ServerCode equals l.ServerCode into sl
                        from subl in sl.DefaultIfEmpty()
                        where s.Customer == customer && s.StatusCode == Constants.StatusCode.SERVER_RUNNING
                        select new ServerExtendedModel
                        {
                            RackCode = subl.RackCode,
                            RackName = subl.RackName,
                            DefaultIP = s.DefaultIP,
                            ServerCode = s.ServerCode,
                            Customer = s.Customer
                        };
            return query.ToList();
        }

        //a server with full fields
        public ServerExtendedModel GetServerByCode(string serverCode, string status)
        {
            var distinct = LocationDAO.Current.Table().GroupBy(item => item.ServerCode)
                .Select(e => e.FirstOrDefault());
            var rackDis = from r in RackDAO.Current.Table()
                          join l in distinct
                              on r.RackCode equals l.RackCode
                          select new RackOfCustomerExtendedModel
                          {
                              LocationCode = l.LocationCode,
                              ServerCode = l.ServerCode,
                              RackUnit = l.RackUnit,
                              RackCode = l.RackCode,
                              RackName = r.RackName,
                          };
            var query = from s in Table()
                        join l in rackDis
                            on s.ServerCode equals l.ServerCode into sl
                        from subl in sl.DefaultIfEmpty()
                        join st in StatusDAO.Current.Table()
                            on s.StatusCode equals st.StatusCode into stsl
                        from subst in stsl.DefaultIfEmpty()
                        where s.ServerCode == serverCode && s.StatusCode == status
                        select new ServerExtendedModel
                        {
                            RackCode = subl.RackCode,
                            RackName = subl.RackName,
                            RackUnit = subl.RackUnit,
                            Status = subst.StatusName,
                            Customer = s.Customer,
                            Id = s.Id,
                            Maker = s.Maker,
                            Model = s.Model,
                            DefaultIP = s.DefaultIP,
                            ServerCode = s.ServerCode,
                            Size = s.Size,
                            Power = s.Power,
                            RegisteredDate = s.RegisteredDate,
                            Outlet = s.Outlet,
                            Bandwidth = s.Bandwidth,
                            PartNumber = s.PartNumber,
                            SerialNumber = s.SerialNumber
                        };
            return query.FirstOrDefault();
        }

        //get attribute of a server
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
                };
            return query.ToList();
        }

        //get current IPs of a server
        public List<ServerIP> GetCurrentIP(string serverCode)
        {
            var query = from s in Table()
                        join si in ServerIPDAO.Current.Table()
                            on s.ServerCode equals si.ServerCode
                        where s.ServerCode == serverCode
                        select si;
            return query.ToList();
        }

        //add new server
        public string AddServer(Server passServer)
        {
            var server = passServer;
            server.ServerCode = GenerateCode();
            server.StatusCode = Constants.StatusCode.SERVER_WAITING;
            server.RegisteredDate = DateTime.Now;
            var existing = GetByKeys(server);
            if (existing == null)
            {
                IMSContext.Current.Set<Server>().Add(server);
            }
            else
            {
                CopyValues(server, existing);
            }
            IMSContext.Current.SaveChanges();
            return server.ServerCode;
        }

        public string GenerateCode()
        {
            var code = "S" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
            var existing = Query(x => x.ServerCode == code).FirstOrDefault();
            while (existing != null)
            {
                code = "S" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
                existing = Query(x => x.ServerCode == code).FirstOrDefault();
            }
            return code;
        }

        public ServerExtendedModel GetAllServerInfo(string serverCode)
        {
            var query = from s in Table()
                        join st in StatusDAO.Current.Table()
                            on s.StatusCode equals st.StatusCode into stsl
                        from subst in stsl.DefaultIfEmpty()
                        join a in AccountDAO.Current.Table()
                            on s.Customer equals a.Username into astsl
                        from suba in astsl.DefaultIfEmpty()
                        where s.ServerCode == serverCode
                        //&& s.StatusCode == Constants.StatusCode.SERVER_BRINGING_AWAY
                        select new ServerExtendedModel
                        {
                            Status = subst.StatusName,
                            CustomerName = suba.Fullname,
                            Customer = s.Customer,
                            Id = s.Id,
                            Maker = s.Maker,
                            Model = s.Model,
                            DefaultIP = s.DefaultIP,
                            ServerCode = s.ServerCode,
                            Size = s.Size,
                            Power = s.Power,
                            RegisteredDate = s.RegisteredDate,
                            Outlet = s.Outlet,
                            Bandwidth = s.Bandwidth,
                            PartNumber = s.PartNumber,
                            SerialNumber = s.SerialNumber
                        };
            var server = query.FirstOrDefault();

            var serverip = from si in ServerIPDAO.Current.Table()
                           where si.ServerCode == serverCode
                           select si;
            if (serverip != null)
            {
                server.ServerIps = serverip.ToList();
            }
            var serverlocation = from l in LocationDAO.Current.Table()
                                 join r in RackDAO.Current.Table()
                                     on l.RackCode equals r.RackCode into lr
                                 from sublr in lr.DefaultIfEmpty()
                                 where l.ServerCode == serverCode
                                 select new LocationViewModel
                                 {
                                     RackName = sublr.RackName,
                                     RackUnit = l.RackUnit
                                 };
            if (serverlocation != null)
            {
                server.ServerLocation = serverlocation.ToList();
            }
            return server;
        }
    }
}
