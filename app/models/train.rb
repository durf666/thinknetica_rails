class Train < ActiveRecord::Base
  validates :number, presence: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :railcars

  def seats_type_1
    count_up = railcars.where(railcar_type: 1).pluck(:upper_seat_number).inject(0, :+)
    count_down = railcars.where(railcar_type: 1).pluck(:lower_seat_number).inject(0, :+)
    [count_up,count_down]
  end

  def seats_type_2
    count_up = railcars.where(railcar_type: 2).pluck(:upper_seat_number).inject(0, :+)
    count_down = railcars.where(railcar_type: 2).pluck(:lower_seat_number).inject(0, :+)
    [count_up,count_down]
  end

end

# upper_seat_number: 123, lower_seat_number