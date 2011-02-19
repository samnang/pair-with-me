$(document).ready(function() {
  $(".best_in_place").best_in_place();
  $(".datetime").datetime({format: "d M yy 'at' hh:ii UTC"});


  jQuery(function($) {
    var toggleLoading = function() { $("#pair_request_submit").toggle() };

    $("#new_pair_request")
    .bind("ajax:loading",  toggleLoading)
    .bind("ajax:complete", toggleLoading)
    .bind("ajax:success", function(data, status, xhr) {
      $("#response").html(status);
    });
  });
});
