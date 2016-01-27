using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AutoMapper;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Models;

namespace IMS.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult Index()
        {
            var data = new AccountIndexViewModel();
            data.Accounts = AccountBLO.Current.GetAllAccount();
            return View(data);
        }


        // GET: Account/Create
        public ActionResult CreateCustomer()
        {
            return View("CreateCustomer");
        }

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
                AccountBLO.Current.Add(account);
                return RedirectToAction("Index");
            }
            return View(accountCreateViewModel);
        }

        // GET: Account/Edit/5
        public ActionResult EditStaff(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Account account = AccountBLO.Current.GetByModel(new Account() {AccountId = id?? 0});
            if (account == null)
            {
                return HttpNotFound();
            }
            var accountviewmodel = Mapper.Map<Account, AccountCreateViewModel>(account);
            return View(accountviewmodel);
        }

        // GET: Account/Edit/5
        public ActionResult EditCustomer(int id)
        {
            return View("EditCustomer");
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
        public ActionResult EditCustomer(int id, FormCollection collection)
        {
            return View("Index");
        }

        // GET: Account/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Account/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
