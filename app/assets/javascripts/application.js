// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

<script type="text/javascript">

  $(function() {
    $('#accordion > li').hover(
      function () {
        var $this = $(this);
        $this.stop().animate({'width':'480px'},500);
        $('.heading',$this).stop(true,true).fadeOut();
        $('.bgDescription',$this).stop(true,true).slideDown(500);
        $('.description',$this).stop(true,true).fadeIn();
      },
      function () {
        var $this = $(this);
        $this.stop().animate({'width':'115px'},1000);
        $('.heading',$this).stop(true,true).fadeIn();
        $('.description',$this).stop(true,true).fadeOut(500);
        $('.bgDescription',$this).stop(true,true).slideUp(700);
      }
    );
  });
</script>