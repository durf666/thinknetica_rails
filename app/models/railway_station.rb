class RailwayStation < ActiveRecord::Base
  validates :name, presence: true
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets
  scope :order_by_route_pos, -> {joins(:railway_stations_routes).order('railway_stations_routes.route_position')}
end
