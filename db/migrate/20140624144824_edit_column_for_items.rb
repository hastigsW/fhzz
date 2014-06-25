class EditColumnForItems < ActiveRecord::Migration
  def change
  	rename_column :items, :item_type_id, :category_id
  	add_column :items, :v_type, :string
  end
end
