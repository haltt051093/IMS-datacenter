using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using IMS.ApiModels;
using IMS.Data.Business;
using IMS.Data.ViewModels;

namespace IMS.ApiControllers
{
    public class IPController : ApiController
    {
        public DataTableModel<IPAddressPoolExtendedModel> GetAll()
        {
            var ips = IPAddressPoolBLO.Current.GetAllIP();
            var result = new DataTableModel<IPAddressPoolExtendedModel>();
            result.Data = ips;
            return result;
        }

        public DataTableModel<IPAddressPoolExtendedModel> GetAvailableIP()
        {
            var ips = IPAddressPoolBLO.Current.GetAvailableIPs();
            var result = new DataTableModel<IPAddressPoolExtendedModel>();
            result.Data = ips;
            return result;
        } 
    }
}
