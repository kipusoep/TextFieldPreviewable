using System;
using umbraco.cms.businesslogic.datatype;
using umbraco.interfaces;
using Umbraco.Core;

namespace InfoCaster.Umbraco.TextFieldPreviewable.DataType
{
	public class DataType : BaseDataType, IDataType
	{
		static readonly Guid _guid = new Guid("7a5355a6-684c-4813-9c0d-8487852bd08b");

		IDataEditor _editor;
		IData _baseData;
		IDataPrevalue _prevalueeditor;

		public override IDataEditor DataEditor 
		{
			get
			{
				if (_editor == null)
					_editor = new DataEditor(Data, ((PrevalueEditor)PrevalueEditor).Configuration);
				return _editor;
			}
		}

		public override IData Data 
		{
			get 
			{
				if (_baseData == null)
					_baseData = new DefaultData(this);
				return _baseData;
			}
		}
		public override Guid Id 
		{
			get { return _guid; }
		}

		public override string DataTypeName 
		{
			get { return "Textbox Previewable"; }
		}

		public override IDataPrevalue PrevalueEditor 
		{
			get 
			{
				if (_prevalueeditor == null)
					_prevalueeditor = new PrevalueEditor(this);
				return _prevalueeditor;
			}
		}
	}
}