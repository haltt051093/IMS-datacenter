using System.Web.Optimization;
using TForceAlliance.Xyz.AspNetMvcLib;
using TForceAlliance.Xyz.AspNetMvcLib.Express;
using TForceAlliance.Xyz.AspNetMvcLib.Extensions;
using TForceAlliance.Xyz.EyeSnipp.Core;

namespace TForceAlliance.Xyz.EyeSnipp
{
    public class BundleConfig
    {
        public static void Configure(BundleCollection builder)
        {
#if DEBUG
            BundleFactory.RuntimeMode = TFAspNetEnums.RuntimeMode.Debug;
#else
            BundleFactory.RuntimeMode = TFAspNetEnums.RuntimeMode.Release;
#endif
            BundleFactory.ScriptRootPath = "~/static/js/";
            BundleFactory.StyleRootPath = "~/static/css/";

            builder.RegisterScriptBundle(BundleFactory.CreateScriptBundle(TFAspNetConstants.ScriptBundle.ANGULARJS, string.Empty));
            builder.RegisterScriptBundle(BundleFactory.CreateScriptBundle(TFAspNetConstants.ScriptBundle.ASPNETMVC, string.Empty));
            builder.RegisterScriptBundle(BundleFactory.CreateScriptBundle(TFAspNetConstants.ScriptBundle.BOOTSTRAP, string.Empty));
            builder.RegisterScriptBundle(BundleFactory.CreateScriptBundle(TFAspNetConstants.ScriptBundle.BOOTSTRAP_DATETIMEPICKER, string.Empty));
            builder.RegisterScriptBundle(BundleFactory.CreateScriptBundle(TFAspNetConstants.ScriptBundle.DDLEVELSMENU, string.Empty));
            builder.RegisterScriptBundle(BundleFactory.CreateScriptBundle(TFAspNetConstants.ScriptBundle.JQUERY, string.Empty, "jquery.tfpatch.js"));
            builder.RegisterScriptBundle(BundleFactory.CreateScriptBundle(TFAspNetConstants.ScriptBundle.JQUERY_FILER, string.Empty));
            builder.RegisterScriptBundle(BundleFactory.CreateScriptBundle(TFAspNetConstants.ScriptBundle.JQUERY_UI, string.Empty));
            builder.RegisterScriptBundle(BundleFactory.CreateScriptBundle(TFAspNetConstants.ScriptBundle.JQUERY_VALIDATE, string.Empty));
            builder.RegisterScriptBundle(BundleFactory.CreateScriptBundle(TFAspNetConstants.ScriptBundle.MODERNIZR, string.Empty));
            builder.RegisterScriptBundle(BundleFactory.CreateScriptBundle(TFAspNetConstants.ScriptBundle.MOMENT, string.Empty));
            builder.RegisterScriptBundle(BundleFactory.CreateScriptBundle(TFAspNetConstants.ScriptBundle.RESPOND, string.Empty));
            builder.RegisterScriptBundle(BundleFactory.CreateScriptBundle(Constants.ScriptBundle.APP_BOOTSTRAP, string.Empty));
            builder.RegisterScriptBundle(BundleFactory.CreateScriptBundle(Constants.ScriptBundle.APP_FOUNDATION, string.Empty));
            builder.RegisterScriptBundle(BundleFactory.CreateScriptBundle(Constants.ScriptBundle.APP_JQUERY_UI, string.Empty));

            builder.RegisterStyleBundle(BundleFactory.CreateStyleBundle(TFAspNetConstants.StyleBundle.BOOTSTRAP, string.Empty, "bootstrap.tfpatch.css"));
            builder.RegisterStyleBundle(BundleFactory.CreateStyleBundle(TFAspNetConstants.StyleBundle.BOOTSTRAP_DATETIMEPICKER, string.Empty));
            builder.RegisterStyleBundle(BundleFactory.CreateStyleBundle(TFAspNetConstants.StyleBundle.DDLEVELSMENU, string.Empty, "ddlevelsmenu.tfpatch.css"));
            builder.RegisterStyleBundle(BundleFactory.CreateStyleBundle(TFAspNetConstants.StyleBundle.JQUERY_FILER, string.Empty));
            builder.RegisterStyleBundle(BundleFactory.CreateStyleBundle(TFAspNetConstants.StyleBundle.JQUERY_UI, string.Empty));
            builder.RegisterStyleBundle(BundleFactory.CreateStyleBundle(TFAspNetConstants.StyleBundle.JQUERY_VALIDATE, string.Empty));
            builder.RegisterStyleBundle(BundleFactory.CreateStyleBundle(Constants.StyleBundle.APP_BOOTSTRAP, string.Empty, "tforce-*"));
            builder.RegisterStyleBundle(BundleFactory.CreateStyleBundle(Constants.StyleBundle.APP_FOUNDATION, string.Empty, "tforce-*"));
            builder.RegisterStyleBundle(BundleFactory.CreateStyleBundle(Constants.StyleBundle.APP_JQUERY_UI, string.Empty, "tforce-*"));
        }
    }
}