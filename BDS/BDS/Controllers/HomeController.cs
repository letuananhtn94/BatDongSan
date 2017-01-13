using BDS.Data.Dto.Request;
using BDS.Data.Dto;
using BDS.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BDS.Common;

namespace BDS.Controllers
{
    
    public class HomeController : Controller
    {
        private readonly IProjectService _projectService;
        private readonly IProvinceService _provinceService;
        private readonly IDistrictService _districtService;
        private readonly ICriteriaService _criteriaService;
        private readonly ICommentService _commentService;
        List<Province> data = new List<Province>();
        List<District> district = new List<District>();
        List<Comment> comments = new List<Comment>();
        List<Criteria> criterias = new List<Criteria>();

        public HomeController(IProjectService projectService, IProvinceService provinceService, IDistrictService district, ICriteriaService criteriaService, ICommentService commentService)
        {
            _projectService = projectService;
            _provinceService = provinceService;
            _districtService = district;
            _criteriaService = criteriaService;
            _commentService = commentService;
        }

        [HttpGet]
        public ActionResult Index(SearchProject search)
        {
            search.ddlProvince = "01";
            search.ddlDistrict = "001";
            var project = _projectService.GetListTopHome();
            data = _provinceService.GetAll();
            ViewBag.CbProvince = data;
            ViewBag.TopHome = project;
            return View(search);
        }

        [HttpPost]
        public ActionResult Index(SearchProject search, FormCollection collection)
        {                        
            search.Criterias = new List<Criteria>();
            criterias = _criteriaService.GetAll();

            Criteria cr = new Criteria();
            cr.ID = long.Parse(Request.Form["Address.ID"].ToString());
            cr.Selected = bool.Parse(Request.Form["Address.Selected"].ToString());
            cr.Value = Request.Form["Address.Value"].ToString();
            cr.EnumType = Request.Form["Address.EnumType"].ToString();
            cr.Importance = int.Parse(Request.Form["Address.Importance"].ToString());
            cr.Prerequisite = Convert.ToBoolean(Request.Form.GetValues("Address.Prerequisite")[0].ToString());
            cr.ddlProvince = search.ddlProvince;
            cr.ddlDistrict = search.ddlDistrict;
            criterias[94] = cr;
            cr = new Criteria();
            cr.ID = long.Parse(Request.Form["Price.ID"].ToString());
            cr.Selected = bool.Parse(Request.Form["Price.Selected"].ToString());
            cr.Value = Request.Form["Price.Value"].ToString();
            cr.EnumType = Request.Form["Price.EnumType"].ToString();
            cr.Importance = int.Parse(Request.Form["Price.Importance"].ToString());
            cr.Prerequisite = Convert.ToBoolean(Request.Form.GetValues("Price.Prerequisite")[0].ToString());
            criterias[95] = cr;
            cr = new Criteria();
            cr.ID = long.Parse(Request.Form["Acreage.ID"].ToString());
            cr.Selected = bool.Parse(Request.Form["Acreage.Selected"].ToString());
            cr.Value = Request.Form["Acreage.Value"].ToString();
            cr.EnumType = Request.Form["Acreage.EnumType"].ToString();
            cr.Importance = int.Parse(Request.Form["Acreage.Importance"].ToString());
            cr.Prerequisite = Convert.ToBoolean(Request.Form.GetValues("Acreage.Prerequisite")[0].ToString());
            criterias[96] = cr;
            cr = new Criteria();

            foreach (var item in criterias)
            {
                search.Criterias.Add(item);
            }

            TempData["search"] = search;

            return RedirectToAction("List");
        }

        public ActionResult Detail(long projectId, SearchProject search)
        {
            //Lay danh sach tieu chi tim kiem
            ViewBag.Criterias = _criteriaService.GetAll();

            if (TempData["search"] != null)
            {
                search = (SearchProject)TempData["search"];
                ViewBag.Criterias = search.Criterias;
            }

            //Lay danh sach comment
            comments = _commentService.GetListById(projectId);
            ViewBag.ListComment = comments;
            // Lay danh sach tinh/ thanh pho
            data = _provinceService.GetAll();
            ViewBag.CbProvince = data;

            ViewBag.ListTuongTu = TempData["ListProject"];

            var result = _projectService.GetById(projectId);
            return View(result);
        }


        public ActionResult List(SearchProject search)
        {
            var searchModel = new SearchProject();
            if (TempData["search"] != null)
            {
                search = (SearchProject)TempData["search"];
            }
           
            ViewBag.Criterias = _criteriaService.GetAll();
            //ViewBag.Criterias = searchModel.Criterias;

            //TempData["search"] = search;
            var listCriteria = new List<Criteria>();
            if (search.Criterias != null)
            {
                listCriteria = _criteriaService.FilterList(search.Criterias.ToList());
                search.Criterias = listCriteria;
            }                        
            var result = _projectService.Search(search);

            TempData["ListProject"] = result.Data.ToList();
            data = _provinceService.GetAll();
            ViewBag.CbProvince = data;

            ViewBag.Searchs = listCriteria;

            return View(result);
        }


        public ActionResult About()
        {
            var project = _projectService.GetListTopHome();
            ViewBag.TopHome = project;

            return View();
        }

        public ActionResult Contact()
        {
            var project = _projectService.GetListTopHome();
            ViewBag.TopHome = project;

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