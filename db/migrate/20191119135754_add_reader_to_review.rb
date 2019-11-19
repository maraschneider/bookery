class AddReaderToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :is_reader, :boolean
  end
end
