class AddLendingLocationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lending_location, :string
  end
end
