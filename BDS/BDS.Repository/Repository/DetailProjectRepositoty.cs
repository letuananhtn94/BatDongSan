using BDS.Repository.IRepository;
using BDS.Repository.EntityFramework;
using BDS.Data.Dto.Request;
using BDS.Data.Dto.Response;
using System.Linq;
using System.Data.Entity;
using System;
using BDS.Data.Enum;
using LinqKit;
using System.Collections.Generic;

namespace BDS.Repository.Repository
{
    class DetailProjectRepositoty : GenericRepository<DetailProject>, IDetailProjectRepositoty
    {
        public DetailProjectRepositoty(IBaseRepository baseRepository) : base(baseRepository.GetContext())
        {
        }

        public SearchResult<DetailProject> Search(SearchProject search)
        {
            var detailList = new List<DetailProject>();
            var query = Query().Include(v => v.Project).Include(v => v.Criteria);
            
            var inner = PredicateBuilder.False<DetailProject>();
            var outer = PredicateBuilder.True<DetailProject>();
            foreach (var item in search.Criterias)
            {                
                if (item.Selected)
                {                    
                    if (!string.IsNullOrEmpty(item.EnumType))
                    {
                        if (!string.IsNullOrEmpty(item.Value) && !item.Value.Equals("0"))
                        {
                            var value = int.Parse(item.Value);
                            switch (item.EnumType)
                            {
                                case "Address":
                                    var address = int.Parse(item.Value);
                                    inner = inner.Or(t => t.CriteriaID == item.ID && t.Value == address);
                                    break;
                                case "Price":
                                    switch (value)
                                    {
                                        case (int)Price.Duoi300:
                                            inner = inner.Or(t => t.CriteriaID == item.ID && t.Project.Price < 300
                                                                                        && t.Project.UnitPrice.Equals("triệu"));
                                            break;
                                        case (int)Price.Tu300To500:
                                            inner = inner.Or(t => t.CriteriaID == item.ID && t.Project.Price >= 300
                                                                                            && t.Project.Price < 500
                                                                                            && t.Project.UnitPrice.Equals("triệu"));
                                            break;
                                        case (int)Price.Tu500To1:
                                            inner = inner.Or(t => t.CriteriaID == item.ID && t.Project.Price >= 500
                                                                                            && t.Project.Price < 1000
                                                                                            && t.Project.UnitPrice.Equals("triệu"));
                                            break;
                                        case (int)Price.Tren1:
                                            inner = inner.Or(t => t.CriteriaID == item.ID && t.Project.Price >= 1
                                                                                            && t.Project.UnitPrice.Equals("tỷ"));
                                            break;
                                    }
                                    break;
                                case "Acreage":
                                    switch (value)
                                    {
                                        case (int)Acreage.Duoi50:
                                            inner = inner.Or(t => t.CriteriaID == item.ID && t.Project.Acreage < 50);
                                            break;
                                        case (int)Acreage.Tu50To80:
                                            inner = inner.Or(t => t.CriteriaID == item.ID && t.Project.Acreage >= 50
                                                                                            && t.Project.Acreage < 80);
                                            break;
                                        case (int)Acreage.Tu80To100:
                                            inner = inner.Or(t => t.CriteriaID == item.ID && t.Project.Acreage >= 80
                                                                                            && t.Project.Acreage < 100);
                                            break;
                                        case (int)Acreage.Tren100:
                                            inner = inner.Or(t => t.CriteriaID == item.ID && t.Project.Acreage >= 100);
                                            break;
                                    }

                                    break;
                                case "KichthuocPhongNgu":

                                    switch (value)
                                    {
                                        case (int)KichthuocPhongNgu.Duoi10m2:
                                            inner = inner.Or(t => t.CriteriaID == item.ID && t.Value < 10);
                                            break;
                                        case (int)KichthuocPhongNgu.Tu10den20:
                                            inner = inner.Or(t => t.CriteriaID == item.ID && t.Value >= 10
                                                                                            && t.Value <= 20);
                                            break;
                                        case (int)KichthuocPhongNgu.Tren20:
                                            inner = inner.Or(t => t.CriteriaID == item.ID && t.Value > 20);
                                            break;
                                    }


                                    break;
                                case "KichthuocToilet":
                                    switch (value)
                                    {
                                        case (int)KichthuocToilet.Duoi3m2:
                                            inner = inner.Or(t => t.CriteriaID == item.ID && t.Value < 3);
                                            break;
                                        case (int)KichthuocToilet.Tu3den5:
                                            inner = inner.Or(t => t.CriteriaID == item.ID && t.Value >= 3
                                                                                            && t.Value <= 5);
                                            break;
                                        case (int)KichthuocToilet.Tren5:
                                            inner = inner.Or(t => t.CriteriaID == item.ID && t.Value > 5);
                                            break;
                                    }

                                    break;
                                case "KichthuocPhongKhach":
                                    switch (value)
                                    {
                                        case (int)KichthuocPhongKhach.Duoi13m2:
                                            inner = inner.Or(t => t.CriteriaID == item.ID && t.Value < 13);
                                            break;
                                        case (int)KichthuocPhongKhach.Tu13den15:
                                            inner = inner.Or(t => t.CriteriaID == item.ID && t.Value >= 13
                                                                                            && t.Value <= 15);
                                            break;
                                        case (int)KichthuocPhongKhach.Tu16den20:
                                            inner = inner.Or(t => t.CriteriaID == item.ID && t.Value >= 16
                                                                                            && t.Value < 20);
                                            break;
                                        case (int)KichthuocPhongKhach.Tren20:
                                            inner = inner.Or(t => t.CriteriaID == item.ID && t.Value >= 20);
                                            break;
                                    }
                                    break;
                                case "SoLuongPhongNgu":
                                    inner = inner.Or(t => t.CriteriaID == item.ID && t.Value == value);

                                    break;
                                case "SoLuongToiletChung":
                                    inner = inner.Or(t => t.CriteriaID == item.ID && t.Value == value);
                                    break;
                                case "SoluongToiletRieng":
                                    inner = inner.Or(t => t.CriteriaID == item.ID && t.Value == value);
                                    break;
                                case "Huong":
                                    inner = inner.Or(t => t.CriteriaID == item.ID && t.Value == value);
                                    break;
                            }
                        }
                    }
                    else
                    {
                        inner = inner.Or(t => t.CriteriaID == item.ID);
                    }
                }
            }
            //outer = outer.And(inner.Expand());

            query = query.AsExpandable().Where(inner);
            var pageData = PagingHelper.GetPage(query, search);

            return pageData;
        }
    }
}
