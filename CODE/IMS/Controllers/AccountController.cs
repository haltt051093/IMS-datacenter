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
using IMS.Models;
using Microsoft.Ajax.Utilities;

namespace IMS.Controllers
{

    public class AccountController : CoreController
    {
        [Authorize(Roles = "Staff,Shift Head,Manager")]
        public ActionResult Index(string role, string roleSearch, string message)
        {
            var data = new AccountIndexViewModel();
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
                return RedirectToAction("Index", "Notification", new { role = role });
            }
            //else
            return View();
        }

        [Authorize(Roles = "Manager")]
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
                if (CheckExistUsername(account.Username))
                {
                    //put code handle can not create user with this username, trung ten

                    return RedirectToAction("Index");
                }
                var checkStaff = lstall.Where(c => c.GroupCode == account.GroupCode && c.Role == "Staff").Where(c => c.Status == true).Count();
                var checkShift = lstall.Where(c => c.GroupCode == account.GroupCode && c.Role == "Shift Head").Where(c => c.Status == true).Count();
                var FailCreate = "";
                if (("Staff").Equals(account.Role))
                {
                    if (checkStaff < 2)
                    {
                        AccountBLO.Current.Add(account);
                        //send account info to login to the system
                        AccountBLO.Current.SendAccountInfo(account);
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
                        //send account info to login to the system
                        AccountBLO.Current.SendAccountInfo(account);
                    }
                    else
                    {
                        FailCreate = "shifthead";
                    }
                }
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
                if (CheckExistUsername(account.Username))
                {
                    //put code handle can not create user with this username
                    return RedirectToAction("Index");
                }
                account.Role = Constants.Role.CUSTOMER;
                account.GroupCode = Constants.GroupName.NO_GROUP;
                AccountBLO.Current.Add(account);
                //send account info to login to the system
                AccountBLO.Current.SendAccountInfo(account);
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
            Account ass = AccountBLO.Current.GetById(account.Id);
            if (ass.Status == false)
            {
                account.Status = false;
            }
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
            Account ass = AccountBLO.Current.GetById(account.Id);
            if (ass.Status == false)
            {
                account.Status = false;
            }
            account.Role = Constants.Role.CUSTOMER;
            account.GroupCode = Constants.GroupName.NO_GROUP;
            AccountBLO.Current.AddOrUpdate(account);
            if (account.Status == false)
            {
                account.Status = false;
            }

            string role = "";
            if (Session[Constants.Session.USER_LOGIN] != null)
            {
                var obj = Session[Constants.Session.USER_LOGIN];
                Account a = (Account)obj;
                role = a.Role;
            }
            return RedirectToAction("Index", "Account", new { role = role });
        }

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

        private Boolean CheckExistUsername(string username)
        {
            List<Account> lstall = AccountDAO.Current.GetAll();
            var count = lstall.Where(c => c.Username == username).Count();
            if (count > 0)
            {
                return true;
            }
            return false;
        }
    }
}
