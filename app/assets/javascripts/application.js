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
//= require_tree .
//= require bootstrap
//= require bootstrap-modal
//= require bootstrap-modalmanager

// TODO: WTH is this?
$(".fb_share").click(function(){
  FB.ui({
    method: 'share',
    href: 'https://developers.facebook.com/docs/',
  }, function(response){});
});

$(function() {
	$("a.btn-qrcode").hover(function(e){
		$("body").append("<img id='tmp-qrcode' src='"+ this.href + "' width='150' height='150' alt='qr code'/>");
		$("#tmp-qrcode")
			.css("position", "absolute")
			.css("top", (e.pageY - 50) + "px")
			.css("left", e.pageX + "px")
			.fadeIn("fast");
	}, function(){
		$("#tmp-qrcode").remove();
	});
});
