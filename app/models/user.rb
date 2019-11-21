class User < ApplicationRecord
  has_many :rentals
  has_many :books
  has_many :own_book_rentals, through: :books, source: :rentals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
