class Train < ActiveRecord::Base
  validates :number, presence: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :railcars
  attr_accessor :railcars_attached

  def seats_type_1
    count_up = railcars.where(railcar_type: 1).pluck(:upper_seats).inject(0, :+)
    count_down = railcars.where(railcar_type: 1).pluck(:lower_seats).inject(0, :+)
    [count_up,count_down]
  end

  def seats_type_2
    count_up = railcars.where(railcar_type: 2).pluck(:upper_seats).inject(0, :+)
    count_down = railcars.where(railcar_type: 2).pluck(:lower_seats).inject(0, :+)
    count_s_up = railcars.where(railcar_type: 2).pluck(:side_upper_seats).inject(0, :+)
    count_s_down = railcars.where(railcar_type: 2).pluck(:side_lower_seats).inject(0, :+)
    [count_up,count_down,count_s_up,count_s_down]
  end

  def seats_type_3
    count_down = railcars.where(railcar_type: 3).pluck(:lower_seats).inject(0, :+)
    count_down
  end

  def seats_type_4
    count_seating = railcars.where(railcar_type: 4).pluck(:seating_seats).inject(0, :+)
    count_seating
  end
end

# upper_seat_number: 123, lower_seat_number