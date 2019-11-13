# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Favorite.delete_all
Stock.all
Restaurant.delete_all
Genre.delete_all
# StationTrain.delete_all
# Train.delete_all
Station.delete_all



genre_names = %w[ラーメン ハンバーガー カフェ うどん そば パスタ 寿司 カレー タピオカ オムライス]
genre_names.each do |genre_name|
	Genre.create(name: genre_name)
end


# trains.each{|w| Train.create!(name: w)}
# Station.create!(name: "default", address: "埼玉県さいたま市大宮区桜木町")
station_names = %w(大宮 川越 渋谷 池袋 松戸 横浜 表参道 六本木 金沢 大阪)
# stations.each{|w| Station.create!(name: w)}

#A.zip(B).each do |c|で、AとBの配列の最前列から表示する
# train_names.zip(station_names).each do |train_name, station_name|
# 	station = Station.create(name: station_name)
# 	train = Train.create(name: train_name)
# 	station_train = StationTrain.create!(station_id: station.id, train_id: train.id)
# end

restaurants = %w[次郎 スタバ ゴンチャ ターリー屋 武道家 JSバーガー tacobel shakeshack 慎 はま寿司 長崎チャンポン]
#restaurants.each { |w| Restaurant.create!(name: w) }

station_names.zip(genre_names).each do |station_name, genre_name|
	station = Station.create(name: station_name)
	genre = Genre.create(name: genre_name)
	 Restaurant.create!(name: "default", genre_id: genre.id, station_id: station.id)

end


 Admin.create!(
 					name: "rr",
 					email: "rr@rr",
 					#telephone_number: "33344445555",
 					password: "password"
 					)
#本番環境では、コンソールで設定


