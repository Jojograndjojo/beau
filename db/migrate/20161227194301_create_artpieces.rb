class CreateArtpieces < ActiveRecord::Migration[5.0]
  def change
    create_table :artpieces do |t|

      t.timestamps
    end
  end
end
