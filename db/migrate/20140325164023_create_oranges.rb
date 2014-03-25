class CreateOranges < ActiveRecord::Migration
  def change
    create_table :oranges do |t|
      t.string :variety
      t.integer :sweetness_level

      t.timestamps
    end
  end
end
