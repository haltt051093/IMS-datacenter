using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using AutoMapper;
using IMS.Core;
using IMS.Core.Extensions;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;
using IMS.Models;

namespace IMS.Controllers
{
    public class IPController : CoreController
    {
        public ActionResult Index2()
        {
            var data = new IPIndexViewModel();
            var ips = IPAddressPoolBLO.Current.GetAllIP();
            var ipuse = ips.Select(x => x).Where(x => x.StatusCode != Constants.StatusCode.IP_DEACTIVATE);
            var listnet1 = IPAddressPoolBLO.Current.GetNetworkIPToDeact();
            data.NetIPAvai = listnet1.Select(x => new SelectListItem
            {
                Value = x,
                Text = "Network " + x
            }).ToList();

            var listNetworkIP = ipuse.OrderBy(x => x.NetworkIP).GroupBy(x => x.NetworkIP).Select(x => x.FirstOrDefault()).Where(x => x.NetworkIP!=null);
            data.NetworkIPs = listNetworkIP.Select(x => new SelectListItem
            {
                Value = x.NetworkIP,
                Text = "Network " + x.NetworkIP
            }).ToList();
            var listnet = new List<SelectListItem>();
            int[] list = new int[] { 24, 25, 26, 27, 28 };
            foreach (var i in list)
            {
                string num = (i).ToString();
                SelectListItem item = new SelectListItem()
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
        public ActionResult Index2(IPIndexViewModel iivm)
        {
                if (iivm.Action == "Deactive")
                {
                    for (int i = 0; i < iivm.NetIPAvai.Count; i++)
                    {
                        var item = iivm.NetIPAvai[i];
                        if (item.Selected == true)
                        {
                            var listip = IPAddressPoolBLO.Current.GetAllIP();
                            for (int j = 0; j < listip.Count; j++)
                            {
                                if (listip[j].NetworkIP == item.Value)
                                {
                                    listip[j].StatusCode = Constants.StatusCode.IP_DEACTIVATE;
                                    IPAddressPoolDAO.Current.Update(listip[j]);
                                }
                            }
                            
                        }
                    }
                    Success("Deactivate IP Address Range Successfully!");
                return RedirectToAction("Index2");
            }
                else
                {
                    var ips = IPAddressPoolBLO.Current.GenerateIP(iivm.Address, iivm.Netmask);

                    int k = ips.Count - 1;
                    ips[k].StatusCode = Constants.StatusCode.IP_RESERVE;

                    for (int i = 0; i < ips.Count - 1; i++)
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
                        Success("New IP Addresses added successfully!");
                        return RedirectToAction("Index2");    
                }
        }

        [HttpPost]
        public ActionResult ChangeIPStatus(IPIndexViewModel iivm)
        {
            //int? id = ipid.ToInt();
           
            IPAddressPool ip = new IPAddressPool();
            ip = IPAddressPoolBLO.Current.GetById(iivm.Id);
            if (ip.StatusCode == Constants.StatusCode.IP_AVAILABLE)
            {
                ip.StatusCode = Constants.StatusCode.IP_BLOCKED;
                IPAddressPoolDAO.Current.Update(ip);
                LogChangedContent log = new LogChangedContent();
                log.TypeOfLog = Constants.TypeOfLog.LOG_BLOCK_IP;
                log.Object = Constants.Object.OBJECT_IP;
                log.ChangedValueOfObject = ip.IPAddress;
                log.ObjectStatus = Constants.StatusCode.IP_BLOCKED;
                log.LogTime = DateTime.Now;
                log.Description = iivm.Description;
                LogChangedContentDAO.Current.Add(log);
                Success("Block IP successfully");
                return RedirectToAction("Index2");
            }
            else
            if (ip.StatusCode == Constants.StatusCode.IP_BLOCKED)
            {
                ip.StatusCode = Constants.StatusCode.IP_AVAILABLE;
                IPAddressPoolDAO.Current.Update(ip);
                var blockip = LogChangedContentBLO.Current.GetBlockedIP(ip.IPAddress).FirstOrDefault();
                
                LogChangedContent log = new LogChangedContent();
                log.TypeOfLog = Constants.TypeOfLog.LOG_UNBLOCK_IP;
                log.Object = Constants.Object.OBJECT_IP;
                log.ChangedValueOfObject = ip.IPAddress;
                log.ObjectStatus = Constants.StatusCode.IP_AVAILABLE;
                log.Description = iivm.Description;
                log.LogTime = DateTime.Now;
                log.PreviousId = blockip.Id;
                LogChangedContentDAO.Current.Add(log);
                Success("Unblock IP successfully");
                return RedirectToAction("Index2");
            }
            return RedirectToAction("Index2");
        }
    }
}