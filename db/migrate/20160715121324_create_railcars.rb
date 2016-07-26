class CreateRailcars < ActiveRecord::Migration
  def change
    create_table :railcars do |t|
      t.integer :upper_seats
      t.integer :lower_seats
      t.belongs_to :railcar_type, :train
    end
  end
end
