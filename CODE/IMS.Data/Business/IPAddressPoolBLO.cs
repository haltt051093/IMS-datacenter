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

        public List<string> GenerateIP(string ip, int bitCount)
        {
            var bitMod = bitCount % 8;
            var bitDiv = (int)Math.Floor((decimal)bitCount / 8);
            var heads = new List<int>();

            var headCount = (int)Math.Pow(2, bitMod);
            var headBase = (int)Math.Pow(2, 8 - bitMod);
            for (int i = 0; i < headCount; i++)
            {
                heads.Add(headBase * i);
            }

            var ipTemplate = new IPAddressModel(ip);
            var result = new List<string>();
            for (int i = 0; i < 256; i++)
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
                        if (!heads.Contains(i) || !(j == 0 || j == 1))
                        {
                            ipTemplate.Fourth = j;
                            result.Add(ipTemplate.ToString());
                        }
                    }
                }
                else if (bitDiv == 4)
                {
                    if (!heads.Contains(i) && !heads.Contains(i - 1))
                    {
                        ipTemplate.Fourth = i;
                        result.Add(ipTemplate.ToString());
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
        public List<IPExtendedModel> GetAllIP()
        {
            return dao.GetAllIP();
        }
    }
}
