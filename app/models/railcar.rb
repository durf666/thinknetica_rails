class Railcar < ActiveRecord::Base
  belongs_to :train
  belongs_to :railcar_type
  validates :number, presence: true
  validate :correct_seats
  before_validation :set_type
  before_validation :set_number, if: :number_nil?
  # validates_uniqueness_of :number, :scope => :train_id
  validates :number, uniqueness: { scope: :train, message: " must be unique for train" }
  def set_type
    case self.railcar_type_id
    when 1 
      self.type= 'CoupeRailcar'
    when 2
      self.type= 'EconomyRailcar'      
    when 3
      self.type= 'LuxRailcar'      
    when 4
      self.type= 'SeatingRailcar'
    end
  end

  def correct_seats
    case self.railcar_type_id
    when 1
      unless self.side_lower_seats.nil? && self.side_upper_seats.nil? && self.seating_seats.nil?
        errors.add(:base, "side seats and seating seats must be blank")
      end
      if self.lower_seats.nil? || self.upper_seats.nil?
        errors.add(:base, "upper and lower seats can't be blank")
      end
    when 2
      unless self.seating_seats.nil?
        errors.add(:base, "seating seats must be blank")
      end
      if self.lower_seats.nil? || self.upper_seats.nil? || self.side_lower_seats.nil? || self.side_upper_seats.nil?
        errors.add(:base, "upper, lower and side seats can't be blank")
      end      
    when 3
      unless self.seating_seats.nil? && self.upper_seats.nil? && self.side_lower_seats.nil? && self.side_upper_seats.nil?
        errors.add(:base, "seating, upper and side seats must be blank")
      end
      if self.lower_seats.nil?
        errors.add(:base, "lower seats can't be blank")
      end      
    when 4
      unless self.lower_seats.nil? && self.upper_seats.nil? && self.side_lower_seats.nil? && self.side_upper_seats.nil?
        errors.add(:base, "lower, upper and side seats must be blank")
      end
      if self.seating_seats.nil?
        errors.add(:base, "seating seats can't be blank") 
      end
    end
  end


  def set_number
    @numbers = [0]
    self.number ||= 0
    self.train.railcars.each do |car|
      @numbers << car.number 
    end
    self.number= @numbers.max + 1
  end

  def number_nil?
    if self.number.nil?
      true
    else
      false
    end
  end
end
