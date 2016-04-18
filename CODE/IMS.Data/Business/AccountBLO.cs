using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using IMS.Core;
using IMS.Core.Express;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;

namespace IMS.Data.Business
{
    public class AccountBLO : BaseBLO<Account>
    {
        protected AccountDAO dao;
        private static AccountBLO instance;

        public static AccountBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new AccountBLO();
                }
                return instance;
            }
        }

        private AccountBLO()
        {
            baseDao = AccountDAO.Current;
            dao = AccountDAO.Current;
        }

        public List<AccountExtendedModel> GetCountMemberOfGroup()
        {
            return dao.GetCountMemberOfGroup();
        }
        public string GeneratePassword()
        {
            var password = TextExpress.Randomize(10);
            return password;
        }

        public List<AccountExtendedModel> GetAllAccount()
        {
            return dao.GetAllAccount();
        }

        public bool SendAccountInfo(Account model)
        {
            var smtpUsername = Constants.SendMail.FROM_EMAIL_USERNAME;
            var smtpPassword = Constants.SendMail.FROM_EMAIL_PASSWORD;
            var smtpHost = Constants.SendMail.SMTP_HOST;
            var smtpPort = Constants.SendMail.SMTP_PORT;
            var subject = Constants.SendMail.SUBJECT_NEWACCOUNT;

            var mail = new MailMessage();
            var SmtpServer = new SmtpClient(smtpHost);

            mail.From = new MailAddress(smtpUsername);
            mail.To.Add(model.Email);
            mail.Subject = subject;
            mail.IsBodyHtml = true;
            var mainMessage = "Your account is: <br/>Username: <b>" + model.Username + "</b><br/> Password: <b>" + model.Password + "</b><br/>" +
                                 "Now you can use IMS-Datacenter website with this account at: <a href=# >IMS Datacenter</a> ";
            var htmlBody =
                string.Format("You've received an email from IMS Datacenter of QTSC<br/> " +
                              "We want to account that you registered successfully to our IMS system<br/>{0}",
                    mainMessage);
            mail.Body = htmlBody;
            SmtpServer.Port = smtpPort;
            SmtpServer.Credentials = new System.Net.NetworkCredential(smtpUsername, smtpPassword);
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
            return true;
        }

        public Account GetAccountByCode(string q)
        {
            return dao.GetByKeys(new Account { Username = q });
        }

        public List<Account> GetAccountsByGroup(string groupCode)
        {
            var result = dao.Query(x => x.GroupCode == groupCode && x.Status == true)
                .ToList();
            return result;
        }

        public List<AccountExtendedModel> GetAllStaff(string group)
        {
            var shifthead = dao.Query(x => x.GroupCode == group && x.Role == Constants.Role.SHIFT_HEAD).FirstOrDefault();
            var result = dao.Query(x => x.Role == Constants.Role.STAFF).OrderBy(x => x.GroupCode);

            var list = new List<AccountExtendedModel>();
            foreach (var item in result)
            {
                var account = new AccountExtendedModel();
                if (item.GroupCode == group)
                {

                }
                account.Username = item.Username;
                account.NameAndGroup = item.Fullname + " - " + item.GroupCode;
                account.Role = item.Role;
                account.GroupCode = item.GroupCode;
                list.Add(account);
            }
            if (shifthead != null)
            {
                var account = new AccountExtendedModel();
                account.Username = shifthead.Username;
                account.NameAndGroup = shifthead.Fullname + " - " + group;
                account.Role = shifthead.Role;
                account.GroupCode = group;
                list.Add(account);
            }
            int count = 0;
            var list1 = new List<AccountExtendedModel>();
            for (int i = 0; i < list.Count(); i++)
            {
                if (list[i].GroupCode == group)
                {
                    var temp = list[i];
                    list.Remove(list[i]);
                    list.Insert(count, temp);
                    count = count + 1;
                }
            }
            return list;
        }

        public CustomerInfoModel GeCustomerInfo(string username)
        {
            var account = from a in AccountDAO.Current.Table
                          where a.Username == username
                          select new CustomerInfoModel()
                          {
                              Company = a.Company,
                              Customer = a.Username,
                              CustomerName = a.Fullname,
                              Phone = a.Phone
                          };
            return account.FirstOrDefault();
        }

        public Account GetActiveShiftHead()
        {
            var activeGroup = AssignedShiftBLO.Current.GetActiveGroup();
            var shifthead = from a in dao.Table
                            where a.GroupCode == activeGroup && a.Role == Constants.Role.SHIFT_HEAD
                            select a;
            return shifthead.FirstOrDefault();
        }
    }
}
