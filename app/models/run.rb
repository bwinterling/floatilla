class Run < ActiveRecord::Base
  belongs_to :river
  has_many :gauges
end
