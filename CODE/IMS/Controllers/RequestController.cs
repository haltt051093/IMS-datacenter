using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Models;

namespace IMS.Controllers
{
    public class RequestController : Controller
    {
        //DOING
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
                    return View("RequestReturnRack", viewmodel);
                }
                if (requestcode.Equals(Constants.RequestTypeCode.RENT_RACK))
                {
                    return View("RequestRentRack");
                }
                if (requestcode.Equals(Constants.RequestTypeCode.ADD_SERVER))
                {
                    return View("RequestAddServer");
                }
                if (requestcode.Equals(Constants.RequestTypeCode.UPGRADE_SERVER))
                {
                    return View("RequestUpgradeServer");
                }
                if (requestcode.Equals(Constants.RequestTypeCode.RETURN_IP))
                {
                    RequestReturnIPViewModel viewmodel = new RequestReturnIPViewModel();
                    var ListServers = ServerDAO.Current.Query(x => x.Customer == Constants.Test.CUSTOMER_MANHNH);
                    viewmodel.Servers = ListServers;
                    return View("RequestReturnIP");
                }
            }
            return View(requesttype);
        }

        [HttpPost]
        public ActionResult RequestReturnRack(RequestReturnRackViewModel viewModel)
        {
            if (ModelState.IsValid)
            {
                var number = viewModel.RackOfCustomer.Count();
                var selected = viewModel.RackOfCustomer.Where(x => x.Selected).Select(x => x.Value).ToArray();
                //update statuscode o rack
                //xoa rackId vua nhan duoc, o bang RackOfCustomer
                //de cho chac, tat ca gia tri o cot ServerCode o bang Location de null
                //Hien tai chua can luu log
                if (number != 0)
                {
                    foreach (var item in selected)
                    {
                        //update status of a rack
                        var updateRackStatus = RackDAO.Current.Query(x => x.RackCode == item).FirstOrDefault();
                        Rack rack = updateRackStatus;
                        rack.StatusCode = Constants.StatusCode.RACK_AVAILABLE;
                        RackDAO.Current.Update(rack);
                        //delete a raw in RackOfCustomer where rack is selected
                        var rc = RackOfCustomerDAO.Current.Query(x => x.RackCode == item).FirstOrDefault();
                        RackOfCustomer remove = rc;
                        RackOfCustomerDAO.Current.Remove(remove);
                        //
                    }
                }
            }
            return View(viewModel);
        }

        public ActionResult RequestRentRack(RequestRentRackViewModel viewmodel)
        {
            //int RackNumber = viewmodel.RackNumbers;
            RequestBLO.Current.AddRequestRentRacks(Constants.Test.CUSTOMER_MANHNH);
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult RequestAddServer()
        {
            //tu sinh: ServerCode, Customer, status, registereddate
            //nhap vao: maker, modern, power, size, list of attribute --> lam sao cho hien thi them attribute
            //Chi cap nhat bang server, chung nao status chuyen sang trang thai Running thi moi gan vo cho customer
            return RedirectToActionPermanent("Index", "Server");
        }

        [HttpPost]
        public ActionResult RequestReturnIP()
        {
            // lam tuong tu request return rack
            // thay doi bang ServerIP
            // Cap nhat lai trang thai IP o bang IPAddressPool
            //Neu tra IP la default IP thi cap nhat lai bang Server
            return RedirectToActionPermanent("Index", "Server");
        }

        [HttpPost]
        public ActionResult RequestUpgradeServer()
        {
            return RedirectToActionPermanent("Index", "Server");
        }
    }
}
