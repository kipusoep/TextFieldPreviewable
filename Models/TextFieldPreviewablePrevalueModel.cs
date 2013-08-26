using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InfoCaster.Umbraco.TextFieldPreviewable.Models
{
	public class TextFieldPreviewablePrevalueModel
	{
		public TextMode TextMode { get; set; }
		public string FontFamily { get; set; }
		public int FontSize { get; set; }
		public int LineHeight { get; set; }
		public FontWeight FontWeight { get; set; }
		public int BoxWidth { get; set; }
		public int BoxHeight { get; set; }

		public static TextFieldPreviewablePrevalueModel DefaultInstance
		{
			get
			{
				return new TextFieldPreviewablePrevalueModel()
				{
					TextMode = TextMode.SingleLine,
					FontFamily = "Arial",
					FontSize = 12,
					LineHeight = 12,
					FontWeight = FontWeight.Normal
				};
			}
		}
	}
}
