using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace BDS
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            //// Defautl page
            //routes.MapRoute(
            //    name: "Default",
            //    url: "",
            //    defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            //);
            //// Error page
            //routes.MapRoute(
            //    "404-PageNotFound",
            //    "{*url}",
            //    new { controller = "Home", action = "Index" }
            //);
            //routes.MapRoute(
            //    name: "Home/Index",
            //    url: "Home/Index/{id}",
            //    defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            //);

            //routes.MapRoute(
            //    name: "Home/Detail",
            //    url: "Home/Detail/{projectId}",
            //    defaults: new { controller = "Home", action = "Detail", id = UrlParameter.Optional },
            //    constraints: new { projectId = @"\d+" }
            //);
        }
    }
}
