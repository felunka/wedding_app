class CreateRegistrationEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :registration_entries do |t|
      t.references :registration, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :food_selection, default: 0, null: false
      t.string :comment
      t.boolean :all_days, default: true, null: false

      t.timestamps
    end
  end
end
