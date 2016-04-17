using System.Collections.Generic;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class HomeIndexViewModel
    {
        public int countblockedip { get; set; }   
        public int countusedip { get; set; }
        public int countavailableip { get; set; }
        public string RoleLogin { get; set; }
        public int Currentip { get; set; }
        public int RunningServer { get; set; }

        // Server side home page
        public int countPendingRequest { get; set; }
        public int countProcessingRequest { get; set; }
        public int countWeeklyRequest { get; set; }
        public List<RequestExtendedModel>  firstTenRequests { get; set; }
    }
}
