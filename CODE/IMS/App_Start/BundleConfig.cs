using System.Web.Optimization;
using IMS.Core;

namespace IMS
{
    public class BundleConfig
    {
        public static void Configure(BundleCollection builder)
        {
            builder.IgnoreList.Clear();

            builder.Add(new ScriptBundle(Constants.ScriptBundle.ALERTIFY).Include(
                "~/Scripts/alertify.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.BOOTBOX).Include(
                "~/Scripts/bootbox.min.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.BOOTSTRAP).Include(
                "~/Scripts/bootstrap.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.BOOTSTRAP_DATETIMEPICKER).Include(
                "~/Scripts/bootstrap-datetimepicker.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.DATATABLE).Include(
                "~/Scripts/plugins/datatables/jquery.dataTables.js",
                "~/Scripts/plugins/datatables/dataTables.bootstrap.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.JQUERY).Include(
                "~/Scripts/jquery-2.2.0.js",
                "~/Scripts/jquery.tooltipster.js",
                "~/Scripts/jquery.tfpatch.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.JQUERY_UI).Include(
                "~/Scripts/jquery-ui-1.11.4.js",
                "~/Scripts/jquery-ui.tfpatch.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.JQUERY_VALIDATE).Include(
                "~/Scripts/jquery.validate.js",
                "~/Scripts/jquery.unobtrusive-ajax.js",
                "~/Scripts/jquery.validate.unobtrusive.js",
                "~/Scripts/jquery.validate.custom.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.MOMENT).Include(
                "~/Scripts/moment.js",
                "~/Scripts/moment-with-locales.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.MODERNIZR).Include(
                "~/Scripts/modernizr-2.6.2.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.RESPOND).Include(
                "~/Scripts/respond.js",
                "~/Scripts/respond.matchmedia.addListener.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.SIGNALR).Include(
                "~/Scripts/jquery.signalR-2.2.0.js",
                "~/signalr/hubs"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.ADMINLTE).Include(
                "~/Scripts/AdminLTE/app.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.APPLICATION).Include(
                "~/Scripts/site.js"
            ));

            builder.Add(new StyleBundle(Constants.StyleBundle.ALERTIFY).Include(
                "~/Content/alertify.css",
                "~/Content/themes/bootstrap.css"
            ));
            builder.Add(new StyleBundle(Constants.StyleBundle.BOOTSTRAP).Include(
                "~/Content/bootstrap.css",
                "~/Content/bootstrap-theme.css"
            ));
            builder.Add(new StyleBundle(Constants.StyleBundle.BOOTSTRAP_DATETIMEPICKER).Include(
                "~/Content/bootstrap-datetimepicker.css"
            ));
            builder.Add(new StyleBundle(Constants.StyleBundle.DATATABLE).Include(
                "~/Content/datatables/dataTables.bootstrap.css"
            ));
            builder.Add(new StyleBundle(Constants.StyleBundle.JQUERY).Include(
                "~/Content/tooltipster.css",
                "~/Content/themes/tooltipster-light.css",
                "~/Content/themes/tooltipster-noir.css",
                "~/Content/themes/tooltipster-punk.css",
                "~/Content/themes/tooltipster-shadow.css"
            ));
            builder.Add(new StyleBundle(Constants.StyleBundle.JQUERY_UI).Include(
                "~/Content/jquery-ui.css",
                "~/Content/jquery-ui.structure.css",
                "~/Content/jquery-ui.tfpatch.css"
            ));
            builder.Add(new StyleBundle(Constants.StyleBundle.JQUERY_VALIDATE).Include(
                "~/Content/jquery.validate.css"
            ));
            builder.Add(new StyleBundle(Constants.StyleBundle.ADMINLTE).Include(
                "~/Content/AdminLTE.css",
                "~/Content/font-awesome.css",
                "~/Content/ionicons.css"
            ));
            builder.Add(new StyleBundle(Constants.StyleBundle.APPLICATION).Include(
                "~/Content/Site.css"
            ));
        }
    }
}