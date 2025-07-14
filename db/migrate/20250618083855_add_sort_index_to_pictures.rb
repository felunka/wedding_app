class AddSortIndexToPictures < ActiveRecord::Migration[7.1]
  def change
    add_column :pictures, :sort_index, :integer
  end
end
