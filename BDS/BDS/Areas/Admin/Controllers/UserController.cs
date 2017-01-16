using BDS.Common;
using BDS.Data.Dto;
using BDS.Service;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StaticResource;
using AutoMapper;

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
            var role = _roleService.GetAll();
            ViewBag.Role = new SelectList(_roleService.GetAll(), "ID", "Name");

            ViewBag.IsInsert = true;
            return View("Insert", new UserModel());
        }

        // POST: Admin/User/Create
        [HttpPost]
        public ActionResult Create(UserModel model)
        {
            ViewBag.Role = new SelectList(_roleService.GetAll(), "ID", "Name");
            ViewBag.IsInsert = true;
            model.RoleID = string.Join(",", model.SelectedValues);
            if (ModelState.IsValid)
            {
                var user = new User();
                user.UserName = model.UserName;
                user.Name = model.FullName;
                user.Password = Encryptor.MD5Hash(model.Pass);
                user.Phone = model.Phone;
                user.Email = model.Email;
                user.Address = model.Address;
                user.CreatedDate = DateTime.Now;
                user.RoleID = model.RoleID;
                user.Active = true;
               
                string errorInsert = _userService.Insert(user);

                if (errorInsert != null)
                {
                    ModelState.AddModelError(string.Empty, errorInsert);
                    return View("Insert", model);
                }

                return RedirectToAction("Index");
            }
            else
            {
                ModelState.AddModelError(string.Empty, Resource.CannotInsertData);
                return View("Insert", model);
            }
        }

        // GET: Admin/User/Edit/5
        public ActionResult Edit(int id)
        {
            UserEditModel model = new UserEditModel();
            ViewBag.Role = new SelectList(_roleService.GetAll(), "ID", "Name");

            ViewBag.IsInsert = false;
            var user = _userService.Get(id);

            model.UserName = user.UserName;
            model.Pass = user.Password;
            model.RoleID = user.RoleID;
            model.FullName = user.Name;
            model.Email = user.Email;
            model.Phone = user.Phone;
            model.Address = user.Address;

            ViewBag.AccountRole = model.RoleID.Split(',').Select(o => int.Parse(o)).ToArray();

            return View("Update", model);
        }

        // POST: Admin/User/Edit/5
        [HttpPost]
        public ActionResult Edit(UserEditModel model)
        {
            ViewBag.Role = new SelectList(_roleService.GetAll(), "ID", "Name");
            ViewBag.IsInsert = false;
            model.RoleID = string.Join(",", model.SelectedValues);
            if (ModelState.IsValid)
            {
                var user = new User();
                user.ID = model.ID;
                user.UserName = model.UserName;
                user.Name = model.FullName;
                user.Password = model.Pass;
                user.Phone = model.Phone;
                user.Email = model.Email;
                user.Address = model.Address;
                user.CreatedDate = DateTime.Now;
                user.RoleID = model.RoleID;
                user.Active = true;

                string error = _userService.Update(user);

                if (error != null)
                {
                    ModelState.AddModelError(string.Empty, error);
                    return View("Update", model);
                }

                return RedirectToAction("Index");
            }
            else
            {
                ModelState.AddModelError(string.Empty, Resource.CannotInsertData);
                ViewBag.AccountRole = model.RoleID.Split(',').Select(o => int.Parse(o)).ToArray();
                return View("Update", model);
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
