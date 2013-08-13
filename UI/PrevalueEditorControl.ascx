<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PrevalueEditorControl.ascx.cs" Inherits="InfoCaster.Umbraco.TextFieldPreviewable.UI.PrevalueEditorControl" %>

<%@ Import Namespace="InfoCaster.Umbraco.TextFieldPreviewable" %>

<link rel="stylesheet" type="text/css" href="<%= Page.ClientScript.GetWebResourceUrl(typeof(TextFieldPreviewableResources), "InfoCaster.Umbraco.TextFieldPreviewable.UI.res.css.textfieldpreviewable.css") %>" />
<style type="text/css">
	#previewBox { -webkit-opacity: <%= BoxOpacity %>; -khtml-opacity: <%= BoxOpacity %>; -moz-opacity: <%= BoxOpacity %>; opacity: <%= BoxOpacity %>; -ms-filter: ~"progid:DXImageTransform.Microsoft.Alpha(opacity=<%= BoxOpacity * 100 %>)"; filter: ~"alpha(opacity=<%= BoxOpacity * 100 %>)"; }
</style>

<div class="propertyItem" style="display: none;">
	<div class="propertyItemheader">
		<label for="<%= ddlFontFamily.ClientID %>">Font-family:</label>
	</div>
	<asp:DropDownList runat="server" ID="ddlFontFamily" EnableViewState="false" />
</div>
<div class="propertyItem">
	<div class="propertyItemheader">
		<label for="<%= tbFontSize.ClientID %>">Font-size:</label>
	</div>
	<asp:TextBox runat="server" ID="tbFontSize" CssClass="small" Text="12" /> px
</div>
<div class="propertyItem">
	<div class="propertyItemheader">
		<label for="<%= tbLineHeight.ClientID %>">Line-height:</label>
	</div>
	<asp:TextBox runat="server" ID="tbLineHeight" CssClass="small" Text="22" /> px
</div>
<div class="propertyItem">
	<div class="propertyItemheader">
		<label for="<%= ddlFontWeight.ClientID %>">Font-size:</label>
	</div>
	<asp:DropDownList runat="server" ID="ddlFontWeight" EnableViewState="false">
		<asp:ListItem Text="Normal" />
		<asp:ListItem Text="Bold" />
	</asp:DropDownList>
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
<div id="previewBox">
	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam cursus felis vel purus dignissim, eu aliquam lectus dignissim. Donec vel quam consequat, posuere risus interdum, dignissim arcu. In egestas diam nisl, sit amet lobortis odio eleifend quis. Ut consectetur, massa ut interdum luctus, diam mauris facilisis ipsum, nec consectetur urna quam eu nulla. Integer nec odio quis ligula aliquet ultricies. Cras pulvinar sem at ullamcorper laoreet. Pellentesque nec tortor interdum, pharetra nulla in, convallis purus. Suspendisse condimentum purus eget massa rhoncus, eu fringilla metus lacinia. Donec rutrum sem ut faucibus convallis. Fusce sit amet quam eu orci fringilla mattis at eu tortor. Etiam orci ligula, pharetra vitae leo tincidunt, consequat placerat ipsum. Nullam tempor erat eu lacus varius, sed tincidunt ante dapibus.
</div>

<script type="text/javascript" src="<%= Page.ClientScript.GetWebResourceUrl(typeof(TextFieldPreviewableResources), "InfoCaster.Umbraco.TextFieldPreviewable.UI.res.js.jquery.numeric.js") %>"></script>
<script type="text/javascript">
	var $previewBox, $fontFamily, $fontSize, $lineHeight, $fontWeight, $boxWidth, $boxHeight;
	$(function () {
		$previewBox = $("#previewBox");
		$fontFamily = $("#<%= ddlFontFamily.ClientID %>");
		$fontSize = $("#<%= tbFontSize.ClientID %>").numeric();
		$lineHeight = $("#<%= tbLineHeight.ClientID %>").numeric();
		$fontWeight = $("#<%= ddlFontWeight.ClientID %>");
		$boxWidth = $("#<%= tbBoxWidth.ClientID %>").numeric();
		$boxHeight = $("#<%= tbBoxHeight.ClientID %>").numeric();
	});
</script>
<script type="text/javascript" src="<%= Page.ClientScript.GetWebResourceUrl(typeof(TextFieldPreviewableResources), "InfoCaster.Umbraco.TextFieldPreviewable.UI.res.js.textfieldpreviewable.prevalueeditor.js") %>"></script>