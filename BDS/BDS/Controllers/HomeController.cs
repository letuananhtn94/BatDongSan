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
            ViewBag.Criterias = _criteriaService.GetAll();
            var project = _projectService.GetListTopHome();
            data = _provinceService.GetAll();            
            ViewBag.CbProvince = data;
            ViewBag.TopHome = project;
            return View();
        }

        public ActionResult Detail(long projectId, SearchProject search)
        {
            ViewBag.Criterias = _criteriaService.GetAll();
            data = _provinceService.GetAll();
            ViewBag.CbProvince = data;
            ViewBag.ListTuongTu = TempData["ListProject"];
            var result = _projectService.GetById(projectId);
            return View(result);
        }

        public ActionResult List(SearchProject search)
        {
            ViewBag.Criterias = _criteriaService.GetAll();
            if (search.Criterias != null)
            {
                var listCriteria = _criteriaService.FilterList(search.Criterias.ToList());
                search.Criterias = listCriteria;
            }                        
            var result = _projectService.Search(search);

            TempData["ListProject"] = result.Data.ToList();
            data = _provinceService.GetAll();
            ViewBag.CbProvince = data;

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

        public ActionResult GetAddress(string provinceid, string districtid)
        {
            string address = "";
            try
            {
                District district = _districtService.GetById(districtid);
                Province province = _provinceService.GetById(provinceid);

                address = district.Name + "," + province.Name;
            }
            catch (Exception ex)
            {
                //Log errror
            }
            return Json(address, JsonRequestBehavior.AllowGet);
        }
    }
}