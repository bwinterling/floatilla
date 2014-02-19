class Gauge < ActiveRecord::Base
  validates :name, presence: true
  validates :lat, presence: true
  validates :long, presence: true
end
