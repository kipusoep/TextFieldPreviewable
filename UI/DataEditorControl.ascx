<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DataEditorControl.ascx.cs" Inherits="InfoCaster.Umbraco.TextFieldPreviewable.UI.DataEditorControl" %>

<%@ Import Namespace="InfoCaster.Umbraco.TextFieldPreviewable" %>

<link rel="stylesheet" type="text/css" href="<%= Page.ClientScript.GetWebResourceUrl(typeof(TextFieldPreviewableResources), "InfoCaster.Umbraco.TextFieldPreviewable.UI.res.css.textfieldpreviewable.css") %>" />

<asp:Panel runat="server" ID="pnlTextFieldPreviewable">
	<asp:MultiView runat="server" ID="mvEditors" ActiveViewIndex="0">
		<asp:View runat="server" ID="vwEditorsTextBox">
			<asp:TextBox runat="server" ID="tbTextBox" CssClass="umbEditorTextField" />
		</asp:View>
		<asp:View runat="server" ID="vwEditorsSimpleEditor">
			<asp:PlaceHolder runat="server" ID="phSimpleEditor" />
		</asp:View>
		<asp:View runat="server" ID="vwEditorsRichTextEditor">
			<asp:PlaceHolder runat="server" ID="phRichTextEditor" />
		</asp:View>
	</asp:MultiView>
	<div class="previewBox" style="width: <%= DataEditor.TextFieldPreviewablePrevalueModel.BoxWidth %>px; height: <%= DataEditor.TextFieldPreviewablePrevalueModel.BoxHeight %>px; font-family: <%= DataEditor.TextFieldPreviewablePrevalueModel.FontFamily %>; font-size: <%= DataEditor.TextFieldPreviewablePrevalueModel.FontSize %>px; line-height: <%= DataEditor.TextFieldPreviewablePrevalueModel.LineHeight %>px; font-weight: <%= DataEditor.TextFieldPreviewablePrevalueModel.FontWeight.ToString().ToLower() %>;">
		<div><%= tbTextBox.Text %></div>
	</div>
</asp:Panel>

<script type="text/javascript" src="<%= Page.ClientScript.GetWebResourceUrl(typeof(TextFieldPreviewableResources), "InfoCaster.Umbraco.TextFieldPreviewable.UI.res.js.jquery.color-2.1.2.js") %>"></script>
<script type="text/javascript" src="<%= Page.ClientScript.GetWebResourceUrl(typeof(TextFieldPreviewableResources), "InfoCaster.Umbraco.TextFieldPreviewable.UI.res.js.textfieldpreviewable.dataeditor.js") %>"></script>
<script type="text/javascript">
	var lineHeight = <%= DataEditor.TextFieldPreviewablePrevalueModel.LineHeight %>;
	jQuery(function () {
		jQuery("#<%= pnlTextFieldPreviewable.ClientID %>").textfieldPreviewable();
	});
</script>