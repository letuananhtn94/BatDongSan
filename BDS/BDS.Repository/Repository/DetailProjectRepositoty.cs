using BDS.Repository.IRepository;
using BDS.Repository.EntityFramework;
using BDS.Data.Dto.Request;
using BDS.Data.Dto.Response;
using System.Linq;
using System.Data.Entity;
using System;
using BDS.Data.Enum;

namespace BDS.Repository.Repository
{
    class DetailProjectRepositoty : GenericRepository<DetailProject>, IDetailProjectRepositoty
    {
        public DetailProjectRepositoty(IBaseRepository baseRepository) : base(baseRepository.GetContext())
        {
        }

        public SearchResult<DetailProject> Search(SearchProject search)
        {
            var query = Query().Include(v => v.Project).Include(v => v.Criteria);
            if (search.BaseSearchProject != null)
            {
                switch (search.BaseSearchProject.PriceType)
                {
                    case (int)Price.Duoi300:
                        query.Where(t => t.Project.Price < 300 && t.Project.UnitPrice.Equals("triệu"));
                        break;
                }
            }
            //query.Where(t=>t.Project.Address.Contains(s) &&)
            var predicate = PredicateBuilder.False<DetailProject>();
            foreach (var item in search.Criterias)
            {
                if (item.selected || item.Value.HasValue)
                {
                    if (item.tienquyet)
                    {
                        predicate = predicate.And(t => t.ID == item.ID);
                    }
                    else
                    {
                        predicate = predicate.Or(t => t.ID == item.ID);
                    }
                    if (item.Value.HasValue && !string.IsNullOrEmpty(item.EnumType))
                    {
                       switch (item.EnumType)
                        {
                            case "Price":

                                break;
                        }
                    }
                }
            }

            query = query.Where(predicate);

            var pageData = PagingHelper.GetPage(query, search);

            return pageData;
        }
    }
}
