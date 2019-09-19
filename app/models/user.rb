class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :favorites
	has_many :user_tags

	attachment :image

	#presence、左の要素が存在するときtrue、なければ無効。
	validates :family_name, presence: true
	validates :first_name, presence: true
	validates :family_name_kana, presence: true
	validates :first_name_kana, presence: true
	validates :postal_code, presence: true
 	validates :address, presence: true
	validates :telephone_number, presence: true
	validates :email, presence: true

	has_many :relationships
	has_many :followings, through: :relationships, source: :follow
	has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
	has_many :followers, through: :reverse_of_relationships, source: :user
end
