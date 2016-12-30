using BDS.Data.Dto.Request;
using BDS.Data.Dto.Response;
using BDS.Data.Enum;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BDS.Data.Extensions;
using System.Web.UI.WebControls;

namespace BDS.Repository.EntityFramework
{
    public class PagingHelper
    {
        public static SearchResult<T> GetPage<T>(IQueryable<T> data, SearchCriteria pagingCriteria)
        {
            var result = new SearchResult<T>
            {
                CurrentPage = pagingCriteria.CurrentPage,
                PageSize = pagingCriteria.PageSize,
                RowCount = data.Count()
            };
            result.PageCount = result.RowCount / result.PageSize + (result.RowCount % result.PageSize > 0 ? 1 : 0);
            result.Data = LinqExtension.OrderBy(data,"ID").Skip((result.CurrentPage - 1) * result.PageSize).Take(result.PageSize);
            result.ResultCode = ResultCode.Ok;

            return result;
        }

        public static SearchResult<T> GetPage<T, D>(IQueryable<T> data, SearchCriteria<D> pagingCriteria)
        {
            var result = new SearchResult<T>
            {
                CurrentPage = pagingCriteria.CurrentPage,
                PageSize = pagingCriteria.PageSize,
                RowCount = data.Count()
            };
            result.PageCount = result.RowCount / result.PageSize + (result.RowCount % result.PageSize > 0 ? 1 : 0);
            result.Data = data.Skip((result.CurrentPage - 1) * result.PageSize).Take(result.PageSize);
            result.ResultCode = ResultCode.Ok;

            return result;
        }


    }
}
