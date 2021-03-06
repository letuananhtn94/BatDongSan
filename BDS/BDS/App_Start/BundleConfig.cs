﻿using System.Web;
using System.Web.Optimization;

namespace BDS
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js",
                        "~/Assets/client/js/jquery-3.1.1.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/client").Include(
                      "~/Assets/client/bootstrap/js/bootstrap.js",
                      "~/Scripts/respond.js",
                      "~/Assets/select2/select2.js",
                      "~/Assets/select2/vi.js"));

            bundles.Add(new ScriptBundle("~/bundles/googlemap").Include(
                      "~/Scripts/jquery.googlemap.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Assets/client/bootstrap/css/bootstrap.css",
                      "~/Assets/font-awesome/css/font-awesome.min.css",
                      "~/Assets/select2/select2.css",
                      "~/Assets/client/css/home.css",
                      "~/Content/Site.css"));
        }
    }
}
