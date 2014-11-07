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
//= require best_in_place
//= require jquery_ujs
//= require_tree .


$(document).ready(function() {

  $(".shim").on("click", function(){
    $(this).hide();
    $(".user-sign-in-form").hide().css("top", "50%");
    $("body").css("overflow", "visible");
  });

  $(".sign-in-btn").click(function(event){
    event.preventDefault();
    $(".shim").show();
    $(".user-sign-in-form").show().animate({ top: "90px" }, 200);
    $("body").css("overflow", "hidden");
    $("body").animate({ scrollTop: 0 }, 200);
  });

  $(".best_in_place").best_in_place();

  // after bip editing happens
  $('.best_in_place').bind("ajax:success", function() {
    fields = $('.update-from-bip')

    // find updatable fields
    for (i = 0; i < fields.length; i++) {
      field = fields[i]
      field_name = $(field).data('name')

      // loop through and replace with updated content
      bip_element = $(".best_in_place[data-bip-attribute=" + field_name + "]")
      $(field).text(bip_element.text());
    }
  });


  $(".edit-btn").click(function(){
    $(".edit-container").show();
    $(".profile-container").hide();
    $(".done-btn").show();
    $(this).hide();
  });

  $(".done-btn").click(function(){
    $(".edit-container").hide();
    $(".profile-container").show();
    $(this).hide();
    $(".edit-btn").show();
  });

  $("#edit-announcement-btn").on('click', function() {
    $(".edit-announcement").show();
    $(".announcement-container").hide();
    $("#done-announcement-btn").show();
    $(this).hide();
  });

  $("#done-announcement-btn").on('click', function() {
    $(".announcement-container").show();
    $(".edit-announcement").hide();
    $("#edit-announcement-btn").show();
    $(this).hide();
  });

  $("#edit-checklist-btn").on('click', function() {
    $(".edit-checklist").show();
    $(".checklist-container").hide();
    $("#done-checklist-btn").show();
    $(this).hide();
  });

  $("#done-checklist-btn").on('click', function() {
    $(".checklist-container").show();
    $(".edit-checklist").hide();
    $("#edit-checklist-btn").show();
    $(this).hide();
  });

  $(".check-btn").on('click', function(){
    item = $(this)
    $(this).html("<strong>Completed!</strong>");
    params = { id: item.data("id") }
    $.get('/todos/checked', params, function(data) {
      item.closest(".line-item").addClass('color');
    });
  });

  $(".undo-btn").on('click', function(){
    item = $(this)
    $(this).html("");
    params = { id: item.data("id") }
    $.get('/todos/unchecked', params, function(data) {
      item.closest(".line-item").removeClass('color');
    });
  });

  $(window).load(function(){
    $(".hex-container").each(function(i) {
      fade_time = (i + 1) * 100
      row = $(this).find('.row')
      row.fadeIn(fade_time);
    });
  });



});
