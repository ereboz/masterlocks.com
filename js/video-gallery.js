var videoScreen = $('#vid_frame'); // caching vars
var videoMenuBtn = $('.video-play');
var mobileVideoLink = $('#mobileVideoLink');
var videoTitle = $('#featured-video-title');
var firstUrl = $('.video-play-chosen').first();// find first video instance in DOM - not the champagne
if(firstUrl ==undefined || firstUrl == null || firstUrl.length==0){
    firstUrl = $('.video-play').first();
}
function setupVideoGallery() {
    
    if (isMobile && window.matchMedia('(max-width: 600px)').matches) {
        videoScreen.hide();
        videoMenuBtn.on('click tap', function() {
            var videoName = $(this).find('.video-title').text(); // Helps with GA tracking
            // ga('send', 'event', 'Video Play', 'click', videoName);// GA tracking
            window.open($(this).attr('href'));
            return false;
        });
        $('#tabs-horizontal-video').easyResponsiveTabs({
            type: 'accordion',
            width: 'auto',
            fit: true,
            closed: false
        });
        $(mobileVideoLink).show();
    } else {
        videoScreen.show();
        $(mobileVideoLink).hide();
        
        videoMenuBtn.on('click', function() {
            var videoName = $(this).find('.video-title').text(); // Helps with GA tracking
            var videoDescription = $(this).find('.video-description').text(); // Helps with GA tracking
            // ga('send', 'event', 'Video Play', 'click', videoName);// GA tracking
            $(videoScreen).attr("src", $(this).attr("href")+"&autoplay=1");
            $(videoTitle).attr("value",videoName);
            $(mobileVideoLink).attr("href","http://www.youtube.com/watch?v="+$(this).find('.youtube-video-id').attr('value'));
            $('#current-video-title').html(videoName);
            $('#current-video-description').html(videoDescription);
            return false;
        });
        $('#tabs-horizontal-video').easyResponsiveTabs({
            type: 'default',
            width: 'auto',
            fit: true,
            closed: 'accordion'
        });
    }
    
    $(videoScreen).attr("src", firstUrl.attr("href")); // Sets up first video up
    $(videoTitle).attr("value",firstUrl.find('.video-title').text());
    $('#current-video-title').html(firstUrl.find('.video-title').text());
    $('#current-video-description').html(firstUrl.find('.video-description').text());
    $(mobileVideoLink).attr("href","http://www.youtube.com/watch?v="+firstUrl.find('.youtube-video-id').attr('value'));
    
}
$(function() {
    setupVideoGallery();
});

// Download Link Handler
var downLoadLink = $("#downloadLink");// cache the downloader
downLoadLink.attr("href", firstUrl.data("download-link" ));// load first instance into downloader
$(downLoadLink).on('click', function(){
    // ga('send', 'event', 'Video Play', 'download', $('#featured-video-title').attr("value"));
});
$('.video-play').on('click', function() {// load user selected instance
    $(downLoadLink).attr("href", $(this).data("download-link"));
    $(downLoadLink).on('click', function(){
        // ga('send', 'event', 'Video Play', 'download', $('#featured-video-title').attr("value"));
    });
});

// Delayed Active Menu matcher
function onLoadHandler() {
    
    var bcHrefId = $.trim(downLoadLink.attr('href'));
    if(bcHrefId.length > 0) {
        $(".video-download-container").show();
    } else {
        $(".video-download-container").hide();
    }
    
    setTimeout(function() {
        var iFrameUrl = videoScreen.attr("src"); //control url;
        videoMenuBtn.each(function(){
            var btnUrl = $(this).attr('href');
            var btnUrlX = $(this).attr('href') + "&autoplay=1"; //add autoplay query string back into url when video is manually selected
            if(( iFrameUrl == btnUrl) || ( iFrameUrl == btnUrlX)) {
                $(this).addClass("current-video");
            } else {
                $(this).removeClass("current-video");
            }
        });
    },1);
}