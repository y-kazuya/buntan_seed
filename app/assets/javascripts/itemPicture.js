$(document).on('turbolinks:load', function(){

  function buildPicterField(count){

    var html = `<div class="picture_field">
      <label for="item_pictures_attributes_${count}_content">
      <img class="picture_preview" src="/assets/kesiki-c68ae405e3bfe214e28f403580a17a08639de4edda0b9398276810cd384cc340.jpg" alt="Kesiki">
      </label><input class="display_none file" type="file" name="item[pictures_attributes][${count}][content]" id="item_pictures_attributes_${count}_content">
      <span id="remove_PF">
        ×
      </span>
      <div class="picture_comment">
      <input type="text" name="item[pictures_attributes][${count}][comment]" id="item_pictures_attributes_${count}_comment">
      </div>
      </div>`



    return html
  }


  $(".add_picture_bottun").on("click", function(){
    let count = $(".picture_field").length
    if (count< 5){
      const target = $(".picture_area")
      target.append(buildPicterField(count))
    }

    if (count == 4){
      $(this).remove()
    }
  })

  $(document).on("click","#remove_PF", function(){
    $(this).parent(".picture_field").remove()
  })
});