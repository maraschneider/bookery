class AddProfilePictureToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_picture, :string, default: "image/upload/v1574343472/jhud7dabpplnqwvpfufj.jpg"
  end
end
