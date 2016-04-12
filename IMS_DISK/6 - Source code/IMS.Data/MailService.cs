using System.Net;
using System.Net.Mail;
using System.Text;

namespace IMS
{
    public class MailService
    {
        public bool Send(string smtpUsername, string smtpPassword, string smtpHost, int smtpPort,
            string toEmail, string subject, string body)
        {
            try
            {
                using (var smtpClient = new SmtpClient())
                {
                    smtpClient.EnableSsl = true; //https
                    smtpClient.Host = smtpHost; //host
                    smtpClient.Port = smtpPort;
                    smtpClient.UseDefaultCredentials = true;
                    smtpClient.Credentials = new NetworkCredential(smtpUsername, smtpPassword);
                    var msg = new MailMessage
                    {
                        IsBodyHtml = true, //cho phep noi dung html
                        BodyEncoding = Encoding.UTF8,
                        From = new MailAddress(smtpUsername),
                        Subject = subject,
                        Body = body,
                        Priority = MailPriority.Normal,
                    };
                    msg.To.Add(toEmail);
                    smtpClient.Send(msg);
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }
    }
}