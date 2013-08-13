using InfoCaster.Umbraco.TextFieldPreviewable.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace InfoCaster.Umbraco.TextFieldPreviewable.Serializers
{
	public static class TextFieldPreviewablePrevalueModelSerializer
	{
		static JavaScriptSerializer _javaScriptSerializer = new JavaScriptSerializer();

		public static string Serialize(TextFieldPreviewablePrevalueModel value)
		{
			return _javaScriptSerializer.Serialize(value);
		}

		public static TextFieldPreviewablePrevalueModel Deserialize(string value)
		{
			return _javaScriptSerializer.Deserialize<TextFieldPreviewablePrevalueModel>(value);
		}
	}
}