﻿using System;
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
            var accounts = AccountBLO.Current.GetAll();
            var acc =
                accounts.Select(x => x).Where(x => x.Status == true && ((x.Role == "Staff") ||(x.Role == "Shift Head")));
            data.Count = acc.Count();
            var roles = RoleBLO.Current.GetAll().Select(x => x.RoleName).ToList();
            data.Roles = roles.Select(x => new SelectListItem {Value = x, Text = x}).ToList();
            data.UserLogin = GetCurrentUserName();
            data.RoleLogin = GetCurrentUserRole();
            return View(data);
        }

        public ActionResult Login()
        {
            var returnUrl = Request.QueryString["ReturnUrl"];
            var data = new AccountLoginViewModel();
            data.ReturnUrl = returnUrl;
            return View(data);
        }

        [HttpPost]
        public ActionResult Login(AccountLoginViewModel q)
        {
            Account o = AccountDAO.Current.Query(x => x.Username == q.UserName && x.Password == q.Password).FirstOrDefault();
            if (o != null)
            {
                FormsAuthentication.SetAuthCookie(q.UserName, false);

                //save account to session
                Session[Constants.Session.USER_LOGIN] = o;

                if (string.IsNullOrEmpty(q.ReturnUrl))
                {
                    return RedirectToAction("Index", "Notification");
                }
                return Redirect(q.ReturnUrl);
            }

            return View(q);
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
                account.GroupCode = Constants.GroupName.CUSTOMER;
                account.Status = true;
                account.Password = AccountBLO.Current.GeneratePassword();         
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

        public ActionResult ViewProfile(string username)
        {
            Account account = AccountBLO.Current.GetAccountByCode(username);
            if (account == null)
            {
                return HttpNotFound();
            }
            var accountviewmodel = Mapper.Map<Account, AccountCreateViewModel>(account);
            accountviewmodel.UserLogin = GetCurrentUserName();
            return View(accountviewmodel);
        }

        [HttpPost]
        public ActionResult ViewProfile(AccountCreateViewModel acvm)
        {
            if (acvm.Button == "EditCustomer")
            {
            
                var account = AccountBLO.Current.GetAccountByCode(acvm.Username);
                account.Address = acvm.Address;
                account.Email = acvm.Email;
                account.Fullname = acvm.Fullname;
                account.Company = acvm.Company;
                account.Identification = acvm.Identification;
                account.Phone = acvm.Phone;
                AccountDAO.Current.Update(account);
            }

        return RedirectToAction("ViewProfile", new {username = acvm.Username});
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
