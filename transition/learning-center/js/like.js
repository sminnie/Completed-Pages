$(document).ready(function() {
	//Nav Fix
	if (currId) {
		var currSub = $('#' + currId).parent().parent();
		currSub.removeClass('hassub');
		currSub.addClass('currsub');
	}
	
	
	
	//Like Buttons
	$('#likeButton').on('click', function() {
	  ga("send", "event", "Transition Learning Center", "Like", document.URL);
	  $('#helpfulQuestion').html('<p>Thank you for your response.</p>');
	});
	$('#dislikeButton').on('click', function() {
	  ga("send", "event", "Transition Learning Center", "Dislike", document.URL);
	  $('#helpfulQuestion').html('<p>Thank you for your response.</p>');
	});
});
