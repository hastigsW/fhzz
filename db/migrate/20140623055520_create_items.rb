class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :item_type_id
      t.string :name
      t.string :sub_title
      t.string :image_url
      t.string :url
      t.text :desc

      t.timestamps
    end
  end
end
