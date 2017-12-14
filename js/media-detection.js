var isMobile = navigator.userAgent.toLowerCase().match(/(iphone|ipod|ipad|android|blackberry|opera mini|iemobile|kindle|silk|mobile)/);

$(function() {
    
    //== add class to html based on whether device is mobile or not
    if (isMobile) {
        $('html').addClass('mobile');
    } else {
        $('html').addClass('no-mobile');
    }
    
    //== disable tel links on non-touch devices
    $('.no-touch a[href^="tel:"],.no-mobile a[href^="tel:"]').on('click tap', function (e) {
        e.preventDefault();
    });
    
    // Remove phone formatting for numbers on iphone
    var phoneNumberUnformater = $('.not-phone');
    if(phoneNumberUnformater.length > 0) {
        $('.not-phone').on('click tap', function (e) {
            e.preventDefault();
        });
    }
    
});

function youtube_parser (url) {
    var regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
    var match = url.match(regExp);
    if (match && match[2].length == 11) {
        return match[2];
    } else {
        return url;
    }
}