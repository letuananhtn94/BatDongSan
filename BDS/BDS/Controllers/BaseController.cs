using BDS.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace BDS.Controllers
{
    [CustomAuthorize("Admin", "Member")]
    public class BaseController : Controller
    {
        protected int _pageSize;

        // GET: Admin/Base
        public BaseController()
        {
            _pageSize = 15;
        }

       
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            // if user not loggin
            string controller = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName;
            string action = filterContext.ActionDescriptor.ActionName;
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];

            string returnUrl = filterContext.RequestContext.HttpContext.Request.RawUrl;

            if (session == null && controller != "User" && action != "Login")
            {
                filterContext.Result = new RedirectToRouteResult("User_Login", new RouteValueDictionary(new { returnUrl = returnUrl }));
            }

            base.OnActionExecuting(filterContext);
        }
    }
}