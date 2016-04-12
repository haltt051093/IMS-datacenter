using System.Collections.Generic;
using IMS.ApiModels;
using IMS.Data.Business;
using IMS.Data.ViewModels;
using System.Linq;
using IMS.Core;

namespace IMS.ApiControllers
{
    public class IPController : BaseApiController
    {
        public DataTableModel<IPAddressPoolExtendedModel> GetAll()
        {
            var ips = IPAddressPoolBLO.Current.GetAllIP();
            var result = new DataTableModel<IPAddressPoolExtendedModel>();
            result.Data = ips;
            return result;
        }
        public List<string> GetListNetworkIP()
        {
            var ips = IPAddressPoolBLO.Current.GetAllIP();
            var ipuse = ips.Select(x => x).Where(x => x.StatusCode != Constants.StatusCode.IP_DEACTIVATE);
            var result = new List<string>();
            var listNetworkIP = ipuse.OrderBy(x => x.NetworkIP).GroupBy(x => x.NetworkIP).Select(x => x.FirstOrDefault()).Where(x => x.NetworkIP != null);
            result = listNetworkIP.Select(x => x.NetworkIP).ToList();
            return result;
        }

        public List<string> GetListAvaiIP()
        {
            var result = new List<string>();
            var ips = IPAddressPoolBLO.Current.GetAllIP();
            var ipuse = ips.Select(x => x).Where(x => x.StatusCode != Constants.StatusCode.IP_DEACTIVATE);
            var listnet1 = IPAddressPoolBLO.Current.GetNetworkIPToDeact();
            result = listnet1.Select(x => x).ToList();
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
