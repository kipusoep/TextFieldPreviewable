(function ($) {
	/* 
	* jQuery extension
	*/
	$.fn.tfpSlider = function (options) {
		/* 
		* jQuery cache 
		*/

		// overall container of the URL picker
		var $this,
		$slider,
		$textbox;

		// This is the easiest way to have default options.
		var settings = $.extend({
			// These are the defaults.
			value: 0
		}, options );

		/*
		* Constructor
		*/
		$this = this;

		// Cache DOM elements
		$slider = $this.find(".jqueryui-slider");
		$textbox = $this.find("input");

		$slider.slider({
			value: settings.value,
			max: 50,
			slide: function(e, ui) {
				$textbox.val(ui.value);
			}
		});
		$textbox.val($slider.slider('value')).numeric();

		return $this;
	}
}(jQuery));

//$(function () {
//	$fontFamily.add($fontSize).add($lineHeight).add($fontWeight).add($boxWidth).add($boxHeight).on("keydown keyup change", function () {
//		updateTextFieldPreviewable();
//	});
//});

//function updateTextFieldPreviewable() {
//	$previewBox.css({
//		"font-family": $fontFamily.val(),
//		"font-size": $fontSize.val() + "px",
//		"line-height": $lineHeight.val() + "px",
//		"font-weight": $fontWeight.val()
//	})
//	.width($boxWidth.val())
//	.height($boxHeight.val())
//	.show();
//}