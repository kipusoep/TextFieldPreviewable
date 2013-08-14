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
		public string Text
		{
			get { return tbTextBox.Text; }
			set { tbTextBox.Text = value; }
		}
		public DataEditor DataEditor { get; set; }

		protected override void OnLoad(EventArgs e)
		{
			base.OnLoad(e);

			if (!IsPostBack && DataEditor.Data != null && DataEditor.Data.Value != null)
				tbTextBox.Text = DataEditor.Data.Value.ToString();
		}
	}
}