class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.date :start_date
      t.date :return_date

      t.timestamps
    end
  end
end
