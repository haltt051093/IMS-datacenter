using System;
using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;

namespace IMS.Data.Repository
{
    public class IPAddressPoolDAO : BaseDAO<IPAddressPool>
    {
        public static IPAddressPoolDAO instance;

        public static IPAddressPoolDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new IPAddressPoolDAO();
                }
                return instance;
            }
        }

        public override IPAddressPool GetByKeys(IPAddressPool entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }
        public List<IPExtendedModel> GetAllIP()
        {
            string query = @"select i.*,s.StatusName from IPAddressPool as i
                            left join Status as s
                            on s.StatusCode = i.StatusCode";
            return RawQuery<IPExtendedModel>(query, new object[] { });
        }
        public string GetGatewayByServerCode(string servercode)
        {
            string query = @"select i.*, st.StatusName from Server as s join IPAddressPool as i on i.IPAddress= s.DefaultIP and s.ServerCode='" + servercode + @"'
                            left join Status as st
                            on st.StatusCode = i.StatusCode ";
            var IP = RawQuery<IPExtendedModel>(query, new object[] { }).FirstOrDefault();
            return IP.Gateway;
        }

        public string GetGatewayByIP(string ip)
        {
            string query = @"select i.* from IPAddressPool as i 
                            where i.IPAddress='" + ip + @"'";
            var IP = RawQuery<IPExtendedModel>(query, new object[] { }).FirstOrDefault();
            return IP.Gateway;
        }

        public List<IPExtendedModel> GetIPSameGateway(string gateway)
        {
            string query = @"select i.*, s.StatusName from IPAddressPool as i 
                            join Status as s
                            on s.StatusCode = i.StatusCode
                            and i.Gateway='" + gateway + @"'and i.StatusCode='STATUS10'";
            return RawQuery<IPExtendedModel>(query, new object[] { });
        }

        public List<IPExtendedModel> GetIPAvailable()
        {
            string query = @"select i.*,s.StatusName from IPAddressPool as i 
                            join Status as s
                            on s.StatusCode = i.StatusCode
                            and i.StatusCode='STATUS10'";
            return RawQuery<IPExtendedModel>(query, new object[] { });
        }
        public List<string> GetIPStatus()
        {
            string query = @"select s.StatusName from Status as s
                           where s.Object = 'IPAddress'";
            return RawQuery<string>(query, new object[] { });
        }

        public void UpdateStatusIp(string status, string ip)
        {
            var update = Table().FirstOrDefault(x => x.IPAddress == ip);
            if (update != null)
            {
                update.StatusCode = status;
                Update(update);
            }
        }

        public List<IPExtendedModel> GetAvailableIpsSameGateway(string serverCode)
        {
            //get default IP
            var defaultIp = ServerDAO.Current.Query(x => x.ServerCode == serverCode).Select(x => x.DefaultIP).FirstOrDefault();
            //select available IPs in the same range with default IP
            var gateway = GetGatewayByIP(defaultIp);
            var listAvailableIps = from ips in Table()
                                   where ips.Gateway == gateway && ips.StatusCode == Constants.StatusCode.IP_AVAILABLE
                                   select new IPExtendedModel
                                   {
                                       IPAddress = ips.IPAddress
                                   };
            return listAvailableIps.ToList();
        }

        public List<string> SelectRandomIps(List<IPExtendedModel> list, int number)
        {
            var random = new Random();
            //var count = random.Next(list.Count);
            var query = from item in list
                        orderby random.Next()
                        select item.IPAddress;
            var items = query.Take(number);
            return items.ToList();
        }
    }
}
