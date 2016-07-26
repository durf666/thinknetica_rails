class LuxRailcar < Railcar
  validates :lower_seats, presence: true
  validates :upper_seats, :side_upper_seats, :side_lower_seats, :seating_seats, absence: true
end