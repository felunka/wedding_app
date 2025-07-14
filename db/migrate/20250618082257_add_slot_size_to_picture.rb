class AddSlotSizeToPicture < ActiveRecord::Migration[7.1]
  def change
    add_column :pictures, :slot_size, :integer, default: 1
  end
end
