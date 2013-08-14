<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DataEditorControl.ascx.cs" Inherits="InfoCaster.Umbraco.TextFieldPreviewable.UI.DataEditorControl" %>

<%@ Import Namespace="InfoCaster.Umbraco.TextFieldPreviewable" %>

<link rel="stylesheet" type="text/css" href="<%= Page.ClientScript.GetWebResourceUrl(typeof(TextFieldPreviewableResources), "InfoCaster.Umbraco.TextFieldPreviewable.UI.res.css.textfieldpreviewable.css") %>" />
<style type="text/css">
	.previewBox { width: <%= DataEditor.TextFieldPreviewablePrevalueModel.BoxWidth %>px; height: <%= DataEditor.TextFieldPreviewablePrevalueModel.BoxHeight %>px; font-size: <%= DataEditor.TextFieldPreviewablePrevalueModel.FontSize %>px; line-height: <%= DataEditor.TextFieldPreviewablePrevalueModel.LineHeight %>px; font-weight: <%= DataEditor.TextFieldPreviewablePrevalueModel.FontWeight.ToString().ToLower() %>; }
</style>

<asp:Panel runat="server" ID="pnlTextFieldPreviewable">
	<asp:TextBox runat="server" ID="tbTextBox" CssClass="umbEditorTextField" />
	<div class="previewBox">
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