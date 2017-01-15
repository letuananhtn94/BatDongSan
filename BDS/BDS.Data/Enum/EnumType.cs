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
        [Description("--Chọn giá--")]
        Start,
        [Description("Dưới 300 triệu")]
        Duoi300,
        [Description("300 - 500 triệu")]
        Tu300To500,
        [Description("500 - 1 tỷ")]
        Tu500To1,
        [Description("Trên 1 tỷ")]
        Tren1
    }

    public enum Acreage
    {
        [Description("--Chọn diện tích--")]
        Start,
        [Description("Dưới 50 m2")]
        Duoi50,
        [Description("50 - 80 m2")]
        Tu50To80,
        [Description("80 - 100 m2")]
        Tu80To100,
        [Description("Trên 100 m2")]
        Tren100
    }

    public enum KichthuocPhongNgu
    {
        [Description("--Kích thước phòng ngủ--")]
        Start,
        [Description("Dưới 10 m2")]
        Duoi10m2,
        [Description("10 - 20 m2")]
        Tu10den20,
        [Description("Trên 20 m2")]
        Tren20
    }

    public enum KichthuocToilet
    {
        [Description("--Kích thước phòng toilet--")]
        Start,
        [Description("Dưới 3 m2")]
        Duoi3m2,
        [Description("3 - 5 m2")]
        Tu3den5,
        [Description("Trên 5 m2")]
        Tren5
    }

    public enum KichthuocPhongKhach
    {
        [Description("--Kích thước phòng khách--")]
        Start,
        [Description("Dưới 13 m2")]
        Duoi13m2,
        [Description("13 - 15 m2")]
        Tu13den15,
        [Description("16 - 20 m2")]
        Tu16den20,
        [Description("Trên 20 m2")]
        Tren20
    }

    public enum SoLuongPhongNgu
    {

        [Description("--Số lượng phòng ngủ--")]
        Start,
        [Description("1")]
        Mot,
        [Description("2")]
        Hai,
        [Description("3")]
        Ba,
        [Description("4")]
        Bon,
        [Description("5")]
        Nam
    }

    public enum SoLuongToiletChung
    {

        [Description("--Số lượng toilet chung--")]
        Start,
        [Description("1")]
        Mot,
        [Description("2")]
        Hai,
        [Description("3")]
        Ba,
        [Description("4")]
        Bon,
        [Description("5")]
        Nam
    }

    public enum SoluongToiletRieng
    {

        [Description("--Số lượng toilet riêng--")]
        Start,
        [Description("1")]
        Mot,
        [Description("2")]
        Hai,
        [Description("3")]
        Ba,
        [Description("4")]
        Bon,
        [Description("5")]
        Nam
    }

    public enum Huong
    {

        [Description("--Chọn hướng--")]
        Start,
        [Description("Bắc")]
        Bac,
        [Description("Nam")]
        Nam,
        [Description("Tây")]
        Tay,
        [Description("Đông")]
        Dong,
        [Description("Tây Bắc")]
        TayBac,
        [Description("Đông Bắc")]
        DongBac,
        [Description("Tây Nam")]
        TayNam,
        [Description("Đông Nam")]
        DongNam
    }

    public enum Importance
    {
        [Description("--Độ quan trọng--")]
        Start,        
        [Description("1")]
        Mot,
        [Description("2")]
        Hai,
        [Description("3")]
        Ba,
        [Description("4")]
        Bon,
        [Description("5")]
        Nam
    }
}
