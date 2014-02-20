class Gauge < ActiveRecord::Base
  validates :name, presence: true
  validates :lat, presence: true, numericality: { less_than_or_equal_to: 180, greater_than_or_equal_to: -180}
  validates :long, presence: true, numericality: { less_than_or_equal_to: 180, greater_than_or_equal_to: -180}

  def to_geojson
    {
       type: "Feature",
       geometry: {
                   type: "Point"
                 },
       properties: {
                     title: name
                   }
     }
  end

end
