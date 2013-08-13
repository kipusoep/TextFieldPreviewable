$(function () {
	$fontFamily.add($fontSize).add($lineHeight).add($fontWeight).add($boxWidth).add($boxHeight).on("keydown keyup change", function () {
		updateTextFieldPreviewable();
	});
});

function updateTextFieldPreviewable() {
	$previewBox.css({
		"font-family": $fontFamily.val(),
		"font-size": $fontSize.val() + "px",
		"line-height": $lineHeight.val() + "px",
		"font-weight": $fontWeight.val()
	})
	.width($boxWidth.val())
	.height($boxHeight.val())
	.show();
}