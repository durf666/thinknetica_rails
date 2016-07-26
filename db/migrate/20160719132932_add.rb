class Add < ActiveRecord::Migration
  def change
  	change_table :railway_stations_routes do |t|
      t.integer :route_position
    end
  end
end
