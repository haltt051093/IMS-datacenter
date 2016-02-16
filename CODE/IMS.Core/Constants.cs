using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Core
{
    public static class Constants
    {
        public class RequestTypeCode
        {
            public const string RENT_RACK = "RT011";
            public const string RETURN_RACK = "RT012";
            public const string ADD_SERVER = "RT003";
            public const string UPGRADE_SERVER = "RT006";
            public const string ASSIGN_IP = "RT009";
            public const string CHANGE_IP = "RT008";
            public const string RETURN_IP = "RT010";
        }

        public class StatusCode
        {
            public const string REQUEST_WAITING = "STATUS04";
            public const string REQUEST_PENDING = "STATUS05";
            public const string REQUEST_PROCESSING = "STATUS06";
            public const string REQUEST_DONE = "STATUS07";
            public const string REQUEST_CANCELLED = "STATUS08";
            public const string REQUEST_REJECTED = "STATUS09";

            public const string SERVER_WAITING = "STATUS01";
            public const string SERVER_RUNNING = "STATUS02";
            public const string SERVER_DEACTIVATE = "STATUS03";

            public const string IP_AVAILABLE = "STATUS10";
            public const string IP_USED = "STATUS11";
            public const string IP_BLOCKED = "STATUS12";

            public const string LOCATION_FREE = "STATUS13";
            public const string LOCATION_USED = "STATUS14";

            public const string RACK_AVAILABLE = "STATUS19";
            public const string RACK_RENTED = "STATUS20";
            public const string RACK_USING = "STATUS21";
        }

        public class Test
        {
            public const string CUSTOMER_MANHNH = "manhnh";
            public const string STAFF_NHI = "nhink";
        }

        public class SendMail
        {
            public const string FROM_EMAIL_USERNAME = "IMS.DATACENTER.QTSC@gmail.com";
            public const string FROM_EMAIL_PASSWORD = "imsdatacenter";
            public const string SMTP_HOST = "smtp.gmail.com";
            public const int SMTP_PORT = 25;
            public const string SUBJECT_NEWACCOUNT = "New Account to IMS-datacenter";
        }

        public class Session
        {
            public const string USER_LOGIN = "USER_LOGIN";
        }

        public class Object
        {
            public const string OBJECT_IP = "IPAddress";
            public const string OBJECT_LOCATION = "Location";
            public const string OBJECT_REQUEST = "Request";
            public const string OBJECT_SERVER = "Server";
            public const string OBJECT_ACCOUNT = "Account";
            public const string OBJECT_NOTE = "Note";
            public const string OBJECT_ASSIGNMENT = "StaffAssignment";
        }

        public class TypeOfLog
        {
            public const string LOG_UPDATE_ROLE = "UROLE";
            public const string LOG_UPDATE_STATUS_ACCOUNT = "UACCOUNTSTATUS";
            //luu khi chuyen trang thai hoat dong cua IP thanh available, unavailable, or blocked
            public const string LOG_UPDATE_STATUS_IP = "UIPSTATUS";
            // luu khi chuyen cac trang thai cua request
            public const string LOG_UPDATE_STATUS_REQUEST = "UREQUESTSTATUS";
            //luu khi chuyen trang thai cua server: waiting, running, deactivate
            public const string LOG_UPDATE_STATUS_SERVER = "USERVERSTATUS";
            // luu server chuyen tu location nao sang location nao
            public const string LOG_UPDATE_VALUE_SERVERLOCATION = "UVALSERLOC";
            //luu ip
        }
    }
}

