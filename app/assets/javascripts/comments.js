$(document).ready(function(){
	$('#comments-link').click(function(e){
		e.preventDefault();
		$('#comment-section').show(function(){
			console.log('yayy')
		});
	});
});
	

