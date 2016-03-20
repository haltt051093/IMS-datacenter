using IMS.ApiModels;
using IMS.Data.Business;
using IMS.Data.ViewModels;

namespace IMS.ApiControllers
{
    public class ReportController : BaseApiController
    {
        public DataTableModel<LogContentExtendedModel> GetAll()
        {
            var list = LogBLO.Current.GetAllLogIP();
            var result = new DataTableModel<LogContentExtendedModel>();
            result.Data = list;
            return result;
        }

        public DataTableModel<LogUsedIPExtendModel> GetUsedIP()
        {
            var list = LogBLO.Current.GetLogUsedIP();
            var result = new DataTableModel<LogUsedIPExtendModel>();
            result.Data = list;
            return result;
        } 
    }
}
