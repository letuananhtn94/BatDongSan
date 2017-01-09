using BDS.Data.Dto;
using BDS.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BDS.Areas.Admin.Controllers
{
    public class CriteriaController : BaseController
    {
        private readonly IProjectService _projectService;
        private readonly IProvinceService _provinceService;
        private readonly IDistrictService _districtService;
        private readonly ICriteriaService _criteriaService;
       
       
        public CriteriaController(IProjectService projectService, IProvinceService provinceService, IDistrictService district, ICriteriaService criteriaService)
        {
            _projectService = projectService;
            _provinceService = provinceService;
            _districtService = district;
            _criteriaService = criteriaService;
        }
        // GET: Admin/Criteria
        public ActionResult Index()
        {
            var result = _criteriaService.GetAll();
            return View(result);
        }

        // GET: Admin/Criteria/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Admin/Criteria/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Criteria/Create
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

        // GET: Admin/Criteria/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Admin/Criteria/Edit/5
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

        // GET: Admin/Criteria/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Admin/Criteria/Delete/5
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
