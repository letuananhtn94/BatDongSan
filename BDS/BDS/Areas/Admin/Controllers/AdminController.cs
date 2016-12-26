using BDS.Data.Dto;
using BDS.Data.Dto.Response;
using BDS.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BDS.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        private readonly IProjectService _projectService;
        private readonly ICriteriaService _criteriaService;

        public AdminController(IProjectService projectService, ICriteriaService criteriaService)
        {
            _projectService = projectService;
            _criteriaService = criteriaService;
        }
        // GET: Admin/Admin
        [HttpGet]
        public ActionResult Index()
        {
            ViewBag.Criterias = _criteriaService.GetAll();
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Index(Project project, HttpPostedFileBase[] files)
        {
            try
            {
                string urlImage = "/Images/Project/";                
                project.Image = new List<Image>();

                /*Lopp for multiple files*/
                foreach (HttpPostedFileBase file in files)
                {
                    Image img = new Image();
                    /*Geting the file name*/
                    string filename = System.IO.Path.GetFileName(file.FileName);
                    /*Saving the file in server folder*/
                    file.SaveAs(Server.MapPath(urlImage + filename));
                    string pathImage = urlImage + filename;
                    /*HERE WILL BE YOUR CODE TO SAVE THE FILE DETAIL IN DATA BASE*/

                    img.Name = filename;
                    img.Url = urlImage;
                    project.Image.Add(img);
                }
            
                ServiceResult<Project> result = _projectService.Add(project);

                ViewBag.Message = "File Uploaded successfully.";
            }
            catch(Exception ex)
            {
                ViewBag.Message = "Error while uploading the files.";
            }
            return Index();
        }

        public ActionResult Create()
        {
            return View();
        }
    }
}