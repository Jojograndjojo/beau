class AddContentToAbout < ActiveRecord::Migration[5.0]
  def change
    add_column :abouts, :content, :string
  end
end
