using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;
using IMS.Models;
using Newtonsoft.Json;

namespace IMS.Controllers
{
    [AllowAnonymous]
    public class HomeController : CoreController
    {
        // GET: Home
        [HttpGet]
        public ActionResult Index(RequestType requesttype)
        {
            string requestcode = requesttype.RequestTypeCode;
            if (!string.IsNullOrEmpty(requestcode))
            {
                if (requestcode.Equals(Constants.RequestTypeCode.RETURN_RACK))
                {
                    RequestReturnRackViewModel viewmodel = new RequestReturnRackViewModel();
                    var result = RackOfCustomerDAO.Current.EmptyRentedRack(Constants.Test.CUSTOMER_MANHNH);
                    viewmodel.RackOfCustomer = result.Select(x => new SelectListItem
                    {
                        Value = x.RackCode,
                        Text = x.RackName
                    }).ToList();
                    return View("../Request/RequestReturnRack", viewmodel);
                }
                //DOING
                if (requestcode.Equals(Constants.RequestTypeCode.RENT_RACK))
                {
                    return View("../Request/RequestRentRack");
                }
                if (requestcode.Equals(Constants.RequestTypeCode.ADD_SERVER))
                {
                    var viewmodel = new RequestAddServerViewModel();
                    viewmodel.Servers = new List<ServerExtendedModel>();
                    if (Session[Constants.Session.REQUEST_CODE] == null)
                    {
                        var requestCode = RequestBLO.Current.GenerateCode();
                        Session[Constants.Session.REQUEST_CODE] = requestCode;
                    }
                    var rCode = Session[Constants.Session.REQUEST_CODE].ToString();
                    var tempDatas = TempRequestBLO.Current.GetByRequestCode(rCode);
                    foreach (var tempData in tempDatas)
                    {
                        var server = JsonConvert.DeserializeObject<ServerExtendedModel>(tempData.Data);
                        server.TempCode = tempData.TempCode;
                        viewmodel.Servers.Add(server);
                    }
                    var attrList = AttributeBLO.Current.GetAll();
                    viewmodel.AttributeList = attrList
                        .Select(x => new SelectListItem { Value = x.AttributeCode, Text = x.AttributeName })
                        .ToList();

                    return View("../Request/RequestAddServer", viewmodel);

                }
                if (requestcode.Equals(Constants.RequestTypeCode.RETURN_IP))
                {
                    RequestIPViewModel viewmodel = new RequestIPViewModel();
                    var listServers = ServerDAO.Current.Query(x => x.Customer == Constants.Test.CUSTOMER_MANHNH);
                    viewmodel.Servers = listServers.Select(x => new SelectListItem
                    {
                        Value = x.ServerCode,
                        Text = x.Model
                    }).ToList();
                    return View("../Request/RequestReturnIP2", viewmodel);
                }
                //DOING
                if (requestcode.Equals(Constants.RequestTypeCode.CHANGE_IP))
                {
                    {
                        //co the change duoc nhieu IP--> bo sung t
                        RequestIPViewModel viewmodel = new RequestIPViewModel();
                        var listServers = ServerDAO.Current.Query(x => x.Customer == Constants.Test.CUSTOMER_MANHNH);
                        viewmodel.Servers = listServers.Select(x => new SelectListItem
                        {
                            Value = x.ServerCode,
                            Text = x.Model
                        }).ToList();
                        return View("../Request/RequestChangeIP", viewmodel);
                    }
                }
                if (requestcode.Equals(Constants.RequestTypeCode.ASSIGN_IP))
                {
                    RequestIPViewModel viewmodel = new RequestIPViewModel();

                    var listServers = ServerDAO.Current.Query(x => x.Customer == Constants.Test.CUSTOMER_MANHNH);
                    viewmodel.Servers = listServers.Select(x => new SelectListItem
                    {
                        Value = x.ServerCode,
                        Text = x.Model
                    }).ToList();
                    return View("../Request/RequestAssignIP", viewmodel);
                }
            }
            return View(requesttype);
        }

        [ChildActionOnly]
        public PartialViewResult Sidebar(object role)
        {
            return PartialView(role);
        }
    }
}