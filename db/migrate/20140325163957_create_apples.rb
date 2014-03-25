class CreateApples < ActiveRecord::Migration
  def change
    create_table :apples do |t|
      t.string :variety
      t.integer :juiciness_level

      t.timestamps
    end
  end
end
