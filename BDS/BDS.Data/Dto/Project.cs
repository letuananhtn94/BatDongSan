using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StaticResource;

namespace BDS.Data.Dto
{
    public class Project : BaseData
    {

        [Required(ErrorMessageResourceName = "RequiredError", ErrorMessageResourceType = typeof(Resource))]
        [Display(Name="Tiêu đề")]
        public string Name { get; set; }

        [Required(ErrorMessageResourceName = "RequiredError", ErrorMessageResourceType = typeof(Resource))]
        [Display(Name = "Địa chỉ")]
        public string Address { get; set; }

        [Required(ErrorMessageResourceName = "RequiredError", ErrorMessageResourceType = typeof(Resource))]
        [Display(Name = "Liên hệ")]
        public string Contact { get; set; }

        [Required(ErrorMessageResourceName = "RequiredError", ErrorMessageResourceType = typeof(Resource))]
        [Display(Name = "Giá")]
        public double? Price { get; set; }

        [Required(ErrorMessageResourceName = "RequiredError", ErrorMessageResourceType = typeof(Resource))]
        public string UnitPrice { get; set; }

        [Required(ErrorMessageResourceName = "RequiredError", ErrorMessageResourceType = typeof(Resource))]
        [Display(Name = "Diện tích")]
        public double? Acreage { get; set; }
        [Display(Name = "Tình trạng")]
        public string Status { get; set; }
        [Display(Name = "Ngày kết thúc")]

        public DateTime? Deadline { get; set; }

        [Required(ErrorMessageResourceName = "RequiredError", ErrorMessageResourceType = typeof(Resource))]
        [Display(Name = "Mô tả")]
        public string Description { get; set; }
        public string Lat { get; set; }
        public string Long { get; set; }
        public int? TypeID { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string ModifiedBy { get; set; }
        public bool? Active { get; set; }

        public float Score { get; set; }
        public List<Criteria> search { get; set; }
        public virtual IList<Image> Image { get; set; }
        public virtual IList<DetailProject> DetailProject { get; set; }
    }
}
