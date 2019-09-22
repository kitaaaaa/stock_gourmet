class CreateUserTags < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tags do |t|
      t.references :user, foreign_key: true
      t.references :tag, foreign_key: true
      #多対多のため、中間テーブルが必要(assosiation)。
      #bundle exec rails g model X_Y X:references Y:references
      t.timestamps
    end
  end
  
end
