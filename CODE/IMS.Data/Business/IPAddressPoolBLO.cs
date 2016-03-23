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
            IPAddressPoolDAO.Current.AddMany(ip);
        }

        public void BlockIP(IPAddressPool ip, string Description)
        {
            ip.StatusCode = Constants.StatusCode.IP_BLOCKED;
            IPAddressPoolBLO.Current.Update(ip);
            var log = new Log();
            log.TypeOfLog = Constants.TypeOfLog.LOG_BLOCK_IP;
            log.Object = Constants.Object.OBJECT_IP;
            log.ChangedValueOfObject = ip.IPAddress;
            log.ObjectStatus = Constants.StatusCode.IP_BLOCKED;
            log.LogTime = DateTime.Now;
            log.Description = Description;
            LogBLO.Current.Add(log);
        }

        public void UnblockIP(IPAddressPool ip, string Description)
        {
            ip.StatusCode = Constants.StatusCode.IP_AVAILABLE;
            IPAddressPoolDAO.Current.Update(ip);
            var blockip = LogBLO.Current.GetBlockedIP(ip.IPAddress).FirstOrDefault();
            var log = new Log();
            log.TypeOfLog = Constants.TypeOfLog.LOG_UNBLOCK_IP;
            log.Object = Constants.Object.OBJECT_IP;
            log.ChangedValueOfObject = ip.IPAddress;
            log.ObjectStatus = Constants.StatusCode.IP_AVAILABLE;
            log.Description = Description;
            log.LogTime = DateTime.Now;
            log.PreviousId = blockip.Id;
            LogDAO.Current.Add(log);
        }
        public List<IPAddressPoolExtendedModel> GetAllIP()
        {
            return dao.GetAllIP();
        }

        public List<string> GetNetworkIPToDeact()
        {
            return dao.GetNetworkIPToDeact();
        } 
        public List<IPAddressPoolExtendedModel> GetIPsByGateway(string gateway)
        {
            return dao.GetIPSameGateway(gateway);
        }

        public List<IPAddressPoolExtendedModel> GetAvailableIPs()
        {
            var query = from ip in IPAddressPoolDAO.Current.Table
                        join st in StatusDAO.Current.Table
                            on ip.StatusCode equals st.StatusCode into ipst
                        from subIpst in ipst.DefaultIfEmpty()
                        where subIpst.StatusCode == Constants.StatusCode.IP_AVAILABLE
                        select new IPAddressPoolExtendedModel
                        {
                            _IPAddressPool = ip,
                            StatusCode = subIpst.StatusCode
                        };
            var result = query.ToList();
            return result;
        }

        public string GetGatewayByIP(string q)
        {
            var ip = dao.GetByKeys(new IPAddressPool { IPAddress = q });
            if (ip != null)
            {
                return ip.Gateway;
            }
            return string.Empty;
        }

        public string GetGatewayByServerCode(string q)
        {
            var query = from ip in IPAddressPoolDAO.Current.Table
                        join s in ServerDAO.Current.Table
                            on ip.IPAddress equals s.DefaultIP
                        select ip.Gateway;
            var result = query.FirstOrDefault();
            return result;
        }

        public bool UpdateIP(string serverCode, string newIP, string requestCode, string oldIP)
        {
            if (oldIP == null)
            {
                var ip = dao.GetByKeys(new IPAddressPool { IPAddress = newIP });
                if (ip.StatusCode == Constants.StatusCode.IP_AVAILABLE)
                {
                    ip.IsDefault = true;
                    ip.StatusCode = Constants.StatusCode.IP_USED;
                    dao.Update(ip);
                    var server = ServerBLO.Current.GetByServerCode(serverCode);
                    server.DefaultIP = newIP;
                    ServerBLO.Current.Update(server);
                    return true;
                }
                else
                { return false;}

            }
            else
            {
                var ip1 = dao.GetByKeys(new IPAddressPool { IPAddress = newIP });
                if (ip1.StatusCode == Constants.StatusCode.IP_AVAILABLE)
                {
                    ip1.StatusCode = Constants.StatusCode.IP_USED;
                    ip1.IsDefault = true;
                    dao.Update(ip1);
                    var server = ServerBLO.Current.GetByKeys(new Server {ServerCode = serverCode});
                    server.DefaultIP = newIP;
                    ServerBLO.Current.Update(server);
                    var ip = dao.GetByKeys(new IPAddressPool {IPAddress = oldIP});
                    ip.StatusCode = Constants.StatusCode.IP_AVAILABLE;
                    ip.IsDefault = false;
                    dao.Update(ip);
                    return true;
                }
                else
                {
                    return false;
                }


            }
           
        }

        public void UpdateStatusIpANDLog(string requestCode, string serverCode, string ip, string newStatus,
            string typeOfLog, string username)
        {
            var existing = dao.GetByKeys(new IPAddressPool { IPAddress = ip });
            if (existing != null)
            {
                existing.StatusCode = newStatus;
                dao.Update(existing);
            }
            //Add log trang thai IP
            Log logIp = new Log
            {
                RequestCode = requestCode,
                TypeOfLog = typeOfLog,
                Object = Constants.Object.OBJECT_IP,
                ChangedValueOfObject = ip,
                ObjectStatus = newStatus,
                ServerCode = serverCode,
                Username = username
            };
            LogBLO.Current.Add(logIp);
        }

        public List<IPAddressPoolExtendedModel> GetAvailableIpsSameGateway(string serverCode)
        {
            var result = new List<IPAddressPoolExtendedModel>();
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

            var query = from ips in IPAddressPoolDAO.Current.Table
                        where ips.Gateway == ip.Gateway && ips.StatusCode == Constants.StatusCode.IP_AVAILABLE
                        select new IPAddressPoolExtendedModel
                        {
                            _IPAddressPool = ips,
                            IPAddress = ips.IPAddress
                        };
            result = query.ToList();
            return result;
        }

        public List<string> GetRandomIPs(List<IPAddressPoolExtendedModel> list, int number)
        {
            var random = new Random();

            var query = from item in list
                        orderby random.Next()
                        select item.IPAddress;
            var result = query.Take(number)
                            .ToList();
            return result;
        }

        //public void SetIpAvailable(string serverCode)
        //{
        //    var serverips = ServerIPDAO.Current.Query(x => x.ServerCode == serverCode);
        //    foreach (var item in serverips)
        //    {
        //        var ip = dao.GetByKeys(new IPAddressPool { IPAddress = item.CurrentIP });
        //        ip.StatusCode = Constants.StatusCode.IP_AVAILABLE;
        //        dao.Update(ip);
        //    }
        //}

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
