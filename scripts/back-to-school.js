$(window).load(function() {

    var loc = window.location.href.toLowerCase();

	// for back-to-school page, we need to make the container full width (.container-fluid) for bg graphic
	if (loc.indexOf('/back-to-school') > -1) {

		// write debug messages to console when testing
	    const debug = true;

	    function log(message) {
	      if (debug) { 
	        console.log(message);
	      }
	    }

	    var pageName = '';
	    var pageContainer = '';
		$pageName = $('#catalog_content');
		$pageContainer = $pageName.find('.container');
		$pageContainer.removeClass('container').addClass('container-fluid');

	}

});