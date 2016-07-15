class Railcar < ActiveRecord::Base
  belongs_to :train
  belongs_to :railcar_type
end
