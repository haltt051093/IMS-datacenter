using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
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

            public const string SERVERATTRIBUTE_OLD = "STATUS23";
            public const string SERVERATTRIBUTE_UPDATING = "STATUS22";
            public const string SERVERATTRIBUTE_NEW = "STATUS24";
        }

        public class GroupName
        {
            public const string GROUP_1 = "Group 1";
            public const string GROUP_2 = "Group 2";
            public const string GROUP_3 = "Group 3";
            public const string GROUP_4 = "Group 4";
            public const string NO_GROUP = "No Group";
        }

        public class RequestType
        {
            public const string SERVER_ADD = "Add Server";
            public const string IP_ASSIGN = "Assign new IP address";
            public const string SERVER_BRINGIN = "Bring server in";
            public const string SERVER_BRINGOUT = "Bring server out";
            public const string IP_CHANGE = "Change IP address";
            public const string RACK_RENT = "Rent rack";
            public const string IP_RETURN = "Return IP address";
            public const string RACK_RETURN = "Return rack";
            public const string UPGRADE_SERVER = "Upgrade server at center";
        }

        public class StatusName
        {
            public const string SERVER_WAITING = "Waiting";
            public const string SERVER_RUNNING = "Running";
            public const string SERVER_DEACTIVATE = "Deactivate";
            public const string REQUEST_WAITING = "Waiting";
            public const string REQUEST_PENDING = "Pending";
            public const string REQUEST_PROCESSING = "Processing";
            public const string REQUEST_DONE = "Done";
            public const string REQUEST_CANCELLED = "Cancelled";
            public const string REQUEST_REJECTED = "Rejected";
            public const string IP_AVAILABLE = "Available";
            public const string IP_USED = "Used";
            public const string IP_BLOCKED = "Blocked";
            public const string LOCATION_FREE = "Free";
            public const string LOCATION_USED = "Used";
            public const string RACK_AVAILABLE = "Available";
            public const string RACK_RENTED = "Rented";
            public const string RACK_USING = "Using";
            public const string ASSIGNMENT_APPROVE = "Approving";
            public const string ASSIGNMENT_DOING = "Doing";
            public const string ASSIGNMENT_DONE = "Done";
            public const string ASSIGNMENT_NOT_FINISHED = "Not Finished";
        }

        public class Role
        {
            public const string CUSTOMER = "Customer";
            public const string MANAGER = "Manager";
            public const string SHIFT_HEAD = "Shift Head";
            public const string STAFF = "Staff";
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
            // luu servercode cua request duoc add vao
            public const string LOG_ADD_SERVER = "ASERVER";
        }

        public class BandWidth
        {
            public const string SPEED_TYPE1 = "100Mbps";
            public const string SPEED_TYPE2 = "1GBbps";
        }
    }
}

