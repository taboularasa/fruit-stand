class AddCartIdToApple < ActiveRecord::Migration
  def change
    add_column :apples, :cart_id, :integer
  end
end
