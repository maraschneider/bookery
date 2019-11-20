class Rental < ApplicationRecord
  STATUS_OPTIONS = %W(requested confirmed renting canceled closed)
  belongs_to :book
  belongs_to :user
  # belongs_to :user, through: :book
  has_many :reviews
  validates :book, :user, :start_date, :return_date, presence: true
  validates :status, inclusion: { in: STATUS_OPTIONS }
  # validates :user, through: :book, presence: true
end
