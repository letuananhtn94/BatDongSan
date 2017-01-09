using BDS.Data.Dto;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Windows;

namespace BDS.Helper
{
    public static class ImageUpload
    {
        private readonly static string pathImgProject = System.Configuration.ConfigurationManager.AppSettings["pathImageProject"];
        private readonly static string pathImgComment = System.Configuration.ConfigurationManager.AppSettings["pathImageComment"];

        public static Image UploadFile(HttpPostedFileBase file, Image img, bool? url = false)
        {
            string pathImage = "";
            if (url == false)
            {
                pathImage = pathImgProject;
            }
            else
            {
                pathImage = pathImgComment;
            }
                        
            string filename = System.IO.Path.GetFileName(file.FileName);
            filename = DateTime.Now.ToString("HH mm ss") + "_" + filename;
            filename = filename.Replace(" ", "-");

            string pathFileName = pathImage + filename;
            string targetFolder = HttpContext.Current.Server.MapPath(pathFileName);
            string targetPath = Path.Combine(targetFolder, pathFileName);
            file.SaveAs(targetFolder);
                               
            img.Name = filename;
            img.Url = pathImage;

            return img;
        }
    }
}