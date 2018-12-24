$(document).on('turbolinks:load', function(){

  if ($(".user_type").length){
    var ownerTarget = $(".user_type").find("input")[1]
    var managerTarget = $(".user_type").find("input")[3]
    console.log(ownerTarget)
    if (ownerTarget.checked){
      $(ownerTarget).parent(".form_item").next(".hidden_item").css("display", "block")
    }
    if (managerTarget.checked){
      $(managerTarget).parent(".form_item").next(".hidden_item").css("display", "block")
    }
  }

  $(".user_type").find("input").on("change", function(){
    const target = $(this).parent(".form_item").next(".hidden_item")
    let val = $(this)[0].checked
    if (val){
      target.css("display", "block")
    }
    else{
      target.css("display", "none")
    }
  })


  $(document).on("change",".file" ,function(e) {
    var file = e.target.files[0];
    var reader = new FileReader();
    var target = $(this).parent(".picture_field").find("img")
    if(file.type.indexOf("image") != 0){
      alert("画像ファイルを選択してください");
      return false;
    }

    reader.onload = (function(){
      return function(e){
        target.attr("src", e.target.result);
      };
    })(file);
    reader.readAsDataURL(file);
  })
});