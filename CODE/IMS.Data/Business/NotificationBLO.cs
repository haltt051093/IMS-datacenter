using System;
using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Core.Express;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;
using System.Net.Mail;

namespace IMS.Data.Business
{
    public class NotificationBLO : BaseBLO<Notification>
    {
        protected NotificationDAO dao;
        private static NotificationBLO instance;

        public static NotificationBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new NotificationBLO();
                }
                return instance;
            }
        }


        private NotificationBLO()
        {
            baseDao = NotificationDAO.Current;
            dao = NotificationDAO.Current;
        }

        public List<Notification> GetByUser(string username, int page = 0, int pageSize = 20)
        {
            var result = dao.Query(x => x.Username == username && x.IsViewed == false, page, pageSize).
                OrderByDescending(x => x.NotifTime);
            return result.ToList();
        }

        public int CountUserUnread(string username)
        {
            var result = dao.Query(x => x.Username == username && x.IsViewed == false);
            return result.Count;
        }

        public string AddNotification(string refCode, string refType, string username, string description)
        {
            var notifCode = GenerateCode();
            var notif = new Notification()
            {
                NotificationCode = notifCode,
                RefCode = refCode,
                RefType = refType,
                Username = username,
                Description = description,
                IsViewed = false,
                NotifTime = DateTime.Now
            };

            dao.Add(notif);
            return notifCode;
        }

        public List<Notification> ListNotification(string username)
        {
            var list = dao.Query(x => x.Username == username).ToList();
            return list;
        }

        private string GenerateCode()
        {
            var code = "N" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
            var existing = dao.Query(x => x.NotificationCode == code).FirstOrDefault();
            while (existing != null)
            {
                code = "N" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
                existing = dao.Query(x => x.NotificationCode == code).FirstOrDefault();
            }
            return code;
        }

        #region send mail to customer
        public void SendMail(string email, string mainContent, string subject)
        {
            var smtpUsername = Constants.SendMail.FROM_EMAIL_USERNAME;
            var smtpPassword = Constants.SendMail.FROM_EMAIL_PASSWORD;
            var smtpHost = Constants.SendMail.SMTP_HOST;
            var smtpPort = Constants.SendMail.SMTP_PORT;

            var mail = new MailMessage();
            var SmtpServer = new SmtpClient(smtpHost);

            mail.From = new MailAddress(smtpUsername);
            mail.To.Add(email);
            mail.Subject = subject;
            mail.IsBodyHtml = true;
            var mainMessage = mainContent;
            var htmlBody =
                string.Format("You've received an email from IMS Datacenter of QTSC<br/> " +
                              "Your request status is: <br/>{0}",
                    mainMessage);
            mail.Body = htmlBody;
            SmtpServer.Port = smtpPort;
            SmtpServer.Credentials = new System.Net.NetworkCredential(smtpUsername, smtpPassword);
            SmtpServer.EnableSsl = true;
            //SmtpServer.Send(mail);
        }

        public void SendMailAccepRequest(string requestCode)
        {
            var request = RequestBLO.Current.GetByKeys(new Request { RequestCode = requestCode });
            var customer = AccountBLO.Current.GetByKeys(new Account { Username = request.Customer });
            if (request.RequestType == Constants.RequestTypeCode.ADD_SERVER)
            {
                var content = "Your request [Add Server] at " + request.RequestedTime + " is accepted.<br/> We're looking forward to meet you at "+request.AppointmentTime+" <br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_ACCEPT);
            }
            if (request.RequestType == Constants.RequestTypeCode.BRING_SERVER_AWAY)
            {
                var content = "Your request [Bring Server Away] at " + request.RequestedTime + " is accepted.<br/> We're looking forward to meet you at " + request.AppointmentTime + " <br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_ACCEPT);
            }
            if (request.RequestType == Constants.RequestTypeCode.ASSIGN_IP)
            {
                var content = "Your request [Assign IP Address] at " + request.RequestedTime + " is accepted.<br/> We're processing it. Please wait!<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_ACCEPT);
            }
            if (request.RequestType == Constants.RequestTypeCode.CHANGE_IP)
            {
                var content = "Your request [Change IP Address] at " + request.RequestedTime + " is accepted.<br/> We're processing it. Please wait!<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_ACCEPT);
            }
            if (request.RequestType == Constants.RequestTypeCode.RETURN_IP)
            {
                var content = "Your request [Return IP Address] at " + request.RequestedTime + " is accepted.<br/> We're processing it. Please wait!<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_ACCEPT);
            }
            if (request.RequestType == Constants.RequestTypeCode.RENT_RACK)
            {
                var content = "Your request [Rent Rack] at " + request.RequestedTime + " is accepted.<br/> We're processing it. Please wait!<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_ACCEPT);
            }
            if (request.RequestType == Constants.RequestTypeCode.RETURN_RACK)
            {
                var content = "Your request [Return Rack] at " + request.RequestedTime + " is accepted.<br/> We're processing it. Please wait!<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_ACCEPT);
            }
        }

        public void SendMailApproveRequest(string requestCode)
        {
            var request = RequestBLO.Current.GetByKeys(new Request { RequestCode = requestCode });
            var customer = AccountBLO.Current.GetByKeys(new Account { Username = request.Customer });
            if (request.RequestType == Constants.RequestTypeCode.ADD_SERVER)
            {
                var content = "Your request [Add Server] at " + request.RequestedTime + " is done.<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_APPROVE);
            }
            if (request.RequestType == Constants.RequestTypeCode.BRING_SERVER_AWAY)
            {
                var content = "Your request [Bring Server Away] at " + request.RequestedTime + " is done.<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_APPROVE);
            }
            if (request.RequestType == Constants.RequestTypeCode.ASSIGN_IP)
            {
                var content = "Your request [Assign IP Address] at " + request.RequestedTime + " is done.<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_APPROVE);
            }
            if (request.RequestType == Constants.RequestTypeCode.CHANGE_IP)
            {
                var content = "Your request [Change IP Address] at " + request.RequestedTime + " is done.<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_APPROVE);
            }
            if (request.RequestType == Constants.RequestTypeCode.RETURN_IP)
            {
                var content = "Your request [Return IP Address] at " + request.RequestedTime + " is done.<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_APPROVE);
            }
            if (request.RequestType == Constants.RequestTypeCode.RENT_RACK)
            {
                var content = "Your request [Rent Rack] at " + request.RequestedTime + " is done.<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_APPROVE);
            }
            if (request.RequestType == Constants.RequestTypeCode.RETURN_RACK)
            {
                var content = "Your request [Return Rack] at " + request.RequestedTime + " is done.<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_APPROVE);
            }
        }

        public void SendMailRejectRequest(string requestCode)
        {
            var request = RequestBLO.Current.GetByKeys(new Request { RequestCode = requestCode });
            var customer = AccountBLO.Current.GetByKeys(new Account { Username = request.Customer });
            if (request.RequestType == Constants.RequestTypeCode.ADD_SERVER)
            {
                var content = "Your request [Add Server] at " + request.RequestedTime + " is rejected.<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_REJECT);
            }
            if (request.RequestType == Constants.RequestTypeCode.BRING_SERVER_AWAY)
            {
                var content = "Your request [Bring Server Away] at " + request.RequestedTime + " is rejected.<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_REJECT);
            }
            if (request.RequestType == Constants.RequestTypeCode.ASSIGN_IP)
            {
                var content = "Your request [Assign IP Address] at " + request.RequestedTime + " is rejected.<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_REJECT);
            }
            if (request.RequestType == Constants.RequestTypeCode.CHANGE_IP)
            {
                var content = "Your request [Change IP Address] at " + request.RequestedTime + " is rejected.<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_REJECT);
            }
            if (request.RequestType == Constants.RequestTypeCode.RETURN_IP)
            {
                var content = "Your request [Return IP Address] at " + request.RequestedTime + " is rejected.<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_REJECT);
            }
            if (request.RequestType == Constants.RequestTypeCode.RENT_RACK)
            {
                var content = "Your request [Rent Rack] at " + request.RequestedTime + " is rejected.<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_REJECT);
            }
            if (request.RequestType == Constants.RequestTypeCode.RETURN_RACK)
            {
                var content = "Your request [Return Rack] at " + request.RequestedTime + " is rejected.<br/> Best Regards";
                SendMail(customer.Email, content, Constants.SendMail.SUBJECT_REQUEST_REJECT);
            }
        }
        #endregion
    }
}
