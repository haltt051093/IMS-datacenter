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
    }
}

