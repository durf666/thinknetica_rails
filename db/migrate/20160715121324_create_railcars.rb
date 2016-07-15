class CreateRailcars < ActiveRecord::Migration
  def change
    create_table :railcars do |t|
      t.integer :upper_seat_number
      t.integer :lower_seat_number
      t.belongs_to :railcar_type, :train
    end
  end
end
