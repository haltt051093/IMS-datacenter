using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.WebPages;
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
        [Authorize(Roles = "Staff,Shift Head,Manager")]
        public ActionResult Index(string role, string roleSearch, string message)
        {
            ViewBag.CreateStaff = null;
            if (role == null)
            {
                if (Session[Constants.Session.USER_LOGIN] != null)
                {
                    var obj = Session[Constants.Session.USER_LOGIN];
                    Account a = (Account)obj;
                    role = a.Role;
                }
                else
                {
                    return View("Login");
                }
            }
            {
                if (("staff").Equals(message))
                {
                    ViewBag.CreateStaff = "This group exist two Staff";
                }
                else
                {
                    ViewBag.CreateStaff = "This group exist one Shift Head";
                }

            }
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
                else if (role.Equals("Staff"))
                {
                    for (int i = 0; i < lstall.Count; i++)
                    {
                        if (!lstall[i].Role.IsNullOrWhiteSpace())
                        {
                            if (lstall[i].Role.Equals("Customer"))
                            {
                                rs.Add(lstall[i]);
                            }
                        }

                    }
                }
                else if (role.Equals("Shift Head"))
                {
                    for (int i = 0; i < lstall.Count; i++)
                    {
                        if (!lstall[i].Role.IsNullOrWhiteSpace())
                        {
                            if (lstall[i].Role.Equals("Customer"))
                            {
                                rs.Add(lstall[i]);
                            }
                        }

                    }

                }

            }
            if (roleSearch != null && (!("Get All").Equals(roleSearch)))
            {
                List<Account> ls = new List<Account>();
                ls = (from f in rs
                      where f.Role.Equals(roleSearch)
                      select f).ToList();
                data.ListAccount = ls;
            }
            else
            {
                data.ListAccount = rs;
            }

            return View(data);
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
                FormsAuthentication.SetAuthCookie(account.Username, false);

                //save account to session
                if (Session[Constants.Session.USER_LOGIN] == null)
                {
                    Session[Constants.Session.USER_LOGIN] = o;
                }
                string role = o.Role;
                if (role == "Customer")
                {
                    return RedirectToAction("Index", "Home", new { id = o.Id });
                }
                return RedirectToAction("ListNotifications", "Request", new { role = role });
            }
            //else
            return View();
        }

        [Authorize(Roles = "Staff,Shift Head,Manager")]
        // GET: Account
        //public ActionResult Index(string role)
        //{
        //    return RedirectToAction("Index", "Account");
        //}

        [Authorize(Roles = "Manager")]
        // GET: Account/Create
        public ActionResult CreateCustomer()
        {
            return View("Index");
        }

        [Authorize(Roles = "Manager")]
        public ActionResult CreateStaff()
        {
            return View("Index");
        }

        // POST: Account/CreateStaff
        [HttpPost]
        public ActionResult CreateStaff(AccountCreateViewModel accountCreateViewModel)
        {
            if (ModelState.IsValid)
            {
                List<Account> lstall = AccountDAO.Current.GetAll();

                var account = Mapper.Map<AccountCreateViewModel, Account>(accountCreateViewModel);
                var checkStaff = lstall.Where(c => c.GroupCode == account.GroupCode && c.Role == "Staff").Where(c => c.Status == true).Count();
                var checkShift = lstall.Where(c => c.GroupCode == account.GroupCode && c.Role == "Shift Head").Where(c => c.Status == true).Count();
                var FailCreate = "";
                if (("Staff").Equals(account.Role))
                {
                    if (checkStaff < 2)
                    {
                        AccountBLO.Current.Add(account);
                    }
                    else
                    {
                        FailCreate = "staff";
                    }
                }
                else
                {
                    if (checkShift < 1)
                    {
                        AccountBLO.Current.Add(account);
                    }
                    else
                    {
                        FailCreate = "shifthead";
                    }
                }

                //send account info to login to the system
                //bool result = AccountBLO.Current.SendAccountInfo(account);
                //if (result)
                //{
                //    //ModelState.AddModelError("", "Send mail successfully");
                //    //return RedirectToAction("Index2");
                //}
                return RedirectToAction("Index", new { message = FailCreate });
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
                //bool result = AccountBLO.Current.SendAccountInfo(account);
                //if (result)
                //{
                //    //ModelState.AddModelError("", "Send mail successfully");
                //    return RedirectToAction("Index");
                //}
                return RedirectToAction("Index");
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
                Account a = (Account)obj;
                role = a.Role;
            }
            return RedirectToAction("Index", "Account", new { role = role });
        }

        // POST: Account/Edit/5
        [HttpPost]
        public ActionResult EditCustomer(AccountCreateViewModel viewmodel)
        {
            Account account = Mapper.Map<AccountCreateViewModel, Account>(viewmodel);
            account.Role = Constants.Role.CUSTOMER;
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

        [HttpPost]
        public ActionResult SearchByRole(string roleName)
        {
            return RedirectToAction("Index", "Account", new { roleSearch = roleName });
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
                    Account a = (Account)obj;

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
