# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.delete_all
StationTrain.delete_all
Train.delete_all
Station.delete_all
Restaurant.delete_all



genre_names = %w[ラーメン ハンバーガー カフェ うどん そば パスタ 寿司 カレー タピオカ オムライス]
genre_names.each do |genre_name|
	Genre.create(name: genre_name)
end

# train = Train.create!(name: "default")
train_names = %w(JR京浜東北線 JR東海道線 銀座線 有楽町線 西武池袋線 東横線 JR山手線 JR北陸本線 新幹線) 
# trains.each{|w| Train.create!(name: w)}
# Station.create!(name: "default", address: "埼玉県さいたま市大宮区桜木町")
station_names = %w(大宮 川越 渋谷 池袋 松戸 横浜 表参道 六本木 金沢 大阪)
# stations.each{|w| Station.create!(name: w)}

#A.zip(B).each do |c|で、AとBの配列の最前列から表示する
train_names.zip(station_names).each do |train_name, station_name|
#	puts "train", train_names
#	puts "zip", train_names.zip(station_names)
	station = Station.create(name: station_name)
#	puts station
	train = Train.create(name: train_name)
#	puts train
	station_train = StationTrain.create!(station_id: station.id, train_id: train.id)
#	puts station_train
end

restaurants = %w[次郎 スタバ ゴンチャ ターリー屋 武道家 JSバーガー tacobel shakeshack 慎 はま寿司 長崎チャンポン]
#restaurants.each { |w| Restaurant.create!(name: w) }

station_names.zip(genre_names).each do |station_name, genre_name|
	station = Station.create(name: station_name)
	genre = Genre.create(name: genre_name)
	 Restaurant.create!(name: "default", genre_id: genre.id, station_id: station.id)

end


# favorite_names = %w[行きたい お気に入り]
# #with_index |i|で、iに対して0,1,2と数字をいれる。
# favorite_names.each_with_index do |favorite_name, i|
# 	Favorite.create(
# 		user: User.find(i + 1),
# 		restaurant: Restaurant.first,
# 		name: favorite_name
# 	)
# end