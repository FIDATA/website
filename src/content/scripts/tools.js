// @license Copyright © 2014  Basil Peace
$(document).ready(function () {
	with ($("td.BlockTitle")) {
		click(function () {
			var blockContent = $(this.parentNode.parentNode.parentNode).find("tbody");
			if ($(blockContent).css("display") == "none")
				$(blockContent).css("display", "block");
			else
				$(blockContent).css("display", "none");
		});
	}
});
