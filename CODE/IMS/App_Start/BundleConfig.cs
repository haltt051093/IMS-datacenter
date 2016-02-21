using System.Web.Optimization;
using IMS.Core;

namespace IMS
{
    public class BundleConfig
    {
        public static void Configure(BundleCollection builder)
        {
            builder.IgnoreList.Clear();

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
                "~/Scripts/jquery.validate.tfpatch.js"
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
            builder.Add(new ScriptBundle(Constants.ScriptBundle.ADMINLTE).Include(
                "~/Scripts/AdminLTE/app.js",
                "~/Scripts/AdminLTE/dashboard.js"
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
            builder.Add(new StyleBundle(Constants.StyleBundle.JQUERY_UI).Include(
                "~/Content/jquery-ui.css",
                "~/Content/jquery-ui.structure.css"
            ));
            builder.Add(new StyleBundle(Constants.StyleBundle.JQUERY_VALIDATE).Include(
                "~/Content/jquery.validate.css"
            ));
            builder.Add(new StyleBundle(Constants.StyleBundle.ADMINLTE).Include(
                "~/Content/AdminLTE.css",
                "~/Content/font-awesome.css",
                "~/Content/ionicons.css"
            ));
        }
    }
}