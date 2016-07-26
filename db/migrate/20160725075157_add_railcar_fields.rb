class AddRailcarFields < ActiveRecord::Migration
  def change
    change_table :railcars do |t|
      t.integer :number
      t.integer :side_upper_seats
      t.integer :side_lower_seats
      t.integer :seating_seats
      t.string :type
    end
  end
end
