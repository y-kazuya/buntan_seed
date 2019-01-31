# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

usages = %W[ 会議・研修場 写真撮影・ロケ撮影 イベント 演奏・パフォーマンス 個展・展覧会  商業施設 カフェ 公的施設 オフィス
  宿泊施設 その他]

usages.each { |a| Usage.create(name: a) }

tags = %W[ 小学校跡 国道沿い 山奥 古民家 好立地 ]

tags.each { |a| Tag.create(name: a, official: true)}

cates = [{name: "土地", path_name: "land"}, {name: "山", path_name: "mountain"}, {name: "畑", path_name: "hatake"}, {name: "建物", path_name: "building"}]

cates.each { |cate| Category.create(name: cate[:name], path_name: cate[:path_name]) }

# land_sub_cates = [{name: "山", path_name: "mountain"}, {name: "畑", path_name: "hatake"}, {name: "空き地", path_name: "akiti"}]
# land_id = Category.find_by(name: "土地").id
# land_sub_cates.each { |cate| SubCategory.create(name: cate[:name], path_name: cate[:path_name], category_id: land_id) }

# building_sub_cates = [{name: "空家", path_name: "akiya"}, {name: "小屋", path_name: "koya"}, {name: "公共施設跡", path_name: "public"}, {name: "商業施設跡", path_name: "stores"}]
# building_id = Category.find_by(name: "建物").id
# building_sub_cates.each { |cate| SubCategory.create(name: cate[:name], path_name: cate[:path_name], category_id: building_id) }