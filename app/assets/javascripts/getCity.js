$(document).on('turbolinks:load', function(){
  const target = $(".select_citys")

  function replaceCitys(data){
    data.result.forEach(function(city){

      let option = `<option value="${city.cityName}">${city.cityName}</option>`
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

    let url = `https://opendata.resas-portal.go.jp/api/v1/cities?prefCode=${state}`
    const api_key = "sLXRi2Ovt21lcBxeFykUus8r0XIiHIAqtPrxntoW"
    $.ajax({
      headers: {
        "X-API-KEY" : api_key
       },
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