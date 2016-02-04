using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using AutoMapper;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;
using IMS.Models;

namespace IMS.Controllers
{

    public class AccountController : Controller
    {
        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult Login(Account account)
        {
            // gioi han tg login, ko cho login persistant
            // expiration = 30 days
            bool isPersistent = false;
            var o = AccountDAO.Current.Query(x => x.Username == account.Username && x.Password == account.Password).FirstOrDefault();
            if (o != null)
            {
                //Hoi lai FormAuthenticationTicket la gi
                //FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1,
                //                                    account.Username,
                //                                    DateTime.Now,
                //                                    DateTime.Now.AddMinutes(30),
                //                                    isPersistent,
                //                                    FormsAuthentication.FormsCookiePath);

                //// Encrypt the ticket.
                //string encTicket = FormsAuthentication.Encrypt(ticket);
                //// Create the cookie.
                //Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, encTicket));
                //// Redirect back to original URL.
                //Response.Redirect(FormsAuthentication.GetRedirectUrl(account.Username, isPersistent));


                FormsAuthentication.SetAuthCookie(account.Username, false);
                return RedirectToAction("Index", "Account");
            }
            return View();
        }

        [Authorize(Roles = "Staff,Shift Head,Manager")]
        // GET: Account
        public ActionResult Index()
        {
            var data = new AccountIndexViewModel();
            data.Accounts = AccountBLO.Current.GetAllAccount();
            return View(data);
        }

        [Authorize(Roles = "Manager")]
        // GET: Account/Create
        public ActionResult CreateCustomer()
        {
            return View("CreateCustomer");
        }

        [Authorize(Roles = "Manager")]
        public ActionResult CreateStaff()
        {
            return View("CreateStaff");
        }

        // POST: Account/CreateStaff
        [HttpPost]
        public ActionResult CreateStaff(AccountCreateViewModel accountCreateViewModel)
        {
            if (ModelState.IsValid)
            {
                var account = Mapper.Map<AccountCreateViewModel, Account>(accountCreateViewModel);
                AccountBLO.Current.Add(account);
                //send account info to login to the system
                bool result = AccountBLO.Current.SendAccountInfo(account);
                if (result)
                {
                    //ModelState.AddModelError("", "Send mail successfully");
                    return RedirectToAction("Index");
                }
                return RedirectToAction("Index");
            }
            return View(accountCreateViewModel);
        }

        //POST: Account/CreateCustomer
        //Doing
        [HttpPost]
        public ActionResult CreateCustomer(AccountCreateViewModel accountCreateViewModel)
        {
            if (ModelState.IsValid)
            {
                // su dung mapping cho list
                var account = Mapper.Map<AccountCreateViewModel, Account>(accountCreateViewModel);
                account.Role = "Customer";
                account.GroupName = "No Group";
                AccountBLO.Current.Add(account);
                //send account info to login to the system
                bool result = AccountBLO.Current.SendAccountInfo(account);
                if (result)
                {
                    //ModelState.AddModelError("", "Send mail successfully");
                    return RedirectToAction("Index");
                }
            }
            return View(accountCreateViewModel);
        }

        [Authorize(Roles = "Manager")]
        // GET: Account/Edit/5
        public ActionResult EditStaff(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Account account = AccountBLO.Current.GetById(id);
            if (account == null)
            {
                return HttpNotFound();
            }
            var accountviewmodel = Mapper.Map<Account, AccountCreateViewModel>(account);
            return View(accountviewmodel);
        }

        [Authorize(Roles = "Manager")]
        // GET: Account/Edit/5
        public ActionResult EditCustomer(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Account account = AccountBLO.Current.GetById(id);
            if (account == null)
            {
                return HttpNotFound();
            }
            var accountviewmodel = Mapper.Map<Account, AccountCreateViewModel>(account);
            return View(accountviewmodel);
        }

        // POST: Account/Edit/5
        [HttpPost]
        public ActionResult EditStaff(AccountCreateViewModel viewmodel)
        {
            Account account = Mapper.Map<AccountCreateViewModel, Account>(viewmodel);
            AccountBLO.Current.AddOrUpdate(account);
            return RedirectToAction("Index");
        }

        // POST: Account/Edit/5
        [HttpPost]
        public ActionResult EditCustomer(AccountCreateViewModel viewmodel)
        {
            Account account = Mapper.Map<AccountCreateViewModel, Account>(viewmodel);
            account.GroupName = "Customer";
            account.GroupName = "No Group";
            AccountBLO.Current.AddOrUpdate(account);

            return RedirectToAction("Index");
        }

        //// GET: Account/Delete/5
        //public ActionResult Delete(int id)
        //{
        //    AccountBLO.Current.Remove(new Account() {Id = id});
        //    return RedirectToAction("Index");
        //}

        public ActionResult ViewProfile(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Account account = AccountBLO.Current.GetById(id);
            if (account == null)
            {
                return HttpNotFound();
            }
            var accountviewmodel = Mapper.Map<Account, AccountCreateViewModel>(account);
            return View(accountviewmodel);
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }
    }
}
