using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class ProcessRequestExtendedModel : Request
    {
        public RequestInfoModel RequestInfo { get; set; }
        public CustomerInfoModel CustomerInfo { get; set; }
        public List<AccountExtendedModel> listStaff { get; set; }
        public string AssigneeName { get; set; }

        //Add server
        public List<ServerExtendedModel> Serverss { get; set; }
        //bring server away
        public int ReturnIpNumber { get; set; }
        public int ReturnLocationNumber { get; set; }
        public int SelectedServerNumber { get; set; }
        public List<ServerExtendedModel> ServerOfCustomers { get; set; }
        //assign ip
        public int NumberOfIP { get; set; }
        public int NumberOfAvailableIP { get; set; }
        public int NumberOfSelectedIP { get; set; }
        public string SelectedServer { get; set; }
        public string SelectedDefaultIP { get; set; }
        public List<string> randomList { get; set; }
        public List<IPAddressPoolExtendedModel> listAvailableIpsOption { get; set; }
        public List<string> IPs { get; set; }
        public List<IPAddressPoolExtendedModel> listAvailableIps { get; set; }
        //change ip, return ip
        public List<string> ReturningIPs { get; set; }
        public List<string> NewIPs { get; set; }
        //rent rack
        public int RackNumbers { get; set; }
        public List<string> RentedRacks { get; set; }
        public List<string> rows { get; set; }
        public List<RackExtendedModel> listRackByRows { get; set; }
        //return rack
        public List<string> SelectedRacks { get; set; }


    }
}

