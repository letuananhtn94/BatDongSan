using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BDS.Data.Enum
{
    public enum Price
    {
        [Description("Dưới 300 triệu")] Duoi300 = 0,
        [Description("300500")] Tu300To500 = 1
    }

    public enum KichthuocPhongNgu
    {
        [Description("--Kích thước phòng ngủ--")]
        Start =-1,
        [Description("Dưới 10 m2")]
        Duoi10m2 = 1,
        [Description("10 - 20 m2")]
        Tu10den20 = 2,
        [Description("Trên 20 m2")]
        Tren20 = 3,
    }

    public enum KichthuocToilet
    {
        [Description("--Kích thước phòng toilet--")]
        Start = -1,
        [Description("Dưới 3 m2")]
        Duoi3m2 = 1,
        [Description("3 - 5 m2")]
        Tu3den5 = 2,
        [Description("Trên 5 m2")]
        Tren5 = 3,
    }

    public enum KichthuocPhongKhach
    {
        [Description("--Kích thước phòng khách--")]
        Start = -1,
        [Description("Dưới 13 m2")]
        Duoi13m2 = 1,
        [Description("13 - 15 m2")]
        Tu13den15 = 2,
        [Description("16 - 20 m2")]
        Tu16den20 = 3,
        [Description("Trên 20 m2")]
        Tren20 = 4,
    }

    public enum SoLuongPhongNgu
    {

        [Description("--Số lượng phòng ngủ--")]
        Start = -1,
        [Description("1")]
        Mot = 1,
        [Description("2")]
        Hai = 2,
        [Description("3")]
        Ba = 3,
        [Description("4")]
        Bon = 4,
        [Description("5")]
        Nam = 5,
    }

    public enum SoLuongToiletChung
    {

        [Description("--Số lượng toilet chung--")]
        Start = -1,
        [Description("1")]
        Mot = 1,
        [Description("2")]
        Hai = 2,
        [Description("3")]
        Ba = 3,
        [Description("4")]
        Bon = 4,
        [Description("5")]
        Nam = 5,
    }

    public enum SoluongToiletRieng
    {

        [Description("--Số lượng toilet riêng--")]
        Start = -1,
        [Description("1")]
        Mot = 1,
        [Description("2")]
        Hai = 2,
        [Description("3")]
        Ba = 3,
        [Description("4")]
        Bon = 4,
        [Description("5")]
        Nam = 5,
    }

    public enum DoQuanTrong
    {
        [Description("-Độ quan trọng-")]
        Start,        
        [Description("1")]
        Mot = 1,
        [Description("2")]
        Hai,
        [Description("3")]
        Ba,
        [Description("4")]
        Bon,
        [Description("5")]
        Nam,
    }
}
