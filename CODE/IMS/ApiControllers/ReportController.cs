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
    public class ReportController : ApiController
    {
        public DataTableModel<LogContentExtendedModel> GetAll()
        {
            var list = LogChangedContentBLO.Current.GetAllLogIP();
            var result = new DataTableModel<LogContentExtendedModel>();
            result.Data = list;
            return result;
        }
    }
}
