class ChangeDefaultValueForHotelStartDate < ActiveRecord::Migration[7.1]
  def change
    change_column_default :registrations, :hotel_start_date, from: '2025-06-08', to: '2025-06-06'
  end
end
