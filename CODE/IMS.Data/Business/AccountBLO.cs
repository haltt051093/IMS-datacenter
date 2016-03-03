using System.Collections.Generic;
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
            string emailTo = model.Email;
            string subject = Constants.SendMail.SUBJECT_NEWACCOUNT;
            string message = "Your account is: " + model.Username + " and password: " + model.Password;
            string body =
                string.Format("ban vua nhan duoc lien he tu: <b>{0}</b><br/>Email: {1}<br/>Noi dung: <br/>{2}",
                    Constants.SendMail.FROM_EMAIL_USERNAME, model.Email, message);
            MailService service = new MailService();
            bool kq = service.Send(smtpUsername, smtpPassword, smtpHost, smtpPort, emailTo, subject, body);
            return kq;
        }

        public Account GetAccountByCode(string username)
        {
            return dao.GetAccountByCode(username);
        }
    }
}
