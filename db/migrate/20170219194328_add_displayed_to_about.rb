class AddDisplayedToAbout < ActiveRecord::Migration[5.0]
  def change
    add_column :abouts, :displayed, :boolean
  end
end
