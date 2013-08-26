using InfoCaster.Umbraco.TextFieldPreviewable.DataType;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using umbraco.editorControls.simpleEditor;
using umbraco.editorControls.tinyMCE3;
using umbraco.interfaces;

namespace InfoCaster.Umbraco.TextFieldPreviewable.UI
{
	public partial class DataEditorControl : UserControl
	{
		public string Text
		{
			get { return DataEditor.TextFieldPreviewablePrevalueModel.TextMode == Models.TextMode.SingleLine ? tbTextBox.Text : _simpleEditor.Text; }
			set { tbTextBox.Text = _simpleEditor.Text = value; }
		}
		public DataEditor DataEditor
		{
			get
			{
				return _dataEditor;
			}
			set
			{
				_dataEditor = value;

				if (_simpleEditor == null)
					_simpleEditor = new SimpleEditor(DataEditor.Data);
			}
		}

		DataEditor _dataEditor;
		SimpleEditor _simpleEditor;

		protected override void OnLoad(EventArgs e)
		{
			base.OnLoad(e);

			if (!IsPostBack && DataEditor.Data != null && DataEditor.Data.Value != null)
				tbTextBox.Text = DataEditor.Data.Value.ToString();

			if (DataEditor.TextFieldPreviewablePrevalueModel.TextMode != Models.TextMode.SingleLine)
			{
				switch (DataEditor.TextFieldPreviewablePrevalueModel.TextMode)
				{
					case Models.TextMode.MultiLine:
						if (phSimpleEditor.Controls.Count == 0)
							phSimpleEditor.Controls.Add(_simpleEditor);
						mvEditors.SetActiveView(vwEditorsSimpleEditor);
						break;
				}
			}
		}
	}
}