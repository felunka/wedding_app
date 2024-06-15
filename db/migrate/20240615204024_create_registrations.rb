class CreateRegistrations < ActiveRecord::Migration[7.1]
  def change
    create_table :registrations, &:timestamps
  end
end
