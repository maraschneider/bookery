class User < ApplicationRecord
  mount_uploader :profile_picture, ProfilePictureUploader
  has_many :rentals
  has_many :books
  has_many :own_book_rentals, through: :books, source: :rentals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  geocoded_by :lending_location
  after_validation :geocode, if: :will_save_change_to_lending_location?
end
