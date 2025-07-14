class CreatePictures < ActiveRecord::Migration[7.1]
  def change
    create_table :pictures do |t|
      t.integer :picture_type

      t.timestamps
    end
  end
end
