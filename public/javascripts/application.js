$(document).ready(function() {
  if($(".best_in_place").length) {
    $(".best_in_place").best_in_place();
  }

  if($(".datetime").length) {
    $(".datetime").datetime({format: "M d, yy 'at' hh:ii UTC"});
  }

  if ($(".header").length) {
    $('.header').click(function(e){
      $(e.target).siblings('.description').slideToggle();
    });

    $('.description').each(function(){
      $(this).slideToggle();
    }); 
  }

  if($("#sidebar").length) {
    SidebarMenu.register('sidebar');
  }
});
