using IMS.Data.Models;

namespace IMS.Models
{
    public class RequestRentRackViewModel
    {
        public int RackNumbers { get; set; }
        public string Customer { get; set; }
        public string Description { get; set; }
        public Request RequestRentRack { get; set; }
    }
}