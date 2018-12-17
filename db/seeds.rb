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