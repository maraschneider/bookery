class AddColumnsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :author, :string
    add_column :books, :genre, :string
    add_column :books, :rented, :boolean, default: false
  end
end
