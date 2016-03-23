
namespace IMS.Core
{
    public static class Constants
    {
        public class RequestTypeCode
        {
            public const string ADD_SERVER = "RT003";
            public const string ASSIGN_IP = "RT009";
            public const string BRING_SERVER_AWAY = "RT007";
            public const string CHANGE_IP = "RT008";
            public const string RENT_RACK = "RT011";
            public const string RETURN_IP = "RT010";
            public const string RETURN_RACK = "RT012";
        }

        public class StatusCode
        {
            public const string REQUEST_PENDING = "STATUS04";
            public const string REQUEST_WAITING = "STATUS05";
            public const string REQUEST_PROCESSING = "STATUS06";
            public const string REQUEST_DONE = "STATUS07";
            public const string REQUEST_CANCELLED = "STATUS08";
            public const string REQUEST_REJECTED = "STATUS09";

            public const string SERVER_WAITING = "STATUS01";
            public const string SERVER_RUNNING = "STATUS02";
            public const string SERVER_DEACTIVATE = "STATUS03";
            public const string SERVER_BRINGING_AWAY = "STATUS34";

            public const string IP_AVAILABLE = "STATUS10";
            public const string IP_USED = "STATUS11";
            public const string IP_BLOCKED = "STATUS12";
            public const string IP_RESERVE = "STATUS32";
            public const string IP_DEACTIVATE = "STATUS35";

            public const string LOCATION_FREE = "STATUS13";
            public const string LOCATION_USED = "STATUS14";

            public const string RACK_AVAILABLE = "STATUS19";
            public const string RACK_RENTED = "STATUS20";
            public const string RACK_USED = "STATUS33";

            public const string SERVERATTRIBUTE_OLD = "STATUS23";
            public const string SERVERATTRIBUTE_UPDATING = "STATUS22";
            public const string SERVERATTRIBUTE_NEW = "STATUS24";

            public const string SERVERIP_CURRENT = "STATUS29";
            public const string SERVERIP_RETURNING = "STATUS30";
            public const string SERVERIP_OLD = "STATUS31";
            public const string SERVERIP_CHANGING = "STATUS36";

            public const string RACKOFCUSTOMER_CURRENT = "STATUS26";
            public const string RACKOFCUSTOMER_RETURNING = "STATUS27";
            public const string RACKOFCUSTOMER_OLD = "STATUS28";

            public const string TASK_WAITING = "STATUS15";
            public const string TASK_DOING = "STATUS16";
            public const string TASK_COMPLETED = "STATUS17";
            public const string TASK_NOTFINISH = "STATUS18";
            public const string TASK_CANCEL = "STATUS37";
        }

        public class GroupName
        {
            public const string GROUP_1 = "Group 1";
            public const string GROUP_2 = "Group 2";
            public const string GROUP_3 = "Group 3";
            public const string GROUP_4 = "Group 4";
            public const string ADMIN = "Admin";
            public const string CUSTOMER = "Customer";
        }

        public class RequestTypeName
        {
            public const string SERVER_ADD = "Add Server";
            public const string IP_ASSIGN = "Assign new IP address";
            public const string SERVER_BRINGAWAY = "Bring server away";
            public const string IP_CHANGE = "Change IP address";
            public const string RACK_RENT = "Rent rack";
            public const string IP_RETURN = "Return IP address";
            public const string RACK_RETURN = "Return rack";
        }

        public class StatusName
        {
            public const string SERVER_WAITING = "Waiting";
            public const string SERVER_RUNNING = "Running";
            public const string SERVER_DEACTIVATE = "Deactivate";

            public const string REQUEST_PENDING = "Pending";
            public const string REQUEST_WAITING = "Waiting";
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
            public const string REQUEST_CODE = "REQUEST_CODE";
        }

        public class Object
        {
            public const string OBJECT_IP = "IPAddress";
            public const string OBJECT_LOCATION = "Location";
            public const string OBJECT_REQUEST = "Request";
            public const string OBJECT_TASK = "Task";
            public const string OBJECT_SERVER = "Server";
            public const string OBJECT_ACCOUNT = "Account";
            public const string OBJECT_NOTE = "Note";
            public const string OBJECT_ASSIGNMENT = "StaffAssignment";
            public const string OBJECT_RACK = "Rack";
            public const string OBJECT_RACKOFCUSTOMER = "RackOfCustomer";
            public const string OBJECT_SERVERIP = "ServerIP";
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
            public const string LOG_ADD_SERVER = "ADDSERVER";
            // luu servercode cua request duoc add vao
            public const string LOG_ASSIGN_DEFAULT_IP = "ASSIGNDEFAULTIP";
            //Customer rents rack
            public const string LOG_RENT_RACK = "RENTRACK";
            //Customer returns rack
            public const string LOG_RETURN_RACK = "RETURNRACK";
            //Customer returns Ips
            public const string LOG_RETURN_IP = "RETURNIP";
            //Customer change Ips
            public const string LOG_CHANGE_IP = "CHANGEIP";
            //Assign Ip to server
            public const string LOG_ASSIGN_IP = "ASSIGNIP";
            //Block IP
            public const string LOG_BLOCK_IP = "BLOCKIP";
            //Unblock IP
            public const string LOG_UNBLOCK_IP = "UNBLOCKIP";
            //bring server away
            public const string LOG_BRING_SERVER_AWAY = "BASERVER";
        }

        public class BandWidth
        {
            public const string SPEED_TYPE1 = "100Mbps";
            public const string SPEED_TYPE2 = "1GBbps";
        }

        public class ShiftCode
        {
            public const string SHIFT_1 = "Shift 1";
            public const string SHIFT_2 = "Shift 2";
            public const string SHIFT_3 = "Shift 3";
        }

        public class Date
        {
            public const string STARTED_DATE = "2016-01-01";
            public const string ENDED_DATE = "2016-01-31";
        }

        public class Format
        {
            public const string DATE = "dd/MM/yyyy";
            public const string TIME = "HH:mm:ss";
        }

        public class ScriptBundle
        {
            public const string ADMINLTE = "~/scripts/adminlte";
            public const string ALERTIFY = "~/scripts/alertify";
            public const string ANGULARJS = "~/scripts/agularjs";
            public const string APPLICATION = "~/scripts/application";
            public const string BOOTSNIPP = "~/scripts/bootsnipp";
            public const string BOOTSTRAP = "~/scripts/bootstrap";
            public const string BOOTSTRAP_COLORPICKER = "~/scripts/bootstrap-colorpicker";
            public const string BOOTSTRAP_DATETIMEPICKER = "~/scripts/bootstrap-datetimepicker";
            public const string BOOTSTRAP_SLIDER = "~/scripts/bootstrap-slider";
            public const string BOOTSTRAP_WYSIWYG = "~/scripts/bootstrap-wysiwyg";
            public const string CHARTJS = "~/scripts/chartjs";
            public const string DDLEVELSMENU = "~/scripts/ddlevelsmenu";
            public const string DATATABLE = "~/scripts/datatable";
            public const string DATATABLE_EDITOR = "~/scripts/datatable-editor";
            public const string FLOTCHART = "~/scripts/flotchart";
            public const string FULLCALENDAR = "~/scripts/fullcalendar";
            public const string IVECTOR_MAP = "~/scripts/ivector-map";
            public const string JQUERY = "~/scripts/jquery";
            public const string JQUERY_FILER = "~/scripts/jquery.filer";
            public const string JQUERY_KNOB = "~/scripts/jquery-knob";
            public const string JQUERY_UI = "~/scripts/jquery-ui";
            public const string JQUERY_VALIDATE = "~/scripts/jquery.validate";
            public const string KNOCKOUT = "~/scripts/knockout";
            public const string MODERNIZR = "~/scripts/modernizr";
            public const string MOMENT = "~/scripts/moment";
            public const string MORRISJS = "~/scripts/morrisjs";
            public const string NODEJS = "~/scripts/nodejs";
            public const string NOTIFICATIONJS = "~/scripts/notificationjs";
            public const string PACEJS = "~/scripts/pacejs";
            public const string RESPOND = "~/scripts/respond";
            public const string SIGNALR = "~/scripts/signalr";
            public const string SPARKLINE = "~/scripts/sparkline";
        }

        public class StyleBundle
        {
            public const string ADMINLTE = "~/styles/adminlte";
            public const string ALERTIFY = "~/styles/alertify";
            public const string APPLICATION = "~/styles/application";
            public const string BOOTSNIPP = "~/styles/bootsnipp";
            public const string BOOTSTRAP = "~/styles/bootstrap";
            public const string BOOTSTRAP_COLORPICKER = "~/styles/bootstrap-colorpicker";
            public const string BOOTSTRAP_DATETIMEPICKER = "~/styles/bootstrap-datetimepicker";
            public const string BOOTSTRAP_SLIDER = "~/styles/bootstrap-slider";
            public const string BOOTSTRAP_WYSIWYG = "~/styles/bootstrap-wysiwyg";
            public const string DATATABLE = "~/styles/datatable";
            public const string DATATABLE_EDITOR = "~/styles/datatable-editor";
            public const string DDLEVELSMENU = "~/styles/ddlevelsmenu";
            public const string JQUERY_FILER = "~/styles/jquery.filer";
            public const string JQUERY_UI = "~/styles/jquery-ui";
            public const string JQUERY_VALIDATE = "~/styles/jquery.validate";
            public const string MORRISJS = "~/styles/morrisjs";
            public const string PACEJS = "~/styles/pacejs";
        }

        public class Number
        {
            public const int NUMBER_1 = 1;
            public const int NUMBER_2 = 2;
            public const int NUMBER_3 = 3;
            public const int NUMBER_4 = 4;
            public const int NUMBER_5 = 5;
            public const int NUMBER_6 = 6;
            public const int NUMBER_7 = 7;
            public const int NUMBER_8 = 8;
            public const int NUMBER_9 = 9;
            public const int NUMBER_10 = 10;
        }

        public class HtmlFormat
        {
            public const string DEFAULT_BUTTON_CLASS = "btn btn-default";
            public const string PRIMARY_BUTTON_CLASS = "btn btn-primary";
            public const string SECONDARY_BUTTON_CLASS = "btn btn-info";
            public const string DANGER_BUTTON_CLASS = "btn btn-danger";
            public const string DANGER_TEXT_CLASS = "text-danger";

            public const string DATATABLE_CLASS = "table table-bordered table-striped";
            public const string DATATABLE_HEADER_CLASS = "tf-datatable-header";

            public const string FORM_ROW_CLASS = "row form-group";
            public const string FORM_MESSAGE_CLASS = "col-xs-12";
            public const string FORM_LABEL_CLASS = "col-xs-2 tf-form-label";
            public const string FORM_CONTROL_CLASS = "col-xs-10 tf-form-control";
            public const string FORM_DETAIL_CLASS = "col-xs-10 tf-form-info";
            public const string FORM_LABEL_X2_CLASS = "col-xs-4 tf-form-label";
            public const string FORM_CONTROL_X2_CLASS = "col-xs-8 tf-form-control";
            public const string FORM_DETAIL_X2_CLASS = "col-xs-8 tf-form-info";
            public const string FORM_INNER_CLASS = "form-control";
            //public const string FORM_LABEL = "tf-form-label";
            //public const string FORM_FOR_PAGE = "form-group col-xs-offset-3";
            public const string FORM_TEXTBOX_CLASS = "col-xs-6 tf-form-control";

            public const string MODAL_CLASS = "modal fade tf-modal";
            public const string MODAL_HEADER_CLASS = "h4";
            public const string MODAL_ROW_CLASS = "row form-group";
            public const string MODAL_MESSAGE_CLASS = "col-xs-12";
            public const string MODAL_LABEL_CLASS = "col-xs-3 tf-form-label";
            public const string MODAL_CONTROL_CLASS = "col-xs-9 tf-form-control";
            public const string MODAL_INNER_CLASS = "form-control";
        }

        public class FormAction
        {
            public const string ACTION_NAME = "Action";
            public const string OK_ACTION = "OK";
            public const string EDIT_ACTION = "Edit";
            public const string CANCEL_ACTION = "Cancel";
            public const string REJECT_ACTION = "Reject";
            public const string APPROVE_ACTION = "Approve";
            public const string ACCEPT_ACTION = "Accept";
            public const string REASSIGN_ACTION = "Reassign";
            public const string PROCESS_ACTION = "Process";
            public const string ACCEPT_TASK_ACTION = "AcceptTask";
            public const string NOT_FINISHED_TASK_ACTION = "NotFinished";
            public const string EXPORT_ACTION = "Export";
        }

        public class ServerAttributeCode
        {
            public const string PART_NUMBER = "SAT001";
            public const string SERIAL_NUMBER = "SAT002";
            public const string MEMORY = "SAT004";
        }

        public class AlertType
        {
            public const string SUCCESS = "success";
            public const string INFO = "info";
            public const string WARNING = "warning";
            public const string DANGER = "danger";
        }

        public class TimeConversion 
        {
            public const long EPOCH_VS_TICK_OFFSET = 621355968000000000;
        }
    }
}

