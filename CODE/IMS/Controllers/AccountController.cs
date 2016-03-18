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

        public ActionResult CreateStaff()
        {var data = new AccountCreateViewModel();
            var listgroup = new List<SelectListItem>();
            
            var count = AccountDAO.Current.GetCountMemberOfGroup();
            for (int i = 0; i < count.Count; i++)
            {
                var list = new SelectListItem();
                if (count[i].CountMember < 3)
                {
                    list.Value = count[i].GroupCode;
                    list.Text = count[i].GroupCode;
                    listgroup.Add(list);
                }
                
            }
            data.Groups = listgroup;
            return View(data);
        }
        // POST: Account/CreateStaff
        [HttpPost]
        public ActionResult CreateStaff(AccountCreateViewModel accountCreateViewModel)
        {
            if (ModelState.IsValid)
            {
                var account = Mapper.Map<AccountCreateViewModel, Account>(accountCreateViewModel);
                account.Status = true;
                account.Password = AccountBLO.Current.GeneratePassword();
                AccountBLO.Current.Add(account);
                //send account info to login to the system
                AccountBLO.Current.SendAccountInfo(account);
                Success("Add Staff Successfully!");
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }

        [Authorize(Roles = "Staff,Shift Head,Manager")]
        public ActionResult CreateCustomer()
        {
            return View();
        }
        
        [HttpPost]
        public ActionResult CreateCustomer(CreateCustomerViewModel accountCreateViewModel)
        {
            if (ModelState.IsValid)
            {
                // su dung mapping cho list
                var account = Mapper.Map<CreateCustomerViewModel, Account>(accountCreateViewModel);
                account.Role = Constants.Role.CUSTOMER;
                account.GroupCode = Constants.GroupName.CUSTOMER;
                account.Status = true;
                account.Password = AccountBLO.Current.GeneratePassword();         
                AccountBLO.Current.Add(account);
                //send account info to login to the system
                AccountBLO.Current.SendAccountInfo(account);
                Success("Add Customer Successfully!");
                return RedirectToAction("Index");
            }
            return View(accountCreateViewModel);
        }


        [Authorize(Roles = "Staff,Shift Head,Manager")]
        public ActionResult EditCustomer(string username)
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
        // POST: Account/Edit/5
        [HttpPost]
        public ActionResult EditCustomer(AccountCreateViewModel acvm)
        {
            var account = AccountBLO.Current.GetAccountByCode(acvm.Username);
            account.Address = acvm.Address;
            account.Email = acvm.Email;
            account.Fullname = acvm.Fullname;
            account.Company = acvm.Company;
            account.Identification = acvm.Identification;
            account.Phone = acvm.Phone;
            AccountDAO.Current.Update(account);
            Success("Update Profile Successfully!");
            return RedirectToAction("ViewProfile", new {username = acvm.Username});
        }

        [Authorize(Roles = "Staff,Shift Head,Manager")]
        public ActionResult EditStaff(string username)
        {
            Account account = AccountBLO.Current.GetAccountByCode(username);
            if (account == null)
            {
                return HttpNotFound();
            }
            var accountviewmodel = Mapper.Map<Account, AccountCreateViewModel>(account);
            accountviewmodel.UserLogin = GetCurrentUserName();
            var listgroup = new List<SelectListItem>();

            var count = AccountDAO.Current.GetCountMemberOfGroup();
            for (int i = 0; i < count.Count; i++)
            {
                var list = new SelectListItem();
                if (count[i].CountMember < 3 || count[i].GroupCode==account.GroupCode)
                {
                    list.Value = count[i].GroupCode;
                    list.Text = count[i].GroupCode;
                    listgroup.Add(list);
                }

            }
            accountviewmodel.Groups = listgroup;
            return View(accountviewmodel);
        }
        // POST: Account/Edit/5
        [HttpPost]
        public ActionResult EditStaff(AccountCreateViewModel viewmodel)
        {
            var account = AccountBLO.Current.GetAccountByCode(viewmodel.Username);
            account.GroupCode = viewmodel.GroupCode;
            account.Role = viewmodel.Role;
            account.Fullname = viewmodel.Fullname;
            account.Phone = viewmodel.Phone;
            account.Address = viewmodel.Address;
            account.Identification = viewmodel.Identification;
            account.Email = viewmodel.Email;
            AccountDAO.Current.Update(account);
            Success("Update Profile Successfully!");
            return RedirectToAction("ViewProfile", new { username = viewmodel.Username });
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
            accountviewmodel.RoleLogin = GetCurrentUserRole();
            return View(accountviewmodel);
        }

        [HttpPost]
        public ActionResult ViewProfile(AccountCreateViewModel acvm)
        {
            if (acvm.Button == "Deactivate")
            {
            
                var account = AccountBLO.Current.GetAccountByCode(acvm.Username);
                account.Status = false;
                AccountDAO.Current.Update(account);
                Success("Deactiave Account Successfully!");
            }
            if (acvm.Button == "Activate")
            {
                var account = AccountBLO.Current.GetAccountByCode(acvm.Username);
                account.Status = true;
                AccountDAO.Current.Update(account);
                Success("Activate Account Successfully!");
            }

        return RedirectToAction("ViewProfile", new {username = acvm.Username});
        }

        public ActionResult GetForgotPassword()
        {
            return View("ForgotPassword");
        }

        [HttpPost]
        public ActionResult PostForgotPassword(ForgotPasswordViewModel fpvm)
        {
            Account o = AccountDAO.Current.Query(x => x.Email == fpvm.Email).FirstOrDefault();
            if (o != null)
            {
                var newpw = AccountBLO.Current.GeneratePassword();
                o.Password = newpw;
                AccountBLO.Current.AddOrUpdate(o);
                AccountBLO.Current.SendAccountInfo(o);
                Success("Reset passwork successfully! Please check your email!");
                return View("Login");
            }
            else
            {
                Alert("Email is not existed!");
                return View("ForgotPassword");
            }

        }


        public ActionResult GetChangePW()
        {
            var data = new ChangePasswordViewModel();
            data.UserLogin = GetCurrentUserName();
            return View("ChangePassword",data);
        }

        [HttpPost]
        public ActionResult PostChangePW(ChangePasswordViewModel cpvm)
        {

            var obj = GetCurrentAccount();
            Account o = AccountDAO.Current.Query(x => x.Username ==obj.Username).FirstOrDefault();

                    if (cpvm.Password.Equals(o.Password))
                    {
                        o.Password = cpvm.NewPassword;
                        AccountBLO.Current.AddOrUpdate(o);
                        Success("Change Password Successfully!");
                        return RedirectToAction("ViewProfile",new {username = obj.Username});
                    }
                    else
                    {
                        Alert("Old password wrong!!");
                        return View("ChangePassword");
                    }     
            
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session[Constants.Session.USER_LOGIN] = null;
            return RedirectToAction("Index", "Home");
        }

       
    }
}
