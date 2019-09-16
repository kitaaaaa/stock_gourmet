# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Restaurant.create!(name: "default")
restaurants = %w[次郎　スタバ　ゴンチャ　ターリー屋　武道家　JSバーガー　tacobel shakeshack　慎]
restaurants.each { |w| Restaurant.create!(name: w) }

Genre.create!(name: "default")
genres = %w[ラーメン　ハンバーガー　カフェ　うどん　そば　パスタ　寿司　カレー　タピオカ　オムライス]
genres.create!{|w| Genre.create!(name: w)}

Station.create!(name: "default")
stations = %w[大宮　川越　新宿　渋谷　松戸　横浜　表参道　六本木]
stations.create!{|w| Genre.create!(name: w)}

