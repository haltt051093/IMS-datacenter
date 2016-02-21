using System.Web.Optimization;
using IMS.Core;

namespace IMS
{
    public class BundleConfig
    {
        public static void Configure(BundleCollection builder)
        {
            builder.IgnoreList.Clear();

            builder.Add(new ScriptBundle(Constants.ScriptBundle.ANGULARJS).Include(
                "~/static/js/angular.js",
                "~/static/js/angular.tfpatch.js",
                "~/static/js/angular.tfpatch-controller.*"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.BOOTSTRAP).Include(
                "~/static/js/bootstrap.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.BOOTSTRAP_DATETIMEPICKER).Include(
                "~/static/js/bootstrap-datetimepicker.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.DDLEVELSMENU).Include(
                "~/static/js/ddlevelsmenu.js",
                "~/static/js/ddlevelsmenu.tfpatch.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.JQUERY).Include(
                "~/static/js/jquery.js",
                "~/static/js/jquery.tfpatch.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.JQUERY_UI).Include(
                "~/static/js/jquery-ui.js",
                "~/static/js/jquery-ui.tfpatch.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.JQUERY_FILER).Include(
                "~/static/js/jquery.filer.js",
                "~/static/js/jquery.filer.tfpatch.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.JQUERY_VALIDATE).Include(
                "~/static/js/jquery.validate.js",
                "~/static/js/jquery.validate.unobtrusive.js",
                "~/static/js/jquery.validate.tfpatch.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.MOMENT).Include(
                "~/static/js/moment.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.MODERNIZR).Include(
                "~/static/js/modernizr.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.RESPOND).Include(
                "~/static/js/respond.js",
                "~/static/js/respond.matchmedia.addListener.js"
            ));
            builder.Add(new ScriptBundle(Constants.ScriptBundle.APPLICATION).Include(
                "~/static/js/tforce-*"
            ));

            builder.Add(new StyleBundle(Constants.StyleBundle.BOOTSTRAP).Include(
                "~/static/css/bootstrap.css",
                "~/static/css/bootstrap-theme.css",
                "~/static/css/bootstrap.tfpatch.css"
            ));
            builder.Add(new StyleBundle(Constants.StyleBundle.BOOTSTRAP_DATETIMEPICKER).Include(
                "~/static/css/bootstrap-datetimepicker.css"
            ));
            builder.Add(new StyleBundle(Constants.StyleBundle.DDLEVELSMENU).Include(
                "~/static/css/ddlevelsmenu-base.css",
                "~/static/css/ddlevelsmenu-sidebar.css",
                "~/static/css/ddlevelsmenu-topbar.css",
                "~/static/css/ddlevelsmenu.tfpatch.css"
            ));
            builder.Add(new StyleBundle(Constants.StyleBundle.JQUERY_UI).Include(
                "~/static/css/jquery-ui.css",
                "~/static/css/jquery-ui.structure.css",
                "~/static/css/jquery-ui.tfpatch.css"
            ));
            builder.Add(new StyleBundle(Constants.StyleBundle.JQUERY_FILER).Include(
                "~/static/css/jquery.filer.css",
                "~/static/css/jquery.filer.icon.css",
                "~/static/css/jquery.filer-dragdropbox-theme.css"
            ));
            builder.Add(new StyleBundle(Constants.StyleBundle.JQUERY_VALIDATE).Include(
                "~/static/css/jquery.validate.css"
            ));
            builder.Add(new StyleBundle(Constants.StyleBundle.APPLICATION).Include(
                "~/static/css/tforce-*"
            ));
        }
    }
}