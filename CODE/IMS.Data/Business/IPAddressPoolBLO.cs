using System;
using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;

namespace IMS.Data.Business
{
    public class IPAddressPoolBLO : BaseBLO<IPAddressPool>
    {
        protected IPAddressPoolDAO dao;

        private static IPAddressPoolBLO instance;

        public static IPAddressPoolBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new IPAddressPoolBLO();
                }
                return instance;
            }
        }               

        private IPAddressPoolBLO()
        {
            baseDao = IPAddressPoolDAO.Current;
            dao = IPAddressPoolDAO.Current;

        }

        public void AddIP(List<IPAddressPool> entry)
        {
            var ip = new List<IPAddressPool>();
            for (var i = 0; i < entry.Count; i++)
            {
                var item = new IPAddressPool();
                item.IPAddress = entry[i].IPAddress;
                item.Gateway = entry[i].Gateway;
                item.RegisteredDate = DateTime.Now;
                item.StatusCode = entry[i].StatusCode;
                item.Subnetmask = entry[i].Subnetmask;
                item.NetworkIP = entry[i].NetworkIP;
                ip.Add(item);
            }
            IPAddressPoolBLO.Current.AddMany(ip);
        }

        public List<IPAddressPoolExtendedModel> GetAllIP()
        {
            return dao.GetAllIP();
        }

        public List<IPAddressPoolExtendedModel> GetIPsByGateway(string gateway)
        {
            return dao.GetIPSameGateway(gateway);
        }

        public List<IPAddressPoolExtendedModel> GetAvailableIPs()
        {
            return dao.GetIPAvailable();
        }

        public string GetGatewayByIP(string q)
        {
            var ip = dao.GetByKeys(new IPAddressPool {IPAddress = q});
            if (ip != null)
            {
                return ip.Gateway;
            }
            return string.Empty;
        }

        public string GetGatewayByServerCode(string q)
        {
            return dao.GetGatewayByServerCode(q);
        }

        public void UpdateIP(string serverCode, string newIP, string requestCode)
        {
            var server = ServerBLO.Current.GetByServerCode(serverCode);
            server.DefaultIP = newIP;
            ServerBLO.Current.Update(server);
            var si = new ServerIP();
            si.CurrentIP = newIP;
            si.ServerCode = serverCode;
            si.AssignedDate = DateTime.Now;
            si.StatusCode = Constants.StatusCode.SERVERIP_CURRENT;
            ServerIPBLO.Current.Add(si);
            var ip = dao.GetByKeys(new IPAddressPool { IPAddress = newIP });
            ip.IsDefault = true;
            ip.StatusCode = Constants.StatusCode.IP_USED;
            dao.Update(ip);
            var log = new LogChangedContent();
            log.TypeOfLog = Constants.TypeOfLog.LOG_ASSIGN_DEFAULT_IP;
            log.Object = Constants.Object.OBJECT_IP;
            log.ChangedValueOfObject = newIP;
            log.ObjectStatus = Constants.StatusCode.IP_USED;
            log.ServerCode = serverCode;
            log.LogTime = DateTime.Now;
            log.RequestCode = requestCode;
            LogChangedContentBLO.Current.Add(log);
        }

        public void UpdateStatusIp(string status, string ip)
        {
            var existing = dao.GetByKeys(new IPAddressPool {IPAddress = ip});
            if (existing != null)
            {
                existing.StatusCode = status;
                dao.Update(existing);
            }
        }

        public List<IPAddressPoolExtendedModel> GetAvailableIpsSameGateway(string serverCode)
        {
            return dao.GetAvailableIpsSameGateway(serverCode);
        }

        public List<string> GetRandomIPs(List<IPAddressPoolExtendedModel> list, int number)
        {
            return dao.GetRandomIPs(list, number);
        }

        public void SetIpAvailable(string serverCode)
        {
            var serverips = ServerIPDAO.Current.Query(x => x.ServerCode == serverCode);
            foreach (var item in serverips)
            {
                var ip = dao.GetByKeys(new IPAddressPool {IPAddress = item.CurrentIP});
                ip.StatusCode = Constants.StatusCode.IP_AVAILABLE;
                dao.Update(ip);
            }
        }

        public string GenerateSubnetMask(int bitCount)
        {
            var remain = bitCount;
            var result = new List<string>();
            for (var i = 0; i < 4; i++)
            {
                if (remain > 8)
                {
                    result.Add("255");
                    remain -= 8;
                }
                else if (remain > 0)
                {
                    var total = 0;
                    for (var j = 0; j < remain; j++)
                    {
                        total += (int)Math.Pow(2, 7 - j);
                    }
                    result.Add(total.ToString());
                    remain = 0;
                }
                else
                {
                    result.Add("0");
                }
            }
            return String.Join(".", result);
        }

        public List<IPAddressPool> GenerateIP(string ipSource, int bitCount)
        {
            var bitMod = bitCount % 8;
            var heads = new List<int>();

            var headCount = (int)Math.Pow(2, bitMod);
            var headBase = (int)Math.Pow(2, 8 - bitMod);
            for (var i = 0; i < headCount; i++)
            {
                heads.Add(headBase * i);
            }

            var ipTemplate = new IPAddressViewModel(ipSource);
            var result = new List<IPAddressPool>();
            var subnetMask = GenerateSubnetMask(bitCount);
            var gateway = string.Empty;
            var networkIP = string.Empty;
            var loopCount = 0;
            var startIndex = 0;

            var compareValue = ipTemplate.Fourth;
            for (var i = 0; i < heads.Count - 1; i++)
            {
                if (heads[i] <= compareValue && compareValue < heads[i + 1])
                {
                    startIndex = heads[i];
                    break;
                }
                else if (heads[i] <= compareValue && compareValue <= 255)
                {
                    startIndex = heads[i + 1];
                }
            }
            for (var i = startIndex; i < 256 && loopCount < 2; i++)
            {
                if (heads.Contains(i))
                {
                    // first IP 
                    loopCount++;
                    if (loopCount < 2)
                    {
                        ipTemplate.Fourth = i;
                        networkIP = ipTemplate.ToString();
                    }

                }
                else if (heads.Contains(i - 1))
                {
                    // gateway
                    loopCount++;
                    ipTemplate.Fourth = i;
                    gateway = ipTemplate.ToString();
                }

            }
            var count = 0;
            for (var i = startIndex; i < 256 && count < 2; i++)
            {
                if (heads.Contains(i))
                {
                    count++;
                }
                else
                {
                    ipTemplate.Fourth = i;
                    var ip = new IPAddressPool
                    {
                        IPAddress = ipTemplate.ToString(),
                        NetworkIP = networkIP,
                        Gateway = gateway,
                        Subnetmask = subnetMask
                    };
                    result.Add(ip);
                }
                if (heads.Contains(i) && count < 2)
                {
                    ipTemplate.Fourth = i;
                    var ip = new IPAddressPool
                    {
                        IPAddress = ipTemplate.ToString(),
                        NetworkIP = networkIP,
                        Gateway = gateway,
                        Subnetmask = subnetMask
                    };
                    result.Add(ip);
                }

            }

            return result;
        }
    }
}
