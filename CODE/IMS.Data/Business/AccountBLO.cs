using System.Collections.Generic;
using System.Net.Mail;
using IMS.Core;
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

        public virtual string GeneratePassword()
        {
            return dao.GeneratePassword();
        }

        public List<AccountExtendedModel> GetAllAccount()
        {
            return dao.GetAllAccount();
        }

        public bool SendAccountInfo(Account model)
        {
            string smtpUsername = Constants.SendMail.FROM_EMAIL_USERNAME;
            string smtpPassword = Constants.SendMail.FROM_EMAIL_PASSWORD;
            string smtpHost = Constants.SendMail.SMTP_HOST;
            int smtpPort = Constants.SendMail.SMTP_PORT;
            string subject = Constants.SendMail.SUBJECT_NEWACCOUNT;

            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient(smtpHost);

            mail.From = new MailAddress(smtpUsername);
            mail.To.Add(model.Email);
            mail.Subject = subject;
            mail.IsBodyHtml = true;
            string mainMessage = "Your account is: <br/>Username: <b>" + model.Username + "</b><br/> Password: <b>" + model.Password + "</b><br/>" +
                                 "Now you can use IMS-Datacenter website with this account at: <a href=# >IMS Datacenter</a> ";
            string htmlBody =
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

        public Account GetAccountByCode(string username)
        {
            return dao.GetAccountByCode(username);
        }
    }
}
