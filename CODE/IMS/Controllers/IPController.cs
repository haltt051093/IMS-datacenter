using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Models;

namespace IMS.Controllers
{
    public class IPController : CoreController
    {
        [Authorize(Roles = "Staff,Shift Head,Manager")]
        public ActionResult Index(string Message, string FailBlock, string FailUnBlock)
        {
            var data = new IPIndexViewModel();
            data.SuccessMessage = Message;
            data.FailBlock = FailBlock;
            data.FailUnBlock = FailUnBlock;
            var ips = IPAddressPoolBLO.Current.GetAllIP();
            var ipuse = ips.Select(x => x).Where(x => x.StatusCode != Constants.StatusCode.IP_DEACTIVATE);
            var listnet1 = IPAddressPoolBLO.Current.GetNetworkIPToDeact();
            data.NetIPAvai = listnet1.Select(x => new SelectListItem
            {
                Value = x,
                Text = x
            }).ToList();

            var listNetworkIP = ipuse.OrderBy(x => x.NetworkIP).GroupBy(x => x.NetworkIP).Select(x => x.FirstOrDefault()).Where(x => x.NetworkIP!=null);
            data.NetworkIPs = listNetworkIP.Select(x => new SelectListItem
            {
                Value = x.NetworkIP,
                Text = x.NetworkIP
            }).ToList();
            var listnet = new List<SelectListItem>();
            var list = new int[] { 24, 25, 26, 27, 28 };
            foreach (var i in list)
            {
                var num = (i).ToString();
                var item = new SelectListItem()
                {
                    Value = num,
                    Text = num
                };
                listnet.Add(item);
            }
            data.ListNetmask = listnet;
            data.IPs = ips;
            return View(data);
        }

        [HttpPost]
        public JsonResult AddIPRange(IPIndexViewModel iivm)
        {
            var ips = new List<IPAddressPool>();
            var result = new JsonResultModel();
            var existing = IPAddressPoolBLO.Current.GetByKeys(new IPAddressPool { IPAddress = iivm.Address });
            if (existing == null)
            {
                if (iivm.Option == "After")
                {
                    ips = IPAddressPoolBLO.Current.GenerateIPAfterFirst(iivm.Address, iivm.Netmask);
                }
                if (iivm.Option == "Before")
                {
                    ips = IPAddressPoolBLO.Current.GenerateIPBeforeLast(iivm.Address, iivm.Netmask);
                }
                var k = ips.Count - 1;
                ips[k].StatusCode = Constants.StatusCode.IP_RESERVE;
                for (int i = 0; i < ips.Count; i++)
                {
                    ips[i].Staff = GetCurrentUserName();
                }
                for (var i = 0; i < ips.Count - 1; i++)
                {
                    if (ips[i].IPAddress == ips[i].NetworkIP || ips[i].IPAddress == ips[i].Gateway)
                    {
                        ips[i].StatusCode = Constants.StatusCode.IP_RESERVE;
                    }
                    else
                    {
                        ips[i].StatusCode = Constants.StatusCode.IP_AVAILABLE;
                    }
                }
                IPAddressPoolBLO.Current.AddIP(ips);
                result.Success = true;
            }
            else
            {
                result.Success = false;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult DeactivateIP(IPIndexViewModel iivm)
        {
            var result = new JsonResultModel();
            for (var i = 0; i < iivm.NetIPAvai.Count; i++)
            {
                var item = iivm.NetIPAvai[i];
                if (item.Selected == true)
                {
                    var listip = IPAddressPoolBLO.Current.GetAllIP();
                    for (var j = 0; j < listip.Count; j++)
                    {
                        if (listip[j].NetworkIP == item.Value)
                        {
                            listip[j].StatusCode = Constants.StatusCode.IP_DEACTIVATE;
                            IPAddressPoolDAO.Current.Update(listip[j]);
                        }
                    }

                }
            }
            result.Success = true;
            return Json(result);
        }
        [HttpPost]
        public ActionResult Index(IPIndexViewModel iivm)
        {
                if (iivm.Action == "Deactive")
                {
                    for (var i = 0; i < iivm.NetIPAvai.Count; i++)
                    {
                        var item = iivm.NetIPAvai[i];
                        if (item.Selected == true)
                        {
                            var listip = IPAddressPoolBLO.Current.GetAllIP();
                            for (var j = 0; j < listip.Count; j++)
                            {
                                if (listip[j].NetworkIP == item.Value)
                                {
                                    listip[j].StatusCode = Constants.StatusCode.IP_DEACTIVATE;
                                    IPAddressPoolDAO.Current.Update(listip[j]);
                                }
                            }
                            
                        }
                    }
                   
                return RedirectToAction("Index", new { Message = "IP Addresses were deativated!" });
            }
                else
                {             
                        return RedirectToAction("Index");    
                }
        }

        [HttpPost]
        public ActionResult BlockIP(IPIndexViewModel iivm)
        {
            //int? id = ipid.ToInt();
           
            var ip = new IPAddressPool();
            ip = IPAddressPoolBLO.Current.GetById(iivm.Id);
            if (ip.StatusCode == Constants.StatusCode.IP_AVAILABLE)
            {
                ip.StatusCode = Constants.StatusCode.IP_BLOCKED;
                IPAddressPoolDAO.Current.AddOrUpdate(ip);
                var log = new Log();
                log.TypeOfLog = Constants.TypeOfLog.LOG_BLOCK_IP;
                log.Object = Constants.Object.OBJECT_IP;
                log.ChangedValueOfObject = ip.IPAddress;
                log.ObjectStatus = Constants.StatusCode.IP_BLOCKED;
                log.LogTime = DateTime.Now;
                log.Description = iivm.Description;
                LogBLO.Current.Add(log);              
                return RedirectToAction("Index",  new { Message = "IP Address was blocked!" });
            }
            else
            {               
                return RedirectToAction("Index", new {FailBlock ="IP Address was blocked already!"});
            }
            
        }

        [HttpPost]
        public ActionResult UnblockIP(IPIndexViewModel iivm)
        {
            var ip = new IPAddressPool();
            ip = IPAddressPoolBLO.Current.GetById(iivm.Id);
            if (ip.StatusCode == Constants.StatusCode.IP_BLOCKED)
            {
                ip.StatusCode = Constants.StatusCode.IP_AVAILABLE;
                IPAddressPoolDAO.Current.Update(ip);
                var blockip = LogBLO.Current.GetBlockedIP(ip.IPAddress).FirstOrDefault();

                var log = new Log();
                log.TypeOfLog = Constants.TypeOfLog.LOG_UNBLOCK_IP;
                log.Object = Constants.Object.OBJECT_IP;
                log.ChangedValueOfObject = ip.IPAddress;
                log.ObjectStatus = Constants.StatusCode.IP_AVAILABLE;
                log.Description = iivm.Description;
                log.LogTime = DateTime.Now;
                log.PreviousId = blockip.Id;
                LogBLO.Current.Add(log);
                return RedirectToAction("Index", new {Message = "IP Address was unblocked!"});
            }
            else
            {
                return RedirectToAction("Index", new { FailUnBlock = "IP Address was unblocked already!" });
            }
        }

        public ActionResult AssignIP(string rType, string rCode, string OldIP, string ServerCode,string FailMessage)
        {
            var data = new IPCreateViewModel();
            data.RequestCode = rCode;
            data.OldIP = OldIP;
            data.ServerCode = ServerCode;
            data.FailMessage = FailMessage;
            var ips = IPAddressPoolBLO.Current.GetAvailableIPs();
            var listNetworkIP =
                ips.OrderBy(x => x.NetworkIP).GroupBy(x => x.NetworkIP).Select(x => x.FirstOrDefault());
            data.NetworkIPs = listNetworkIP.Select(x => new SelectListItem
            {
                Value = x.NetworkIP,
                Text = "Network " + x.NetworkIP
            }).ToList();
            return View(data);
        }

        [HttpPost]
        public ActionResult AssignIP(IPCreateViewModel icvm)
        {
            if (icvm.NewIP == null)
            {
                return RedirectToAction("AssignIP",new {rCode = icvm.RequestCode, OldIP = icvm.OldIP, ServerCode = icvm.ServerCode, FailMessage ="Select IP to assign!"});
            }
            var ip = IPAddressPoolBLO.Current.GetByKeys(new IPAddressPool { IPAddress = icvm.NewIP });
            if (ip.StatusCode == Constants.StatusCode.IP_USED)
            {
                return RedirectToAction("AssignIP",new {rCode = icvm.RequestCode, OldIP = icvm.OldIP, ServerCode = icvm.ServerCode, FailMessage ="Assign IP Fail! Try Again!"});
            }

            var x = IPAddressPoolBLO.Current.UpdateIP(icvm.ServerCode, icvm.NewIP, icvm.RequestCode, icvm.OldIP);
            if (x == false)
            {
                return RedirectToAction("AssignIP", new {rCode = icvm.RequestCode, OldIP = icvm.OldIP, ServerCode = icvm.ServerCode, FailMessage ="Assign IP Fail! Try Again!" });
            }
            else
            {
                return RedirectToAction("Detail", "ProcessRequest", new { code = icvm.RequestCode });
            }

            
        }
    }
}