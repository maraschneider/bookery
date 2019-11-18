class Book < ApplicationRecord
  belongs_to :user
  has_many :rentals
  validates :title, :language, presence: true
end
