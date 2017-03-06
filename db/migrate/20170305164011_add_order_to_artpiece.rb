class AddOrderToArtpiece < ActiveRecord::Migration[5.0]
  def change
    add_column :artpieces, :order, :integer
  end
end
