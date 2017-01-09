using BDS.Data.Dto;
using BDS.Data.Dto.Request;
using BDS.Data.Dto.Response;
using BDS.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BDS.Helper;

namespace BDS.Areas.Admin.Controllers
{
    public class ProjectController : BaseController
    {
        private readonly IProjectService _projectService;
        private readonly IProvinceService _provinceService;
        private readonly IDistrictService _districtService;
        private readonly ICriteriaService _criteriaService;
        List<Province> data = new List<Province>();
        List<District> district = new List<District>();
        public ProjectController(IProjectService projectService, IProvinceService provinceService, IDistrictService district, ICriteriaService criteriaService)
        {
            _projectService = projectService;
            _provinceService = provinceService;
            _districtService = district;
            _criteriaService = criteriaService;
        }
        // GET: Admin/Admin
        [HttpGet]        
        public ActionResult Index()
        {
            ViewBag.Criterias = _criteriaService.GetAll();
            data = _provinceService.GetAll();
            ViewBag.CbProvince = data;
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Index(Project project, SearchProject search, HttpPostedFileBase[] files)
        {
            try
            {                         
                project.Image = new List<Image>();
                project.DetailProject = new List<DetailProject>();
                var listCriteria = _criteriaService.FilterList(search.Criterias.ToList());

                foreach (var item in listCriteria.ToList())
                {
                    DetailProject dp = new DetailProject();
                    dp.CriteriaID = (int)item.ID;
                    dp.Value = !string.IsNullOrEmpty(item.Value) ? int.Parse(item.Value) : 0;

                    project.DetailProject.Add(dp);
                }

                if (files != null)
                {
                    /*Lopp for multiple files*/
                    foreach (HttpPostedFileBase file in files)
                    {
                        Image img = new Image();
                        img = ImageUpload.UploadFile(file, img);
                        project.Image.Add(img);
                    }
                }

                project.CreatedDate = DateTime.Now;
                project.Active = true;                        
                
            
                ServiceResult<Project> result = _projectService.Add(project);

                
            }
            catch(Exception ex)
            {
                
            }
            return Index();
        }

        public ActionResult Create()
        {
            return View();
        }

        public ActionResult List()
        {
            var result = _projectService.GetAll();
            return View(result);
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