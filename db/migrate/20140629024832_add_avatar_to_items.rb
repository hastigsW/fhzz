class AddAvatarToItems < ActiveRecord::Migration
  def change
  	remove_column :items, :image_url 
    add_column :items, :avatar, :string
  end
end
