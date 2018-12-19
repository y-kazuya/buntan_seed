$(document).on('turbolinks:load', function(){

  function checkCategory(category){
    console.log(category)
    $(".hidden_item").css("display", "none")
    if (category == "廃棄食材" || category == "建物"){

      visibleNextForm(category)
    }
  }


  function buildHtml(category){
    let html = ``
    html = `<input type="radio" value="${category.id}" name="item[sub_category_id]" id="item_sub_category_id_${category.id}">
            <label for="item_sub_category_id_${category.id}">${category.name}</label>`
    return html
  }

  function appendSubCategory(category){
    $.ajax({
      url: "/api/get_sub_cates",
      type: "GET",
      data: {category: category},
      dataType: 'json',
    })
    .done(function(data){
      console.log(data)
      if (data.length !== 0){
        var target = $("#sub_category_form")
        target.append(`<input type="hidden" name="item[sub_category_id]" value>`)
        data.forEach(function(cate){
          let html = buildHtml(cate)
          target.append(html)
        });
      }
    })
    .fail(function() {
    });
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








  $(".item_category").on("change", function(){
    let category = $("input[name='item[category_id]']:checked").next().text();
    $("#sub_category_form").empty()
    checkCategory(category)
    appendSubCategory(category)

  })

  if (location.pathname.includes('items')){
    let category = $("input[name='item[category_id]']:checked").next().text();
    checkCategory(category)

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