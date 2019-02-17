$(document).on('turbolinks:load', function(){
  const target = $(".select_citys")

  function replaceCitys(data){
    data.data.forEach(function(city){

      let option = `<option value="${city.name}">${city.name}</option>`
      target.append(option)
    });
  }

  function startCity(){


    target.empty()
    if ($(".select_state").find('option:selected')[0] == undefined) {
      return false;
    }
    let state = Number($(".select_state").find('option:selected')[0].index)
    state += 1

    if (state < 10) {
      state = ("0"+state).slice(-2)
    }

    let url =""

    if (App.cable.url.match(/local/)) {
      console.log(App.cable.url)
      url = `http://www.land.mlit.go.jp/webland/api/CitySearch?area=${state}`
    }
    else{
      console.log(App.cable.url)
      url = `//www.land.mlit.go.jp/webland/api/CitySearch?area=${state}`
    }

    console.log(url)
    $.ajax({
      url: url,
      type: "GET",
      dataType: 'json',
    })
    .done(function(data){
      replaceCitys(data)

    })
    .fail(function() {
      alert("もう一度都道府県を選びなおしてください")
    });

  }


  if ($(".select_citys").length ){
    startCity()
  }

  $(".select_state").on("change", function(){
    startCity()
  })
});