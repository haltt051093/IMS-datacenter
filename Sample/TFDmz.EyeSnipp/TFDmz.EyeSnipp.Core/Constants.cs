namespace TForceAlliance.Xyz.EyeSnipp.Core
{
    public class Constants
    {
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
            public const string FORM_INNER_CLASS = "form-control";
            public const string FORM_TEXTBOX_CLASS = "col-xs-6 tf-form-control";

            public const string MODAL_CLASS = "modal fade tf-modal";
            public const string MODAL_HEADER_CLASS = "h4";
            public const string MODAL_ROW_CLASS = "row form-group";
            public const string MODAL_MESSAGE_CLASS = "col-xs-12";
            public const string MODAL_LABEL_CLASS = "col-xs-3 tf-form-label";
            public const string MODAL_CONTROL_CLASS = "col-xs-9 tf-form-control";
            public const string MODAL_INNER_CLASS = "form-control";
        }

        public class HtmlLayout
        {
            public const string BOOTSTRAP = "~/Views/Shared/_BootstrapLayout.cshtml";
            public const string FOUNDATION = "~/Views/Shared/_FoundationLayout.cshtml";
            public const string JQUERY_UI = "~/Views/Shared/_JQueryUILayout.cshtml";
        }

        public class ScriptBundle
        {
            public const string APP_BOOTSTRAP = "~/bundles/scripts/app-bootstrap/";
            public const string APP_FOUNDATION = "~/bundles/scripts/app-foundation/";
            public const string APP_JQUERY_UI = "~/bundles/scripts/app-jquery-ui/";
        }

        public class StyleBundle
        {
            public const string APP_BOOTSTRAP = "~/bundles/styles/app-bootstrap/";
            public const string APP_FOUNDATION = "~/bundles/styles/app-bootstrap/";
            public const string APP_JQUERY_UI = "~/bundles/styles/app-jquery-ui/";
        }
    }
}
