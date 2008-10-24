$(document).ready(function(){
	// if the slide contains just <h1> put it's text in single cell table
	$(".slide").each(function () {
		if (($(this).children().size() == 1) && ($(this).children().filter('h1').size() == 1)) {
			var text = $(this).children().filter('h1').text();
			$(this).html('<h1 class="hidden">'+text+'</h1><table class="singleCellTable"><tr><td>'+text+'</td></tr></table>');
		}
	});
});
