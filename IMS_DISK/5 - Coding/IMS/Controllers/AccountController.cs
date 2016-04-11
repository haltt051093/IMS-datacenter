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
        public ActionResult Index(string role, string roleSearch, string Message)
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
            data.SuccessMessage = Message;
            return View(data);
        }

        public ActionResult Login(string Message, string FailMessage)
        {
            var returnUrl = Request.QueryString["ReturnUrl"];
            var data = new AccountLoginViewModel();
            data.SuccessMessage = Message;
            data.ReturnUrl = returnUrl;
            data.FailMessage = FailMessage;
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
                if (count[i].CountMember < 3 && count[i].GroupCode!="Admin")
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
                
                return RedirectToAction("Index", new {Message ="New Staff was added!"});
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
            
                return RedirectToAction("Index", new {Message = "New customer was added!"});
            }
            return View(accountCreateViewModel);
        }

        public ActionResult EditAccount(string username)
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
        public ActionResult EditAccount(AccountCreateViewModel acvm)
        {
            var account = AccountBLO.Current.GetAccountByCode(acvm.Username);
            account.Address = acvm.Address;
            account.Email = acvm.Email;
            account.Fullname = acvm.Fullname;
            account.Company = acvm.Company;
            account.Identification = acvm.Identification;
            account.Phone = acvm.Phone;
            AccountBLO.Current.Update(account);
         
            return RedirectToAction("ViewProfile", new {username = acvm.Username, Message ="Profile was updated!"});
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

            var count = AccountBLO.Current.GetCountMemberOfGroup();
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
            AccountBLO.Current.Update(account);
       
            return RedirectToAction("ViewProfile", new { username = viewmodel.Username, Message ="Profile was updated!" });
        }


   

        public ActionResult ViewProfile(string username, string Message)
        {
            Account account = AccountBLO.Current.GetAccountByCode(username);
            if (account == null)
            {
                return HttpNotFound();
            }
            var accountviewmodel = Mapper.Map<Account, AccountCreateViewModel>(account);
            accountviewmodel.UserLogin = GetCurrentUserName();
            accountviewmodel.RoleLogin = GetCurrentUserRole();
            accountviewmodel.SuccessMessage = Message;
            return View(accountviewmodel);
        }

        [HttpPost]
        public ActionResult ViewProfile(AccountCreateViewModel acvm)
        {
            var mess = "";
            if (acvm.Button == "Deactivate")
            {
            
                var account = AccountBLO.Current.GetAccountByCode(acvm.Username);
                account.Status = false;
                AccountBLO.Current.Update(account);
                mess = "Account was deativated!";
            }
            if (acvm.Button == "Activate")
            {
                var account = AccountBLO.Current.GetAccountByCode(acvm.Username);
                account.Status = true;
                AccountBLO.Current.Update(account);
                mess = "Account was activated!";
            }

        return RedirectToAction("ViewProfile", new {username = acvm.Username, Message = mess});
        }

        public ActionResult GetForgotPassword()
        {
            return View("ForgotPassword");
        }

        [HttpPost]
        public ActionResult PostForgotPassword(AccountLoginViewModel fpvm)
        {
            Account o = AccountDAO.Current.Query(x => x.Email == fpvm.Email).FirstOrDefault();
            if (o != null)
            {
                var newpw = AccountBLO.Current.GeneratePassword();
                o.Password = newpw;
                AccountBLO.Current.AddOrUpdate(o);
                AccountBLO.Current.SendAccountInfo(o);
         
                return RedirectToAction("Login", new { Message = "Your password was reseted! Please check email!"});
            }
            else
            {
               
                return RedirectToAction("Login", new { FailMessage = "Email is not existed!" });
            }

        }


        public ActionResult GetChangePW(string FailMessage)
        {
            var data = new ChangePasswordViewModel();
            data.UserLogin = GetCurrentUserName();
            data.FailMessage = FailMessage;
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
                        return RedirectToAction("ViewProfile",new {username = obj.Username, Message ="Your password was changed!"});
                    }
                    else
                    {
                                     
                        return RedirectToAction("GetChangePW",new {FailMessage = "Old password wrong!!!" });
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
