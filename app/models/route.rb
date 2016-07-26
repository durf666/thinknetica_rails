class Route < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains
  # def stations_on_route
  # 	stations = RailwayStation.joins(:railway_stations_routes).select('distinct railway_stations.*, railway_stations_routes.route_id as route_id')
  # end
# d= RailwayStation.order_by_route_pos.where('railway_stations_routes.route_id =')
  def stations_on_route
    RailwayStation.order_by_route_pos.where(railway_stations_routes: { route_id: self.id })
  end
end
