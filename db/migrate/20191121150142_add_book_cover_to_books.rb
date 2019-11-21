class AddBookCoverToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :book_cover, :string, default: "image/upload/v1574343472/book_logo_hxmzkd"
  end
end
