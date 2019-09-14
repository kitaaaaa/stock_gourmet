class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :favorite
	has_many :relationship
#	belongs_to :tag

	#presence、左の要素が存在するときtrue、なければ無効。
	validates :family_name, presence: true
	validates :first_name, presence: true
	validates :family_name_kana, presence: true
	validates :first_name_kana, presence: true
	validates :postal_code, presence: true
 	validates :address, presence: true
	validates :telephone_number, presence: true
	validates :email, presence: true
end
