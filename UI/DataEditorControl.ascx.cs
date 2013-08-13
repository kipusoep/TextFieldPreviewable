using InfoCaster.Umbraco.TextFieldPreviewable.DataType;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InfoCaster.Umbraco.TextFieldPreviewable.UI
{
	public partial class DataEditorControl : UserControl
	{
		public string Text { get { return tbTextBox.Text; } set { tbTextBox.Text = value; } }
		public DataEditor DataEditor { get; set; }
		public string UniqueClientID { get { return string.Concat("_", UniqueID.Replace('$', '_')); } }

		protected double BoxOpacity { get { return .5; } }

		protected override void OnLoad(EventArgs e)
		{
			base.OnLoad(e);

			if (!IsPostBack && DataEditor.Data != null && DataEditor.Data.Value != null)
				tbTextBox.Text = DataEditor.Data.Value.ToString();
		}
	}
}