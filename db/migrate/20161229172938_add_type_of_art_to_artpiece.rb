class AddTypeOfArtToArtpiece < ActiveRecord::Migration[5.0]
  def change
    add_column :artpieces, :type_of_art, :string
  end
end
