class AddTitleToArtpiece < ActiveRecord::Migration[5.0]
  def change
    add_column :artpieces, :title, :string
  end
end
