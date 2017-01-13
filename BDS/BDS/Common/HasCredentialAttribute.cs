using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using A = BDS.Data.Common;

namespace BDS.Common
{
    public class CustomAuthorizeAttribute : AuthorizeAttribute
    {
        public string[] RoleID { set; get; }

        public CustomAuthorizeAttribute(params string[] roles)
        {
            this.RoleID = roles;
        }

        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            string controller = httpContext.Request.RequestContext.RouteData.Values["controller"].ToString();
            string action = httpContext.Request.RequestContext.RouteData.Values["action"].ToString();

            var session = (UserLogin)HttpContext.Current.Session[CommonConstants.USER_SESSION];
            if (session == null)
            {
                if (controller == "User" && action == "Login")
                    return true;

                return false;
            }
            else
            {
                string[] userRoles = session.UserRole;

                bool authorize = userRoles.Where(t => RoleID.Contains(t)).Count() != 0;
                return authorize;
            }
            
        }
        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            var session = (UserLogin)HttpContext.Current.Session[CommonConstants.USER_SESSION];
            if (session == null)
            {
                string returnUrl = filterContext.RequestContext.HttpContext.Request.RawUrl;
                filterContext.Result = new RedirectToRouteResult("User_Login", new RouteValueDictionary(new { returnUrl = returnUrl }));
            }
            else
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "Home", action = "Index"}));
            }
           
        }

    }
}