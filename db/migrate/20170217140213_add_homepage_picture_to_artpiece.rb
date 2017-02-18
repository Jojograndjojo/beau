class AddHomepagePictureToArtpiece < ActiveRecord::Migration[5.0]
  def change
    add_column :artpieces, :homepage_picture, :boolean
  end
end
