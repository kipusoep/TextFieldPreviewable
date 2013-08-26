using InfoCaster.Umbraco.TextFieldPreviewable.DataType;
using System;
using System.Collections.Generic;
using System.Drawing.Text;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InfoCaster.Umbraco.TextFieldPreviewable.UI
{
	[ClientDependency.Core.ClientDependency(ClientDependency.Core.ClientDependencyType.Javascript, "ui/jqueryui.js", "UmbracoClient")]
	[ClientDependency.Core.ClientDependency(ClientDependency.Core.ClientDependencyType.Javascript, "ui/jquery.alphanumeric.js", "UmbracoClient")]
	[ClientDependency.Core.ClientDependency(ClientDependency.Core.ClientDependencyType.Css, "DateTimePicker/datetimepicker.css", "UmbracoClient")]
	public partial class PrevalueEditorControl : UserControl
	{
		public PrevalueEditor PrevalueEditor { get; set; }
		public string TextMode { get { return ddlTextMode.SelectedValue; } }
		public string FontFamily { get { return ddlFontFamily.SelectedValue; } }
		public int FontSize { get { return int.Parse(tbFontSize.Text); } }
		public int LineHeight { get { return int.Parse(tbLineHeight.Text); } }
		public string FontWeight { get { return rblFontWeight.SelectedValue; } }
		public int BoxWidth { get { return int.Parse(tbBoxWidth.Text); } }
		public int BoxHeight { get { return int.Parse(tbBoxHeight.Text); } }

		protected override void OnLoad(EventArgs e)
		{
			base.OnLoad(e);

			ddlTextMode.DataSource = Enum.GetValues(typeof(Models.TextMode));
			ddlTextMode.DataBind();

			InstalledFontCollection installedFontCollection = new InstalledFontCollection();
			ddlFontFamily.DataSource = installedFontCollection.Families.Select(x => x.Name);
			ddlFontFamily.DataBind();

			if (PrevalueEditor.Configuration == null)
			{
				ddlTextMode.SelectedValue = Models.TextMode.SingleLine.ToString();
				ddlFontFamily.SelectedValue = "Arial";
			}
			else
			{
				ddlTextMode.SelectedValue = PrevalueEditor.Configuration.TextMode.ToString();
				ddlFontFamily.SelectedValue = PrevalueEditor.Configuration.FontFamily;
				tbFontSize.Text = PrevalueEditor.Configuration.FontSize.ToString();
				tbLineHeight.Text = PrevalueEditor.Configuration.LineHeight.ToString();
				rblFontWeight.SelectedValue = PrevalueEditor.Configuration.FontWeight.ToString();
				tbBoxWidth.Text = PrevalueEditor.Configuration.BoxWidth.ToString();
				tbBoxHeight.Text = PrevalueEditor.Configuration.BoxHeight.ToString();
			}
		}
	}
}