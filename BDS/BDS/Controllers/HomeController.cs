using BDS.Data.Dto.Request;
using BDS.Data.Dto;
using BDS.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BDS.Controllers
{
    public class HomeController : Controller
    {
        private readonly IProjectService _projectService;
        private readonly IProvinceService _provinceService;
        private readonly IDistrictService _districtService;
        private readonly ICriteriaService _criteriaService;
        List<Province> data = new List<Province>();
        List<District> district = new List<District>();
        public HomeController(IProjectService projectService, IProvinceService provinceService, IDistrictService district, ICriteriaService criteriaService)
        {
            _projectService = projectService;
            _provinceService = provinceService;
            _districtService = district;
            _criteriaService = criteriaService;
        }
        public ActionResult Index(SearchProject search)
        {
            search.Criterias = new List<Criteria>
            {
                new Criteria {
                    selected = true,
                },
            };
            var result = _projectService.Search(search);
            data = _provinceService.GetAll();
            
            ViewBag.CbProvince = data;
            return View(result);
        }

        public ActionResult Detail(long projectId)
        {
            var result = _projectService.GetById(projectId);
            return View(result);
        }

        public ActionResult List(SearchProject search)
        {
            ViewBag.Criterias = _criteriaService.GetAll();
            var result = _projectService.Search(search);
            return View(result);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public void SetViewBag(long? selectedId = null)
        {
            data = _provinceService.GetAll();
            ViewBag.CategoryID = new SelectList(data, "ID", "Name", selectedId);
        }

        
        public ActionResult GetDistrictByID(string id)
        {
            try
            {
                district = _districtService.GetAllById(id);
            }
            catch (Exception ex)
            {
                //Log errror
            }
            return Json(district, JsonRequestBehavior.AllowGet);
        }
    }
}