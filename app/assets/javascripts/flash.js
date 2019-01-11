$(document).on('turbolinks:load', function(){
  $(".flash-delete-button").on("click", function(){
    $(this).parents(".flash").remove()
  })
})