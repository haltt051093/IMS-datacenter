using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
        public string GenerateSubnetMask(int count)
        {
            var remain = count;
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

        public List<IPAddressPool> GenerateIP(string ipSource, int bitCount, bool fullRange = false)
        {
            var bitMod = bitCount % 8;
            var bitDiv = (int)Math.Floor((double)bitCount / 8) + 1;
            var heads = new List<int>();

            var headCount = (int)Math.Pow(2, bitMod);
            var headBase = (int)Math.Pow(2, 8 - bitMod);
            for (int i = 0; i < headCount; i++)
            {
                heads.Add(headBase * i);
            }

            var ipTemplate = new IPAddressModel(ipSource);
            var result = new List<IPAddressPool>();
            var subnetMask = GenerateSubnetMask(bitCount);
            var gateway = string.Empty;
            var loopCount = 0;
            var startIndex = 0;
            if (!fullRange)
            {
                var compareValue = ipTemplate.Fourth;
                if (bitDiv == 3)
                {
                    compareValue = ipTemplate.Third;
                }
                else if (bitDiv == 2)
                {
                    compareValue = ipTemplate.Second;
                }
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
            }
            for (int i = startIndex; i < 256 && loopCount < 2; i++)
            {
                if (bitDiv == 2)
                {
                    ipTemplate.Second = i;
                }
                else if (bitDiv == 3)
                {
                    ipTemplate.Third = i;
                    for (var j = 0; j < 256; j++)
                    {
                        if (heads.Contains(i) && j == 0)
                        {
                            // first IP - skip
                            if (!fullRange)
                            {
                                loopCount++;
                            }
                            if (loopCount > 1)
                            {
                                break;
                            }
                        }
                        else if (heads.Contains(i) && j == 1)
                        {
                            // gateway
                            ipTemplate.Fourth = j;
                            gateway = ipTemplate.ToString();
                        }
                        else
                        {
                            ipTemplate.Fourth = j;
                            var ip = new IPAddressPool
                            {
                                IPAddress = ipTemplate.ToString(),
                                Gateway = gateway,
                                Subnetmask = subnetMask
                            };
                            result.Add(ip);
                        }
                    }
                }
                else if (bitDiv == 4)
                {
                    if (heads.Contains(i))
                    {
                        // first IP - skip
                        if (!fullRange)
                        {
                            loopCount++;
                        }
                    }
                    else if (heads.Contains(i - 1))
                    {
                        // gateway
                        ipTemplate.Fourth = i;
                        gateway = ipTemplate.ToString();
                    }
                    else
                    {
                        ipTemplate.Fourth = i;
                        var ip = new IPAddressPool
                        {
                            IPAddress = ipTemplate.ToString(),
                            Gateway = gateway,
                            Subnetmask = subnetMask
                        };
                        result.Add(ip);
                    }
                }
            }
            return result;
        }
        private IPAddressPoolBLO()
        {
            baseDao = IPAddressPoolDAO.Current;
            dao = IPAddressPoolDAO.Current;

        }
        public void AddIP(List<IPAddressPool> entry)
        {
            var ip = new List<IPAddressPool>();
            for (int i = 0; i < entry.Count; i++)
            {
                var item = new IPAddressPool();
                item.IPAddress = entry[i].IPAddress;
                item.Gateway = entry[i].Gateway;
                item.RegisteredDate = DateTime.Now;
                item.StatusCode = "STATUS10";
                item.Subnetmask = entry[i].Subnetmask;
                ip.Add(item);
            }
            IPAddressPoolBLO.Current.AddMany(ip);
        }
        public List<IPExtendedModel> GetAllIP()
        {
            return dao.GetAllIP();
        }
    }
}
