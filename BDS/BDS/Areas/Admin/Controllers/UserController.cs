using BDS.Common;
using BDS.Data.Dto;
using BDS.Service;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BDS.Areas.Admin.Controllers
{
    public class UserController : BaseController
    {
        private readonly IProjectService _projectService;
        private readonly IUserService _userService;
        private readonly IRoleService _roleService;

        public UserController(IProjectService projectService, IUserService userService, IRoleService roleService)
        {
            _projectService = projectService;
            _userService = userService;
            _roleService = roleService;
        }
        // GET: Admin/User
        public ActionResult Index()
        {            
            return View();
        }

        public ActionResult Logout()
        {
            Session[CommonConstants.USER_SESSION] = null;
            return Redirect("/");
        }

        [HttpGet]
        public PartialViewResult UserList(int page = 1)
        {
            var model = _userService.GetAll();
            model = model.ToPagedList(page, _pageSize);

            foreach (var item in model)
            {
                int[] idRoles = item.RoleID.Split(',').Select(o => int.Parse(o)).ToArray();
                item.RoleID = GetRoleName(idRoles);
            }
            
            return PartialView(model);
        }

        string GetRoleName(int[] idRoles)
        {
            string[] name = new string[idRoles.Count()];
            var i = 0;
            foreach (var item in idRoles)
            {
                var role = _roleService.Get(item);
                name[i] = role.Name;
                i++;
            }

            return string.Join(",", name);
        }

        // GET: Admin/User/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Admin/User/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/User/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/User/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Admin/User/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/User/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Admin/User/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
