class Api::GetItemsController < ActionController::Base

  def index
    # データが入ったらコメントアウトをとる
    # @item = Item.all
    # @item = {title: @item.title, city: @item.city and more...}

    @items = [
      {id: 1, title: '高知市土佐山', profile: '眺めが綺麗です', remark: '', state: 39, city: '高知市', comment: '', user_id: 1, created_at: '2018-10-13 03:20:11', updated_at: '2018-10-13 03:22:11'},
      {id: 2, title: 'アユが釣れる汗見川', profile: '川が綺麗です', remark: '', state: 39, city: '高知市', comment: '', user_id: 1, created_at: '2018-10-13 03:20:11', updated_at: '2018-10-13 03:22:11'},
      {id: 3, title: '大豊の山', profile: '碁石茶美味しい', remark: '', state: 39, city: '大豊町', comment: '', user_id: 1, created_at: '2018-10-13 03:20:11', updated_at: '2018-10-13 03:22:11'},
      {id: 4, title: '南国でアクセス良し', profile: '龍馬空港の近く', remark: '', state: 39, city: '南国し', comment: '', user_id: 1, created_at: '2018-10-13 03:20:11', updated_at: '2018-10-13 03:22:11'},
      {id: 5, title: '仁淀川の穴場', profile: '仁淀ブルーで', remark: '', state: 39, city: '仁淀川町', comment: '', user_id: 1, created_at: '2018-10-13 03:20:11', updated_at: '2018-10-13 03:22:11'}
    ]

    respond_to do |format|
      format.json {render :json => @items}
    end

  end

end
