class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
	has_many :favorites, dependent: :destroy
	has_many :favorited_restaurants, through: :favorites, source: :restaurant
	has_many :stocks, dependent: :destroy
	has_many :stocked_restaurants, through: :stocks, source: :restaurant

	attachment :image

	#presence、左の要素が存在するときtrue、なければ無効。
	validates :name, presence: true
	validates :telephone_number, presence: true
	validates :email, presence: true

	has_many :relationships
	has_many :followings, through: :relationships, source: :follow
	has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
	has_many :followers, through: :reverse_of_relationships, source: :user

	def follow(other_user)
    	unless self == other_user
			self.relationships.find_or_create_by(follow_id: other_user.id)
    	end
	end

	def unfollow(other_user)
		relationship = self.relationships.find_by(follow_id: other_user.id)
		relationship.destroy if relationship
	end

	def following?(other_user)
		self.followings.include?(other_user)
	end
end
