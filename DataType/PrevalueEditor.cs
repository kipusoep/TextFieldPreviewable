using InfoCaster.Umbraco.TextFieldPreviewable.Models;
using InfoCaster.Umbraco.TextFieldPreviewable.Serializers;
using InfoCaster.Umbraco.TextFieldPreviewable.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using umbraco.BusinessLogic;
using umbraco.cms.businesslogic.datatype;
using umbraco.DataLayer;
using umbraco.interfaces;

namespace InfoCaster.Umbraco.TextFieldPreviewable.DataType
{
	public class PrevalueEditor : IDataPrevalue
	{
		public static ISqlHelper SqlHelper { get { return Application.SqlHelper; } }
		public TextFieldPreviewablePrevalueModel Configuration
		{
			get
			{
				TextFieldPreviewablePrevalueModel model = null;
				string config = SqlHelper.ExecuteScalar<string>("select value from cmsDataTypePreValues where datatypenodeid = @datatypenodeid", SqlHelper.CreateParameter("datatypenodeid", _datatype.DataTypeDefinitionId));
				if (!string.IsNullOrEmpty(config))
				{
					try
					{
						model = TextFieldPreviewablePrevalueModelSerializer.Deserialize(config);
					}
					catch { }
				}
				if (model == null)
					model = TextFieldPreviewablePrevalueModel.DefaultInstance;
				return model;
			}
		}

		BaseDataType _datatype;

		public PrevalueEditor() { }

		public PrevalueEditor(BaseDataType dataType)
		{
			_datatype = dataType;
		}

		public Control Editor
		{
			get
			{
				Page page = HttpContext.Current.CurrentHandler as Page;
				if (page != null)
				{
					if (_editor == null)
					{
						_editor = (PrevalueEditorControl)page.LoadControl("/Umbraco/TextFieldPreviewable/InfoCaster.Umbraco.TextFieldPreviewable.UI.PrevalueEditorControl.ascx");
						_editor.PrevalueEditor = this;
					}
					return _editor;
				}
				return null;
			}
		}
		PrevalueEditorControl _editor;

		public void Save()
		{
			_datatype.DBType = DBTypes.Ntext;

			PrevalueEditorControl prevalueEditorControl = Editor as PrevalueEditorControl;
			TextFieldPreviewablePrevalueModel prevalueModel = new TextFieldPreviewablePrevalueModel()
			{
				FontFamily = prevalueEditorControl.FontFamily,
				FontSize = prevalueEditorControl.FontSize,
				LineHeight = prevalueEditorControl.LineHeight,
				BoxWidth = prevalueEditorControl.BoxWidth,
				BoxHeight = prevalueEditorControl.BoxHeight
			};
			TextMode textMode;
			prevalueModel.TextMode = Enum.TryParse<TextMode>(prevalueEditorControl.TextMode, out textMode) ? textMode : TextMode.SingleLine;
			FontWeight fontWeight;
			prevalueModel.FontWeight = Enum.TryParse<FontWeight>(prevalueEditorControl.FontWeight, true, out fontWeight) ? fontWeight : FontWeight.Normal;
 
			SqlHelper.ExecuteNonQuery("delete from cmsDataTypePreValues where datatypenodeid = @dtdefid", SqlHelper.CreateParameter("@dtdefid", _datatype.DataTypeDefinitionId));
			SqlHelper.ExecuteNonQuery("insert into cmsDataTypePreValues (datatypenodeid, [value], sortorder, alias) values (@dtdefid, @value, 0, '')", SqlHelper.CreateParameter("@dtdefid", _datatype.DataTypeDefinitionId), SqlHelper.CreateParameter("@value", TextFieldPreviewablePrevalueModelSerializer.Serialize(prevalueModel)));
		}
	}
}