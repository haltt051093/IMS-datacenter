using System;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Web.Mvc;

namespace IMS.Extensions
{
    public static class HtmlExtension
    {
        public static MvcHtmlString SpecialLabel(this HtmlHelper html, string expression, string id = "", bool generatedId = false)
        {
            return SpecialLabelHelper(html, ModelMetadata.FromStringExpression(expression, html.ViewData), expression, id, generatedId);
        }

        [SuppressMessage("Microsoft.Design", "CA1006:DoNotNestGenericTypesInMemberSignatures", Justification = "This is an appropriate nesting of generic types")]
        public static MvcHtmlString SpecialLabelFor<TModel, TValue>(this HtmlHelper<TModel> html, Expression<Func<TModel, TValue>> expression, string id = "", bool generatedId = false)
        {
            return SpecialLabelHelper(html, ModelMetadata.FromLambdaExpression(expression, html.ViewData), ExpressionHelper.GetExpressionText(expression), id, generatedId);
        }

        internal static MvcHtmlString SpecialLabelHelper(HtmlHelper html, ModelMetadata metadata, string htmlFieldName, string id, bool generatedId)
        {
            string labelText = metadata.DisplayName ?? metadata.PropertyName ?? htmlFieldName.Split('.').Last();
            if (String.IsNullOrEmpty(labelText))
            {
                return MvcHtmlString.Empty;
            }
            var sb = new StringBuilder();
            sb.Append(labelText);

            var tag = new TagBuilder("label");
            if (!string.IsNullOrWhiteSpace(id))
            {
                tag.Attributes.Add("id", id);
            }
            else if (generatedId)
            {
                tag.Attributes.Add("id", html.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldId(htmlFieldName) + "_Label");
            }
            if (metadata.IsRequired)
            {
                tag.Attributes.Add("class", "required");
            }

            tag.Attributes.Add("for", html.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldId(htmlFieldName));
            tag.SetInnerText(sb.ToString());

            return MvcHtmlString.Create(tag.ToString(TagRenderMode.Normal));
        }
    }
}