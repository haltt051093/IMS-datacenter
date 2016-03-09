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
            var ips = IPAddressPoolBLO.Current.GetAllIP();
            var ipuse = ips.Select(x => x).Where(x => x.StatusCode != "STATUS35");
            var data = new IPIndexViewModel();

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
        // GET: IP
        //public ActionResult Index(string GatewaySearch, string StatusSearch)
        //{
        //    var ips = IPAddressPoolBLO.Current.GetAllIP();
        //    var data = new IPIndexViewModel();

        //    var status = new List<string>();
        //    var currentstatus = IPAddressPoolBLO.Current.GetIPStatus().ToList();
        //    status.AddRange(currentstatus.Distinct());
        //    ViewBag.StatusSearch = new SelectList(status);

        //    var gateways = new List<string>();
        //    var currentgateway = ips.OrderBy(x => x.Gateway).Select(x => x.Gateway).ToList();
        //    gateways.AddRange(currentgateway.Distinct());
        //    ViewBag.GatewaySearch = new SelectList(gateways);

        //    if (!String.IsNullOrEmpty(StatusSearch))
        //    {
        //        ips = ips.Where(st => st.StatusName.Trim() == StatusSearch.Trim()).ToList();
        //    }

        //    if (!String.IsNullOrWhiteSpace(GatewaySearch))
        //    {
        //        ips = ips.Where(r => r.Gateway.Trim() == GatewaySearch.Trim()).ToList();
        //    }
        //    data.IPs = ips;
        //    return View(data);
        //}
        //public ActionResult CreateIP()
        //{
        //    return View();
        //}

        [HttpPost]
        public ActionResult Index2(IPIndexViewModel iivm)
        {
            

                if (iivm.Action == "Deactive")
                {
                    for (int i = 0; i < iivm.NetworkIPs.Count; i++)
                    {
                        var item = iivm.NetworkIPs[i];
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
                }
                else
                {
                    var ips = IPAddressPoolBLO.Current.GenerateIP(iivm.Address, iivm.Netmask);
                    var gateway = IPAddressPoolBLO.Current.GenerateIP(iivm.Address, iivm.Netmask).FirstOrDefault().Gateway;
                    var exist = IPAddressPoolDAO.Current.Query(x => x.Gateway == gateway);
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
                    if (exist.Count > 0)
                    {
                        Alert("The Network Address was existed. Please try again!");
                    }
                    else
                    {
                        IPAddressPoolBLO.Current.AddIP(ips);
                        Alert("New IP Addresses added successfully!");
                        return RedirectToAction("Index2");
                    }
                }
            

            return RedirectToAction("Index2");
        }
        public ActionResult AssignIP(string servercode, string GatewaySearch)
        {
            //IP = "192.168.0.1";
            //request = "Change";
            //request = "AddIPForNewServer";
            //request = "AssignMoreIP";
            servercode = "BJIWEHDHQ";
            //if (request == "Change")
            //{
            //    string gateway = IPAddressPoolBLO.Current.GetGatewayByIP(IP);
            //    var data = new IPIndexViewModel();
            //    data.IPs = IPAddressPoolBLO.Current.GetIPSameGateway(gateway);
            //    data.OldIP = IP;
            //    data.Request = request;
            //    data.ListNewIP = data.IPs.Select(x => new SelectListItem
            //    {
            //        Value = x.IPAddress
            //    }).ToList();
            //    return View(data);
            //}
            //else if (request == "AddIPForNewServer")
            //{
                var data = new IPIndexViewModel();
                var ips = IPAddressPoolBLO.Current.GetIPAvailable();
                data.ServerCode = servercode;
                data.ListNewIP = data.IPs.Select(x => new SelectListItem
                {
                    Value = x.IPAddress
                }).ToList();
                var gateways = new List<string>();
                var currentgateway = ips.OrderBy(x => x.Gateway).Select(x => x.Gateway).ToList();
                gateways.AddRange(currentgateway.Distinct());
                ViewBag.GatewaySearch = new SelectList(gateways);

                if (!String.IsNullOrWhiteSpace(GatewaySearch))
                {
                    ips = ips.Where(r => r.Gateway.Trim() == GatewaySearch.Trim()).ToList();
                }
                data.IPs = ips;
                return View(data);
            //}
            //else
            //{
            //    var data = new IPIndexViewModel();
            //    string gateway = IPAddressPoolBLO.Current.GetGatewayByServerCode(servercode);
            //    data.IPs = IPAddressPoolBLO.Current.GetIPSameGateway(gateway);
            //    data.Request = request;
            //    data.ServerCode = servercode;
            //    data.ListNewIP = data.IPs.Select(x => new SelectListItem
            //    {
            //        Value = x.IPAddress
            //    }).ToList();
            //    return View(data);
            //}
        }

        [HttpPost]
        public ActionResult AssignIP(IPIndexViewModel ivm)
        {
            var listNewIP = new List<string>();
            if (ivm.Request.Equals("Change"))
            {
                if (ivm.NewIP == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
            }
            if (ivm.Request.Equals("AddIPForNewServer"))
            {
                if (ivm.NewIP == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
            }
            if (ivm.Request.Equals("AssignMoreIP"))
            {
                for (int i = 0; i < ivm.ListNewIP.Count; i++)
                {
                    if (ivm.ListNewIP[i].Selected == true)
                    {
                        listNewIP.Add(ivm.ListNewIP[i].Value);
                    }
                }
                int j = 0;
                for (int i = 0; i < ivm.ListNewIP.Count; i++)
                {
                    if (ivm.ListNewIP[i].Selected == true)
                    {
                        j++;
                    }
                }
                if (j == 0)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
            }


            IPAddressPoolBLO.Current.UpdateIP(ivm.ServerCode, ivm.NewIP);
            return View();

        }
        //public ActionResult ChangeStatus(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    IPAddressPool ip = IPAddressPoolBLO.Current.GetById(id);
        //    if (ip == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    var ipviewmodel = Mapper.Map<IPAddressPool, IPChangeStatusViewModel>(ip);
        //    return View(ipviewmodel);
        //}
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
                Alert("Block IP successfully");
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
                Alert("Unblock IP successfully");
                return RedirectToAction("Index2");
            }
            return RedirectToAction("Index2");
        }
    }
}