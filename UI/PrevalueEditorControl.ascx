<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PrevalueEditorControl.ascx.cs" Inherits="InfoCaster.Umbraco.TextFieldPreviewable.UI.PrevalueEditorControl" %>

<%@ Import Namespace="InfoCaster.Umbraco.TextFieldPreviewable" %>

<link rel="stylesheet" type="text/css" href="<%= Page.ClientScript.GetWebResourceUrl(typeof(TextFieldPreviewableResources), "InfoCaster.Umbraco.TextFieldPreviewable.UI.res.css.textfieldpreviewable.css") %>" />

<div class="propertyItem">
	<div class="propertyItemheader">
		<label for="<%= ddlFontFamily.ClientID %>">Font-family:</label>
	</div>
	<asp:DropDownList runat="server" ID="ddlFontFamily" EnableViewState="false" />
</div>
<div class="propertyItem">
	<div class="propertyItemheader">
		<label for="<%= tbFontSize.ClientID %>">Font-size:</label>
	</div>
	<asp:Panel runat="server" ID="pnlFontSize">
		<div class="jqueryui-slider"></div>
		<asp:TextBox runat="server" ID="tbFontSize" CssClass="guiInputTextTiny jqueryui-slider-textbox" /> px
	</asp:Panel>
</div>
<div class="propertyItem">
	<div class="propertyItemheader">
		<label for="<%= tbLineHeight.ClientID %>">Line-height:</label>
	</div>
	<asp:Panel runat="server" ID="pnlLineHeight">
		<div class="jqueryui-slider"></div>
		<asp:TextBox runat="server" ID="tbLineHeight" CssClass="guiInputTextTiny jqueryui-slider-textbox" /> px
	</asp:Panel>
</div>
<div class="propertyItem">
	<div class="propertyItemheader">
		<label for="<%= rblFontWeight.ClientID %>">Font-size:</label>
	</div>
	<asp:RadioButtonList runat="server" ID="rblFontWeight" RepeatDirection="Horizontal" EnableViewState="false">
		<asp:ListItem Text="Normal" />
		<asp:ListItem Text="Bold" />
	</asp:RadioButtonList>
</div>
<div class="propertyItem">
	<div class="propertyItemheader">
		<label for="<%= tbBoxWidth.ClientID %>">Box-width:</label>
	</div>
	<asp:TextBox runat="server" ID="tbBoxWidth" CssClass="small" /> px
</div>
<div class="propertyItem">
	<div class="propertyItemheader">
		<label for="<%= tbBoxHeight.ClientID %>">Box-height:</label>
	</div>
	<asp:TextBox runat="server" ID="tbBoxHeight" CssClass="small" /> px
</div>

<script type="text/javascript" src="<%= Page.ClientScript.GetWebResourceUrl(typeof(TextFieldPreviewableResources), "InfoCaster.Umbraco.TextFieldPreviewable.UI.res.js.jquery.numeric.js") %>"></script>
<script type="text/javascript" src="<%= Page.ClientScript.GetWebResourceUrl(typeof(TextFieldPreviewableResources), "InfoCaster.Umbraco.TextFieldPreviewable.UI.res.js.textfieldpreviewable.prevalueeditor.js") %>"></script>
<script type="text/javascript">
	jQuery(window).load(function () {
		$("#<%= pnlFontSize.ClientID %>").tfpSlider({ value: <%= FontSize %> });
		$("#<%= pnlLineHeight.ClientID %>").tfpSlider({ value: <%= LineHeight %> });
		$("#<%= tbBoxWidth.ClientID %>").numeric();
		$("#<%= tbBoxHeight.ClientID %>").numeric();
	});
</script>