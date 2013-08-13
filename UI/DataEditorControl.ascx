<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DataEditorControl.ascx.cs" Inherits="InfoCaster.Umbraco.TextFieldPreviewable.UI.DataEditorControl" %>

<%@ Import Namespace="InfoCaster.Umbraco.TextFieldPreviewable" %>

<link rel="stylesheet" type="text/css" href="<%= Page.ClientScript.GetWebResourceUrl(typeof(TextFieldPreviewableResources), "InfoCaster.Umbraco.TextFieldPreviewable.UI.res.css.textfieldpreviewable.css") %>" />
<style type="text/css">
	.previewBox { width: <%= DataEditor.TextFieldPreviewablePrevalueModel.BoxWidth %>px; height: <%= DataEditor.TextFieldPreviewablePrevalueModel.BoxHeight %>px; font-size: <%= DataEditor.TextFieldPreviewablePrevalueModel.FontSize %>px; line-height: <%= DataEditor.TextFieldPreviewablePrevalueModel.LineHeight %>px; font-weight: <%= DataEditor.TextFieldPreviewablePrevalueModel.FontWeight.ToString().ToLower() %>;
		-webkit-opacity: <%= BoxOpacity %>; -khtml-opacity: <%= BoxOpacity %>; -moz-opacity: <%= BoxOpacity %>; opacity: <%= BoxOpacity %>; -ms-filter: ~"progid:DXImageTransform.Microsoft.Alpha(opacity=<%= BoxOpacity * 100 %>)"; filter: ~"alpha(opacity=<%= BoxOpacity * 100 %>)"; }
</style>

<asp:TextBox runat="server" ID="tbTextBox" CssClass="umbEditorTextField" />
<div id="previewBox<%= UniqueClientID %>" class="previewBox">
	<div><%= tbTextBox.Text %></div>
</div>

<script type="text/javascript" src="<%= Page.ClientScript.GetWebResourceUrl(typeof(TextFieldPreviewableResources), "InfoCaster.Umbraco.TextFieldPreviewable.UI.res.js.jquery.color-2.1.2.js") %>"></script>
<script type="text/javascript">
	var $tbTextBox<%= UniqueClientID %>, lineHeight<%= UniqueClientID %> = <%= DataEditor.TextFieldPreviewablePrevalueModel.LineHeight %>;
	var $previewBox<%= UniqueClientID %>, $previewBoxInner<%= UniqueClientID %>;
	var red = "rgb(255, 0, 0)", orange = "rgb(255, 165, 0)", green = "rgb(0, 128, 0)";
	var updatePreviewEnabled<%= UniqueClientID %> = false;
	$(function () {
		$tbTextBox<%= UniqueClientID %> = $("#<%= tbTextBox.ClientID %>");
		$previewBox<%= UniqueClientID %> = $("#previewBox<%= UniqueClientID %>");
		$previewBoxInner<%= UniqueClientID %> = $previewBox<%= UniqueClientID %>.children();
		$previewBoxInner<%= UniqueClientID %>.html($tbTextBox<%= UniqueClientID %>.val());
		$tbTextBox<%= UniqueClientID %>.on("focus", function () {
			$previewBox<%= UniqueClientID %>.stop(true, true).show(500, function () {
				updatePreviewEnabled<%= UniqueClientID %> = true;
				updatePreview<%= UniqueClientID %>();
			});
		});
		$tbTextBox<%= UniqueClientID %>.on("blur", function () {
			updatePreviewEnabled<%= UniqueClientID %> = false;
			$previewBox<%= UniqueClientID %>.stop(true, true).hide(500);
		});
		$tbTextBox<%= UniqueClientID %>.on("keydown keyup change", updatePreview<%= UniqueClientID %>);
	});

	function updatePreview<%= UniqueClientID %>() {
		if (updatePreviewEnabled<%= UniqueClientID %>) {
			$previewBoxInner<%= UniqueClientID %>.html($tbTextBox<%= UniqueClientID %>.val());
			if ($previewBoxInner<%= UniqueClientID %>.height() > $previewBox<%= UniqueClientID %>.height()) {
				if ($previewBox<%= UniqueClientID %>.css("background-color") != red) {
					$previewBox<%= UniqueClientID %>.stop(true, false).animate({
						backgroundColor: red
					}, 500);
				}
			} else if ($previewBoxInner<%= UniqueClientID %>.height() > ($previewBox<%= UniqueClientID %>.height() - lineHeight<%= UniqueClientID %>)) {
				if ($previewBox<%= UniqueClientID %>.css("background-color") != orange) {
					$previewBox<%= UniqueClientID %>.stop(true, false).animate({
						backgroundColor: orange
					}, 500);
				}
			} else {
				if ($previewBox<%= UniqueClientID %>.css("background-color") != green) {
					$previewBox<%= UniqueClientID %>.stop(true, false).animate({
						backgroundColor: green
					}, 500);
				}
			}
		}
	}
</script>