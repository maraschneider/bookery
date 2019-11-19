class AddProfilePicToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_pic, :string, default: "https://cdn.designbyhumans.com/i/S0q2SgMDnZTMIquCovyU0uSSGP2U1OLM9LwY_VJDQ0MzC2MzoGyulZmpQQUQ6yRZGeoUWBkCAA.pr253160-2-2704838.jpg"
  end
end
