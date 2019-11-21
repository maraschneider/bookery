class Book < ApplicationRecord
  belongs_to :user
  has_many :rentals
  validates :title, :language, presence: true
  include PgSearch::Model
  pg_search_scope :search_by_title_author_year_language_genre,
    against: [ :title, :author, :year, :language, :genre ],
    using: {
      tsearch: { prefix: true }
    }
end
