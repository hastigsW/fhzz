class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :image
      t.string :url
      t.text :content

      t.timestamps
    end
  end
end
