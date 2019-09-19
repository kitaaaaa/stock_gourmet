// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery 
//= require jquery_ujs
//= require_tree .

$(function(){
	$('#tab-contents .tab[id != "tab1"]').hide();
//'click'されたとき{}内の処理が発生.
$('#tab-menu a').on('click', function() {
	console.log("aaa")
  $("#tab-contents .tab").hide();
  //removeClass("X"); HTML要素の属性(X)を削除
  $("#tab-menu .active").removeClass("active");
  //this=タブがクリックされたとき
  $(this).addClass("active");
  //.attr(X)は、HTML要素の属性(X)を取得や設定をする
  $($(this).attr("href")).show();
  return false;
});
})