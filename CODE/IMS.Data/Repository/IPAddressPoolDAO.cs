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
        public List<IPAddressPoolExtendedModel> GetAllIP()
        {
            var query = @"select i.*,s.StatusName,ser.ServerCode, ser1.Power, ser1.Size,s1.StatusName as ServerStatus, ser1.Bandwidth, acc.Fullname as ServerOwner from IPAddressPool as i
                            left join Status as s
                            on s.StatusCode = i.StatusCode
							left join ServerIP as ser 
							on ser.CurrentIP = i.IPAddress and (ser.StatusCode='STATUS29' or ser.StatusCode='STATUS30')
                            left join Server as ser1
							on ser.ServerCode = ser1.ServerCode
							left join Status as s1
                            on s1.StatusCode = ser1.StatusCode
                            left join Account as acc
							on acc.Username = ser1.Customer";
            return RawQuery<IPAddressPoolExtendedModel>(query, new object[] { });
        }

        public List<string> GetNetworkIPToDeact()
        {
            var query = @"select i.NetworkIP from IPAddressPool as i
                            group by i.NetworkIP
                            EXCEPT
                            select ip.NetworkIP from IPAddressPool as ip
                            where ip.StatusCode = 'STATUS11' or ip.StatusCode = 'STATUS35'";
            return RawQuery<string>(query, new object[] { });
        } 

        public List<IPAddressPoolExtendedModel> GetIPSameGateway(string gateway)
        {
            var query = @"select i.*, s.StatusName from IPAddressPool as i 
                            join Status as s
                            on s.StatusCode = i.StatusCode
                            and i.Gateway='" + gateway + @"'and i.StatusCode='STATUS10'";
            return RawQuery<IPAddressPoolExtendedModel>(query, new object[] { });
        }

        public List<string> GetCurrentIPOfCustomer(string customer)
        {
            var query = @"select si.CurrentIP from ServerIP as si, Server as ser
                          where si.ServerCode = ser.ServerCode and ser.Customer='"+customer+@"' and si.StatusCode!='STATUS31'";
            return RawQuery<string>(query, new object[] { });
        } 
    }
}
