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

	$('#top_nav_content .close').hide()

    $('.add_to_cart_form').on("ajax:complete", function(){
		$('#link-to-cart').trigger('click')
	})

	$('#nav-bar li').on('click', function(){
		var toggle = $(this).data('toggle')
		var toggleItem = $('#top_nav_content').children('.'+toggle)
		toggleItem.slideDown()
		toggleItem.siblings().not('.close').slideUp();
		console.log(toggleItem.siblings().not('.close'))
		$('#top_nav_content .close').show()
		
		if ( $(this).attr('id') == 'currency-select' ) {
			$(event.target).click()
			$(this).children('form').submit()
		}


		if ( $(this).children('a').attr('href') == '/account' || $(this).children('a').attr('href') == '/logout'){
			return true; 
		} else {
			return false; 
		}

	})
	
	$('#top_nav_content .close').on('click', function(){
		$('#top_nav_content .close').hide()
		$('#top_nav_content').children().slideUp()
	})
})