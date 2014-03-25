class AddCartIdToOrange < ActiveRecord::Migration
  def change
    add_column :oranges, :cart_id, :integer
  end
end
