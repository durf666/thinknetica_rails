class CoupeRailcar < Railcar
  validates :upper_seats, :lower_seats, presence: true
end