$(document).ready(function(){

	var header = $('#header')
	
	function scrollHeader(){
		if( $(window).scrollTop() < 10 ){
			header.removeClass('scrolled').addClass('top')
		}
		else {
			header.removeClass('top').addClass('scrolled')
		}		
	}

	$(window).bind('scroll', scrollHeader)	
	scrollHeader()
})