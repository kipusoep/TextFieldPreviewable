(function ($) {
	/* 
	* jQuery extension
	*/
	$.fn.textfieldPreviewable = function () {
		/* 
		* jQuery cache 
		*/

		var $this,
		$textBox,
		$previewBox,
		$previewBoxInner,
		red = "rgb(255, 0, 0)",
		orange = "rgb(255, 165, 0)",
		green = "rgb(0, 128, 0)";
		updatePreviewEnabled = false;

		var updatePreview = function () {
			if (updatePreviewEnabled) {
				$previewBoxInner.html($textBox.val().replace(/\r/g, "").replace(/\n/g, "<br />"));
				if ($previewBoxInner.height() > $previewBox.height()) {
					if ($previewBox.css("background-color") != red) {
						$previewBox.stop(true, false).animate({
							backgroundColor: red
						}, 500);
					}
				} else if ($previewBoxInner.height() > ($previewBox.height() - lineHeight)) {
					if ($previewBox.css("background-color") != orange) {
						$previewBox.stop(true, false).animate({
							backgroundColor: orange
						}, 500);
					}
				} else {
					if ($previewBox.css("background-color") != green) {
						$previewBox.stop(true, false).animate({
							backgroundColor: green
						}, 500);
					}
				}
			}
		};

		/*
		* Constructor
		*/
		$this = this;

		// Cache DOM elements
		$textBox = $this.find("input");
		if (!$textBox.length)
			$textBox = $this.find("textarea");
		$previewBox = $this.find(".previewBox");
		$previewBoxInner = $previewBox.children();
		$previewBoxInner.html($textBox.val());

		// DOM event wire ups
		$textBox.on("focus", function () {
			$previewBox.stop(true, true).fadeIn(500, function () {
				updatePreviewEnabled = true;
				updatePreview();
			});
		});
		$textBox.on("blur", function () {
			updatePreviewEnabled = false;
			$previewBox.stop(true, true).fadeOut(500);
		});
		$textBox.on("keydown keyup change", updatePreview);
	}
}(jQuery));