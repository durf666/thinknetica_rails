class CreateRailwayStations < ActiveRecord::Migration
  def change
    create_table :railway_stations do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
