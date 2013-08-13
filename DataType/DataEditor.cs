using InfoCaster.Umbraco.TextFieldPreviewable.Models;
using InfoCaster.Umbraco.TextFieldPreviewable.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using umbraco.interfaces;

namespace InfoCaster.Umbraco.TextFieldPreviewable.DataType
{
	public class DataEditor : IDataEditor
	{
		public IData Data { get; set; }
		public TextFieldPreviewablePrevalueModel TextFieldPreviewablePrevalueModel { get; set; }

		DataEditorControl _editorControl;

		public DataEditor(IData data, TextFieldPreviewablePrevalueModel prevalueModel)
		{
			Data = data;
			TextFieldPreviewablePrevalueModel = prevalueModel;

			Page page = HttpContext.Current.CurrentHandler as Page;
			if (page != null)
			{
				_editorControl = (DataEditorControl)page.LoadControl("/Umbraco/TextFieldPreviewable/InfoCaster.Umbraco.TextFieldPreviewable.UI.DataEditorControl.ascx");
				_editorControl.DataEditor = this;
			}
		}

		public virtual bool TreatAsRichTextEditor
		{
			get { return false; }
		}

		public bool ShowLabel
		{
			get { return true; }
		}

		public Control Editor { get { return _editorControl; } }

		public void Save()
		{
			Data.Value = _editorControl.Text;
		}
	}
}
