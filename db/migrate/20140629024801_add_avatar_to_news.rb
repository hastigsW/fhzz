class AddAvatarToNews < ActiveRecord::Migration
  def change
  	remove_column :news, :image 
    add_column :news, :avatar, :string
  end
end
