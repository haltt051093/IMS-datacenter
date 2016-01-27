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
            IEnumerable<AccountIndexViewModel> AccountViewModels = new List<AccountIndexViewModel>();
            var Accounts = AccountBLO.Current.GetAll();
            // su dung mapping cho list
            AccountViewModels = Mapper.Map<List<Account>,
            List<AccountIndexViewModel>>(Accounts);
            return View(AccountViewModels);
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
                // su dung mapping cho list
                var account = Mapper.Map<AccountCreateViewModel, Account>(accountCreateViewModel);
                AccountBLO.Current.Add(account);
                //save to ShiftGroup table
                ShiftGroup group = accountCreateViewModel.Group;
                group.StaffId = account.AccountId;
                ShiftGroupBLO.Current.Add(group);
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
                //account.Password = AccountBLO.Current.GeneratePassword();
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
            Account account = AccountBLO.Current.Get(id);
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
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
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
