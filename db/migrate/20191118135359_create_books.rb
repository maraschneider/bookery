class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :language
      t.references :user, foreign_key: true
      t.string :image_url
      t.text :description
      t.integer :year

      t.timestamps
    end
  end
end
