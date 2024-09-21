class AddFieldsToRegistration < ActiveRecord::Migration[7.1]
  def change
    add_column :registrations, :hotel_email, :string
    add_column :registrations, :hotel_start_date, :date, default: '2025-06-08'
    add_column :registrations, :hotel_end_date, :date, default: '2025-06-08'
    add_column :registrations, :hotel_number_double_rooms, :integer, default: 0
    add_column :registrations, :hotel_number_single_rooms, :integer, default: 0
    add_column :registrations, :hotel_number_of_adults, :integer, default: 0
    add_column :registrations, :hotel_number_of_children, :integer, default: 0
    add_column :registrations, :hotel_comments, :string
  end
end
