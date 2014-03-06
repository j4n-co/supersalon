$(document).ready(function(){
	var mapCanvas = $("#map-canvas")
	var map = $('#map-canvas .map-content').clone()
	
	mapCanvas.empty();

	//the Resig way of handling scroll binding
	didScroll = false;
 	
 	var checkScroll = function(){
    	didScroll = true;
    	console.log('scrollin')
 	}

	$(window).scroll(checkScroll);
	
	var showCanvas = function(){
    	if ( didScroll && mapCanvas.is(":in-viewport") && mapCanvas.html() == "" ) {
        	didScroll = false;
        	mapCanvas.append(map)
        	$(window).unbind('scroll',checkScroll);
    		clearInterval(interval)
    	}
	}
	

	var initialLoad = function(){
		if( mapCanvas.is(":in-viewport") && mapCanvas.html() == "" ){
			didScroll = true	
		}
	}

	var interval = setInterval(showCanvas, 250);

	initialLoad()
})