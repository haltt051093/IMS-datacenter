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
            var existing = Query(x => x.Id == entry.Id).FirstOrDefault();
            if (existing == null)
            {
                existing = Query(x => x.IPAddress == entry.IPAddress).FirstOrDefault();
            }
            return existing;
        }
        public List<IPExtendedModel> GetAllIP()
        {
            var query = @"select i.*,s.StatusName from IPAddressPool as i
                            left join Status as s
                            on s.StatusCode = i.StatusCode";
            return RawQuery<IPExtendedModel>(query, new object[] { });
        }

        public string GetGatewayByServerCode(string q)
        {
            var query = from ip in Table()
                        join s in ServerDAO.Current.Table()
                            on ip.IPAddress equals s.DefaultIP
                        select ip.Gateway;
            var result = query.FirstOrDefault();
            return result;
        }

        public List<IPExtendedModel> GetIPSameGateway(string gateway)
        {
            var query = @"select i.*, s.StatusName from IPAddressPool as i 
                            join Status as s
                            on s.StatusCode = i.StatusCode
                            and i.Gateway='" + gateway + @"'and i.StatusCode='STATUS10'";
            return RawQuery<IPExtendedModel>(query, new object[] { });
        }

        public List<IPExtendedModel> GetIPAvailable()
        {
            var query = from ip in Table()
                        join st in StatusDAO.Current.Table()
                            on ip.StatusCode equals st.StatusCode into ipst
                        from subIpst in ipst.DefaultIfEmpty()
                        where subIpst.StatusCode == Constants.StatusCode.IP_AVAILABLE
                        select new IPExtendedModel(ip)
                        {
                            StatusCode = subIpst.StatusCode
                        };
            var result = query.ToList();
            return result;
        }

        public List<IPExtendedModel> GetAvailableIpsSameGateway(string serverCode)
        {
            var result = new List<IPExtendedModel>();
            //get default IP
            var defaultIp = ServerDAO.Current.Query(x => x.ServerCode == serverCode).Select(x => x.DefaultIP).FirstOrDefault();
            if (string.IsNullOrEmpty(defaultIp))
            {
                return result;
            }

            //select available IPs in the same range with default IP
            var ip = GetByKeys(new IPAddressPool { IPAddress = defaultIp });
            if (ip == null)
            {
                return result;
            }

            var query = from ips in Table()
                        where ips.Gateway == ip.Gateway && ips.StatusCode == Constants.StatusCode.IP_AVAILABLE
                        select new IPExtendedModel(ips)
                        {
                            IPAddress = ips.IPAddress
                        };
            result = query.ToList();
            return result;
        }

        public List<string> GetRandomIPs(List<IPExtendedModel> list, int number)
        {
            var random = new Random();
            
            var query = from item in list
                        orderby random.Next()
                        select item.IPAddress;
            var result = query.Take(number)
                            .ToList();
            return result;
        }
    }
}
