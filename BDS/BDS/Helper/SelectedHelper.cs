using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace BDS.Helper
{
    public static class SelectedHelper
    {
        public static MvcHtmlString EnumDropDownListFor<TModel, TProperty, TEnum>(
                    this HtmlHelper<TModel> htmlHelper,
                    Expression<Func<TModel, TProperty>> expression,
                    TEnum selectedValue)
        {
            IEnumerable<TEnum> values = Enum.GetValues(typeof(TEnum))
                                        .Cast<TEnum>();
            IEnumerable<SelectListItem> items = from value in values
                                                select new SelectListItem()
                                                {
                                                    Text = value.ToString(),
                                                    Value = value.ToString(),
                                                    Selected = (value.Equals(selectedValue))
                                                };
            return SelectExtensions.DropDownListFor(htmlHelper, expression, items);
        }

        public static IEnumerable<SelectListItem> ToSelectList(this Enum enumValue)
        {            
            var enumValues = Enum.GetValues(enumValue.GetType());
            return from Enum e in enumValues
                   select new SelectListItem
                   {
                       Selected = e.Equals(enumValue),
                       Text = e.ToDescription(),
                       Value = Convert.ToInt32(e).ToString()
                    };
        }

        public static string ToDescription(this Enum value)
        {
            var attributes = (DescriptionAttribute[])value.GetType().GetField(value.ToString()).GetCustomAttributes(typeof(DescriptionAttribute), false);
            return attributes.Length > 0 ? attributes[0].Description : value.ToString();
        }
    }
}