using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using System.Web.Security;
using AutoMapper;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;
using IMS.Models;
using Microsoft.Ajax.Utilities;

namespace IMS.Controllers
{

    public class AccountController : CoreController
    {
        public ActionResult Index2()
        {
            return View();
        }

        public ActionResult Login2()
        {
            return View();
        }

        public ActionResult ViewProfile2()
        {
            return View();
        }
        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }

        [AllowAnonymous]


        [HttpPost]
        public ActionResult Login(Account account)
        {
            Account o = AccountDAO.Current.Query(x => x.Username == account.Username && x.Password == account.Password).FirstOrDefault();
            if (o != null)
            {
                // gioi han tg login, ko cho login persistant
                // expiration = 30 days
                //bool isPersistent = false;
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

                //save account to session
                if (Session[Constants.Session.USER_LOGIN] == null)
                {
                    Session[Constants.Session.USER_LOGIN] = o;
                }
                string role = o.Role;
                return RedirectToAction("Index", "Account", new {role = role});
            }
            //else
            return View();
        }

        [Authorize(Roles = "Staff,Shift Head,Manager")]
        // GET: Account
        public ActionResult Index(string role)
        {
            var data = new AccountIndexViewModel();
            //data.Accounts = AccountBLO.Current.GetAllAccount();
            List<Account> lstall = AccountDAO.Current.GetAll();
            List<Account> rs = new List<Account>();
            if (role != null)
            {
                if (role.Equals("Manager"))
                {
                    rs = lstall;
                }
                else if (role.Equals("Shift Head"))
                {
                    for (int i = 0; i < lstall.Count; i++)
                    {
                        if (!lstall[i].Role.IsNullOrWhiteSpace())
                        {
                            if (lstall[i].Role.Equals("Shift Head"))
                            {
                                rs.Add(lstall[i]);

                            }
                        }

                    }

                }
                else if (role.Equals("Staff"))
                {
                    for (int i = 0; i < lstall.Count; i++)
                    {
                        if (lstall[i].Role.Equals("Staff"))
                        {
                            rs.Add(lstall[i]);

                        }

                    }
                }
            }
            data.ListAccount = rs;
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
                account.Role = Constants.Role.CUSTOMER;
                account.GroupCode = Constants.GroupName.NO_GROUP;
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
            ViewBag.role = account.Role;
            var accountviewmodel = Mapper.Map<Account, AccountCreateViewModel>(account);
            return View(accountviewmodel);
        }

        [Authorize(Roles = Constants.Role.MANAGER)]
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

            string role = "";
            if (Session[Constants.Session.USER_LOGIN] != null)
            {
                var obj = Session[Constants.Session.USER_LOGIN];
                Account a = (Account) obj;
                role = a.Role;
            }
            return RedirectToAction("Index", "Account", new { role = role });
        }

        // POST: Account/Edit/5
        [HttpPost]
        public ActionResult EditCustomer(AccountCreateViewModel viewmodel)
        {
            Account account = Mapper.Map<AccountCreateViewModel, Account>(viewmodel);
            account.GroupCode = Constants.Role.CUSTOMER;
            account.GroupCode = Constants.GroupName.NO_GROUP;
            AccountBLO.Current.AddOrUpdate(account);

            string role = "";
            if (Session[Constants.Session.USER_LOGIN] != null)
            {
                var obj = Session[Constants.Session.USER_LOGIN];
                Account a = (Account)obj;
                role = a.Role;
            }
            return RedirectToAction("Index", "Account", new { role = role });
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

        public ActionResult GetForgotPassword()
        {
            return View("ForgotPassword");
        }

        [HttpPost]
        public ActionResult PostForgotPassword(Account account)
        {
            Account o = AccountDAO.Current.Query(x => x.Email == account.Email).FirstOrDefault();
            if (o != null)
            {
                var newpw = AccountBLO.Current.GeneratePassword();
                o.Password = newpw;
                AccountBLO.Current.AddOrUpdate(o);
                //AccountBLO.Current.SendPasswordInfo(o);
                ViewBag.FGPW = "Reset password successfully";
            }
            else
            {
                //email not exist
                ViewBag.FGPW = "";
            }

            return View("ForgotPWSuccess");
        }

        public ActionResult GetChangePW()
        {
            return View("ChangePassword");
        }

        [HttpPost]
        public ActionResult PostChangePW(string oldpassword, string newpassword, string confirmpassword)
        {
            if (newpassword.Equals(confirmpassword))
            {
                if (Session[Constants.Session.USER_LOGIN] != null)
                {
                    var obj = Session[Constants.Session.USER_LOGIN];
                    Account a = (Account) obj;

                    if (oldpassword.Equals(a.Password))
                    {
                        a.Password = newpassword;
                        AccountBLO.Current.AddOrUpdate(a);
                    }
                    else
                    {
                        ViewBag.password = "Old password wrong.";
                    }
                }
            }
            else
            {
                ViewBag.confirm = "Confirm Password not match with new password";
            }
            
            return View("ChangePassword");
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session[Constants.Session.USER_LOGIN] = null;
            return RedirectToAction("Index", "Home");
        }
    }
}
