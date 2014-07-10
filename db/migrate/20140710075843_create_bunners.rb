class CreateBunners < ActiveRecord::Migration
  def change
    create_table :bunners do |t|
      t.string :avatar

      t.timestamps
    end
  end
end
