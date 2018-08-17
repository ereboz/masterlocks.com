   $(function(){     
    //smooth scrolling   
//      var headerHeight = $('.navbar-default').outerHeight();
//      console.log(headerHeight);
       $('.drop-button').click(function(e){
           var link = $(this).attr('href');
           var hash = this.hash;
           
           $('html, body').animate({
               scrollTop: $(link).offset().top
           }, 700 , "swing");
           e.preventDefault();
       });
   });