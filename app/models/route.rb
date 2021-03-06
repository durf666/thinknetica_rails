class Route < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_one :route
  has_many :trains
end
