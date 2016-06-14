class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :railway_stations
  belongs_to :route
end