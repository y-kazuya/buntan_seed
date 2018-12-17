$(document).on('turbolinks:load', function(){

  function checkCategory(){
    let category = $("#item_category").val()
    $("#sub_category_form").empty()
    $(".hidden_item").css("display", "none")
    if (category == "土地" || category == "建物"){
      appendSubCategory(category)
    }
    if (category == "廃棄食材" || category == "建物"){
      visibleNextForm(category)
    }

  }


  function buildHtml(category){
    let html = ``
    if(category == "建物"){
      html = `<label for="item_sub_category">サブカテゴリーは？</label>
        <select class="form-control" name="item[sub_category]" id="item_sub_category"><option value="10">空家</option>
        <option value="11">小屋</option>
        <option value="12">公共施設跡</option>
        <option value="13">商業施設跡</option></select>`
    }
    else if(category == "土地"){
      html = `<label for="item_sub_category">サブカテゴリーは？</label>
        <select class="form-control" name="item[sub_category]" id="item_sub_category"><option value="1">山</option>
        <option value="2">畑</option>
        <option value="3">空き地</option></select>`
    }
    return html
  }

  function appendSubCategory(category){
    var target = $("#sub_category_form")
    target.append(buildHtml(category))
  }


  function visibleNextForm(category){
    if(category == "廃棄食材"){
      $("#food_info_form").css("display", "block")
    }

    if (category == "建物"){
      $("#buiding_info_form").css("display", "block")
    }
  }

  function appendTagSummary(tag){
    var html =`<span class="tag_summary">${tag.name}</span>`

    return html

  }








  $("#item_category").on("change", function(){
    checkCategory()
  })

  if (location.pathname.includes('items')){
    checkCategory()
  }


  $(".tag_field").on("keyup",function(){
    let keyword = $(this).val()
    let target = $(this).siblings(".tag_summarys")
    $(".tag_summarys").empty()
    if (keyword !== "") {
      $.ajax({
        url: "/api/get_tags",
        type: "GET",
        data: {keyword: keyword},
        dataType: 'json',
      })
      .done(function(data){
        if (data.length !== 0){
          target.append(`<span class="tag_summary_title">類似のタグ</span>`)
          data.forEach(function(data){
            let html = appendTagSummary(data)
            target.append(html)
          });
        }
      })
      .fail(function() {
      });
    }
  })

  $(document).on("click",".tag_summary", function(){
    let target = $(this).parent(".tag_summarys").siblings(".tag_field")
    console.log($(this).text())
    target.val($(this).text())
  })


});