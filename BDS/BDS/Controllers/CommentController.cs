using BDS.Data.Dto;
using BDS.Helper;
using BDS.Service;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BDS.Controllers
{
    public class CommentController : Controller
    {
        private readonly IProjectService _projectService;
        private readonly IProvinceService _provinceService;
        private readonly IDistrictService _districtService;
        private readonly ICriteriaService _criteriaService;
        private readonly ICommentService _commentService;
       
        List<Comment> comments = new List<Comment>();

        public CommentController(IProjectService projectService, IProvinceService provinceService, IDistrictService district, ICriteriaService criteriaService, ICommentService commentService)
        {
            _projectService = projectService;
            _provinceService = provinceService;
            _districtService = district;
            _criteriaService = criteriaService;
            _commentService = commentService;
        }
        // GET: Comment
        public ActionResult Index()
        {
            return View();
        }

        // GET: Comment/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Comment/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Comment/Create
        [HttpPost]
        public JsonResult Create(FormCollection collection)
        {
            Comment cm = new Comment();
            cm.Image = new List<Image>();

            if (Request.Files.AllKeys.Any())
            {
                for (int i = 0; i < Request.Files.Count; i++)
                {                    
                    HttpPostedFileBase file = Request.Files[i];

                    if (file != null)
                    {
                        Image img = new Image();
                        img = ImageUpload.UploadFile(file, img, true);
                        cm.Image.Add(img);
                    }
                }
            }

            long projecid = long.Parse(Request.Form["ProjectID"].ToString());
            cm.ProjectID = projecid;
            cm.UserID = long.Parse(Request.Form["UserID"].ToString());
            cm.Content = Request.Form["Content"].ToString();
            cm.CreatedDate = DateTime.Now;
            cm.Active = true;

            _commentService.Add(cm);
            comments = _commentService.GetListById(projecid);
            
            return Json(comments, JsonRequestBehavior.AllowGet);
        }

        // GET: Comment/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Comment/Edit/5
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

        // GET: Comment/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Comment/Delete/5
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
