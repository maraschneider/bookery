class Rental < ApplicationRecord
  belongs_to :book
  belongs_to :user
  belongs_to :user, through: :book

  validates :book, :user, :start_date, :return_date, presence: true
  validates :user, through: :book, presence: true
end
